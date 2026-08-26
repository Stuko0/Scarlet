#!/usr/bin/env python3
"""Genera tiles SQLite del grafo vial de Bolivia desde OpenStreetMap.

Cada tile cubre 0.5 x 0.5 con un buffer de 0.1 para asegurar conectividad.
Los tiles se escriben en tools/tiles/ como s{LAT}_w{LON}.db.
"""

import os
import sqlite3
import urllib.request

PBF_URL = "https://download.geofabrik.de/south-america/bolivia-latest.osm.pbf"
PBF_PATH = "bolivia-latest.osm.pbf"

OUTPUT_DIR = "tools/tiles"
os.makedirs(OUTPUT_DIR, exist_ok=True)

LAT_MIN, LAT_MAX = -23.0, -9.0
LON_MIN, LON_MAX = -70.0, -57.0
TILE_SIZE = 0.5
BUFFER = 0.1


def download_pbf():
    if os.path.exists(PBF_PATH):
        print(f"PBF ya existe: {PBF_PATH}")
        return
    print(f"Descargando {PBF_URL} ...")
    urllib.request.urlretrieve(PBF_URL, PBF_PATH)
    print("Descarga completa.")


def build_graph():
    print("Construyendo grafo vial ...")
    import osmnx as ox
    G = ox.graph_from_xml(PBF_PATH, bidirectional=False, simplify=True, retain_all=False)
    print(f"Grafo cargado: {len(G.nodes)} nodos, {len(G.edges)} aristas")
    return G


def bbox_edges(G, lat_s, lon_w):
    lat_min = lat_s
    lat_max = lat_s + TILE_SIZE
    lon_min = lon_w
    lon_max = lon_w + TILE_SIZE

    buf_lat_min = lat_min - BUFFER
    buf_lat_max = lat_max + BUFFER
    buf_lon_min = lon_min - BUFFER
    buf_lon_max = lon_max + BUFFER

    nodes_in = set()
    node_coords = {}
    for nid, data in G.nodes(data=True):
        lat = data["y"]
        lon = data["x"]
        if buf_lat_min <= lat <= buf_lat_max and buf_lon_min <= lon <= buf_lon_max:
            nodes_in.add(nid)
            node_coords[nid] = (lat, lon)

    edges_out = []
    for u, v, data in G.edges(data=True):
        if u in nodes_in and v in nodes_in:
            length = data.get("length", 0.0)
            geom = data.get("geometry", None)
            if geom is None:
                coords_u = node_coords[u]
                coords_v = node_coords[v]
                geom_str = f"{coords_u[0]},{coords_u[1]};{coords_v[0]},{coords_v[1]}"
            else:
                points = [f"{p[1]},{p[0]}" for p in geom.coords]
                geom_str = ";".join(points)
            edges_out.append((u, v, length, geom_str))

    return nodes_in, node_coords, edges_out


def write_tile(lat_s, lon_w, nodes_in, node_coords, edges_out):
    if len(edges_out) < 2:
        return

    key = f"s{abs(lat_s):.1f}_w{abs(lon_w):.1f}"
    if lat_s >= 0:
        key = f"n{lat_s:.1f}_w{abs(lon_w):.1f}"
    if lon_w >= 0:
        if lat_s < 0:
            key = f"s{abs(lat_s):.1f}_e{lon_w:.1f}"
        else:
            key = f"n{lat_s:.1f}_e{lon_w:.1f}"

    db_path = os.path.join(OUTPUT_DIR, f"{key}.db")
    conn = sqlite3.connect(db_path)
    c = conn.cursor()
    c.execute("CREATE TABLE nodes (id INTEGER PRIMARY KEY, lat REAL, lon REAL)")
    c.execute("CREATE TABLE edges (u INTEGER, v INTEGER, length REAL, geometry TEXT)")
    c.execute("CREATE INDEX IF NOT EXISTS idx_edges_u ON edges(u)")
    c.execute("CREATE INDEX IF NOT EXISTS idx_edges_v ON edges(v)")

    for nid in nodes_in:
        lat, lon = node_coords[nid]
        c.execute("INSERT INTO nodes VALUES (?, ?, ?)", (nid, lat, lon))

    c.executemany("INSERT INTO edges VALUES (?, ?, ?, ?)", edges_out)

    conn.commit()
    conn.close()


def main():
    download_pbf()
    G = build_graph()

    total_tiles = 0
    lat = LAT_MIN
    while lat < LAT_MAX:
        lon = LON_MIN
        while lon < LON_MAX:
            nodes_in, node_coords, edges_out = bbox_edges(G, lat, lon)
            if len(edges_out) >= 2:
                write_tile(lat, lon, nodes_in, node_coords, edges_out)
                total_tiles += 1
            lon += TILE_SIZE
        lat += TILE_SIZE

    print(f"Generados {total_tiles} tiles en {OUTPUT_DIR}/")


if __name__ == "__main__":
    main()
