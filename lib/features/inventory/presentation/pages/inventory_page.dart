import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/inventory_controller.dart';
import '../../domain/asset_entity.dart';

class InventoryPage extends ConsumerWidget {
  const InventoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inventoryAsync = ref.watch(inventoryListProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text(
          'INVENTARIO DE RECURSOS',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.2,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF1E1E1E),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: () => ref.invalidate(inventoryListProvider),
          ),
        ],
      ),
      body: inventoryAsync.when(
        data: (assets) => RefreshIndicator(
          onRefresh: () async => ref.invalidate(inventoryListProvider),
          color: const Color(0xFFFB5335),
          child: assets.isEmpty
              ? _buildEmptyState()
              : ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: assets.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 12),
                  itemBuilder: (context, index) => _AssetCard(asset: assets[index]),
                ),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(color: Color(0xFFFB5335)),
        ),
        error: (err, stack) => _buildErrorState(err.toString(), ref),
      ),
    );
  }

  Widget _buildEmptyState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.inventory_2_outlined, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'No hay activos registrados',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(String error, WidgetRef ref) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 48, color: Colors.redAccent),
            const SizedBox(height: 16),
            Text(
              'Error al cargar inventario:\n$error',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => ref.invalidate(inventoryListProvider),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFB5335),
              ),
              child: const Text('REINTENTAR'),
            ),
          ],
        ),
      ),
    );
  }
}

class _AssetCard extends ConsumerWidget {
  final Asset asset;

  const _AssetCard({required this.asset});

  Color _getStatusColor(String status) {
    status = status.toUpperCase();
    if (status.contains('READY') || status.contains('DISPONIBLE')) return Colors.green;
    if (status.contains('SERVICE') || status.contains('DEPLOYED') || status.contains('DESPLEGADO')) return Colors.blue;
    if (status.contains('MAINTENANCE') || status.contains('MANTENIMIENTO')) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white10),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _showAssetDetails(context, ref),
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      asset.callsign,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'monospace',
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: _getStatusColor(asset.status).withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: _getStatusColor(asset.status).withValues(alpha: 0.5)),
                      ),
                      child: Text(
                        asset.status.toUpperCase(),
                        style: TextStyle(
                          color: _getStatusColor(asset.status),
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(Icons.category_outlined, size: 14, color: Colors.grey),
                    const SizedBox(width: 6),
                    Text(
                      asset.category,
                      style: const TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                    const Spacer(),
                    if (asset.fuelLevelPercent != null) ...[
                      Icon(
                        Icons.local_gas_station,
                        size: 14,
                        color: asset.fuelLevelPercent! < 25 ? Colors.red : Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${asset.fuelLevelPercent}%',
                        style: TextStyle(
                          color: asset.fuelLevelPercent! < 25 ? Colors.red : Colors.white70,
                          fontSize: 13,
                          fontWeight: asset.fuelLevelPercent! < 25 ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ],
                  ],
                ),
                if (asset.waterCapacityLiters != null && asset.waterCapacityLiters! > 0) ...[
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.water_drop_outlined, size: 14, color: Colors.blueAccent),
                      const SizedBox(width: 6),
                      Text(
                        '${asset.waterCapacityLiters} L',
                        style: const TextStyle(color: Colors.white70, fontSize: 13),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showAssetDetails(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1E1E1E),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Gestión de Activo: ${asset.callsign}',
              style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Categoría: ${asset.category}',
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const Divider(color: Colors.white10, height: 32),
            const Text(
              'ACTUALIZAR ESTADO',
              style: TextStyle(color: Colors.white54, fontSize: 10, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _StatusButton(
                  label: 'DISPONIBLE',
                  color: Colors.green,
                  onPressed: () => _updateStatus(context, ref, 'READY'),
                ),
                _StatusButton(
                  label: 'EN SERVICIO',
                  color: Colors.blue,
                  onPressed: () => _updateStatus(context, ref, 'IN_SERVICE'),
                ),
                _StatusButton(
                  label: 'MANTENIMIENTO',
                  color: Colors.orange,
                  onPressed: () => _updateStatus(context, ref, 'MAINTENANCE'),
                ),
              ],
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Future<void> _updateStatus(BuildContext context, WidgetRef ref, String status) async {
    Navigator.pop(context);
    await ref.read(inventoryControllerProvider.notifier).updateStatus(asset.id, status);
    
    if (context.mounted) {
      final error = ref.read(inventoryControllerProvider).error;
      if (error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $error'), backgroundColor: Colors.red),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Estado actualizado'), backgroundColor: Colors.green),
        );
      }
    }
  }
}

class _StatusButton extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onPressed;

  const _StatusButton({
    required this.label,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: color.withValues(alpha: 0.5)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 12),
        ),
      ),
    );
  }
}
