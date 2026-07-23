// This is a generated file - do not edit.
//
// Generated from protos/wildfire.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;
import 'package:protobuf/well_known_types/google/protobuf/empty.pb.dart' as $0;

import 'wildfire.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'wildfire.pbenum.dart';

class Fire extends $pb.GeneratedMessage {
  factory Fire({
    $core.String? eventId,
    $core.double? latitude,
    $core.double? longitude,
    $core.String? confidence,
    $core.double? temperature,
    $core.double? humidity,
    $core.double? wind,
    $core.double? frp,
    $core.double? brightness,
    $core.String? scan,
    $core.String? track,
    $core.String? satellite,
    $core.String? acqDate,
    $core.String? acqTime,
    $core.String? daynight,
    $core.String? sourceId,
    $core.double? fusedConfidence,
    $core.String? departamento,
    $core.String? municipio,
    $core.String? areaProtegida,
  }) {
    final result = create();
    if (eventId != null) result.eventId = eventId;
    if (latitude != null) result.latitude = latitude;
    if (longitude != null) result.longitude = longitude;
    if (confidence != null) result.confidence = confidence;
    if (temperature != null) result.temperature = temperature;
    if (humidity != null) result.humidity = humidity;
    if (wind != null) result.wind = wind;
    if (frp != null) result.frp = frp;
    if (brightness != null) result.brightness = brightness;
    if (scan != null) result.scan = scan;
    if (track != null) result.track = track;
    if (satellite != null) result.satellite = satellite;
    if (acqDate != null) result.acqDate = acqDate;
    if (acqTime != null) result.acqTime = acqTime;
    if (daynight != null) result.daynight = daynight;
    if (sourceId != null) result.sourceId = sourceId;
    if (fusedConfidence != null) result.fusedConfidence = fusedConfidence;
    if (departamento != null) result.departamento = departamento;
    if (municipio != null) result.municipio = municipio;
    if (areaProtegida != null) result.areaProtegida = areaProtegida;
    return result;
  }

  Fire._();

  factory Fire.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Fire.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Fire',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.wildfire.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'eventId')
    ..aD(2, _omitFieldNames ? '' : 'latitude')
    ..aD(3, _omitFieldNames ? '' : 'longitude')
    ..aOS(4, _omitFieldNames ? '' : 'confidence')
    ..aD(5, _omitFieldNames ? '' : 'temperature')
    ..aD(6, _omitFieldNames ? '' : 'humidity')
    ..aD(7, _omitFieldNames ? '' : 'wind')
    ..aD(8, _omitFieldNames ? '' : 'frp')
    ..aD(9, _omitFieldNames ? '' : 'brightness')
    ..aOS(10, _omitFieldNames ? '' : 'scan')
    ..aOS(11, _omitFieldNames ? '' : 'track')
    ..aOS(12, _omitFieldNames ? '' : 'satellite')
    ..aOS(13, _omitFieldNames ? '' : 'acqDate')
    ..aOS(14, _omitFieldNames ? '' : 'acqTime')
    ..aOS(15, _omitFieldNames ? '' : 'daynight')
    ..aOS(16, _omitFieldNames ? '' : 'sourceId')
    ..aD(17, _omitFieldNames ? '' : 'fusedConfidence')
    ..aOS(18, _omitFieldNames ? '' : 'departamento')
    ..aOS(19, _omitFieldNames ? '' : 'municipio')
    ..aOS(20, _omitFieldNames ? '' : 'areaProtegida')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Fire clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Fire copyWith(void Function(Fire) updates) =>
      super.copyWith((message) => updates(message as Fire)) as Fire;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Fire create() => Fire._();
  @$core.override
  Fire createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Fire getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Fire>(create);
  static Fire? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get eventId => $_getSZ(0);
  @$pb.TagNumber(1)
  set eventId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEventId() => $_has(0);
  @$pb.TagNumber(1)
  void clearEventId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get latitude => $_getN(1);
  @$pb.TagNumber(2)
  set latitude($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLatitude() => $_has(1);
  @$pb.TagNumber(2)
  void clearLatitude() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get longitude => $_getN(2);
  @$pb.TagNumber(3)
  set longitude($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLongitude() => $_has(2);
  @$pb.TagNumber(3)
  void clearLongitude() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get confidence => $_getSZ(3);
  @$pb.TagNumber(4)
  set confidence($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasConfidence() => $_has(3);
  @$pb.TagNumber(4)
  void clearConfidence() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.double get temperature => $_getN(4);
  @$pb.TagNumber(5)
  set temperature($core.double value) => $_setDouble(4, value);
  @$pb.TagNumber(5)
  $core.bool hasTemperature() => $_has(4);
  @$pb.TagNumber(5)
  void clearTemperature() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.double get humidity => $_getN(5);
  @$pb.TagNumber(6)
  set humidity($core.double value) => $_setDouble(5, value);
  @$pb.TagNumber(6)
  $core.bool hasHumidity() => $_has(5);
  @$pb.TagNumber(6)
  void clearHumidity() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.double get wind => $_getN(6);
  @$pb.TagNumber(7)
  set wind($core.double value) => $_setDouble(6, value);
  @$pb.TagNumber(7)
  $core.bool hasWind() => $_has(6);
  @$pb.TagNumber(7)
  void clearWind() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.double get frp => $_getN(7);
  @$pb.TagNumber(8)
  set frp($core.double value) => $_setDouble(7, value);
  @$pb.TagNumber(8)
  $core.bool hasFrp() => $_has(7);
  @$pb.TagNumber(8)
  void clearFrp() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.double get brightness => $_getN(8);
  @$pb.TagNumber(9)
  set brightness($core.double value) => $_setDouble(8, value);
  @$pb.TagNumber(9)
  $core.bool hasBrightness() => $_has(8);
  @$pb.TagNumber(9)
  void clearBrightness() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get scan => $_getSZ(9);
  @$pb.TagNumber(10)
  set scan($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasScan() => $_has(9);
  @$pb.TagNumber(10)
  void clearScan() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.String get track => $_getSZ(10);
  @$pb.TagNumber(11)
  set track($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasTrack() => $_has(10);
  @$pb.TagNumber(11)
  void clearTrack() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.String get satellite => $_getSZ(11);
  @$pb.TagNumber(12)
  set satellite($core.String value) => $_setString(11, value);
  @$pb.TagNumber(12)
  $core.bool hasSatellite() => $_has(11);
  @$pb.TagNumber(12)
  void clearSatellite() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.String get acqDate => $_getSZ(12);
  @$pb.TagNumber(13)
  set acqDate($core.String value) => $_setString(12, value);
  @$pb.TagNumber(13)
  $core.bool hasAcqDate() => $_has(12);
  @$pb.TagNumber(13)
  void clearAcqDate() => $_clearField(13);

  @$pb.TagNumber(14)
  $core.String get acqTime => $_getSZ(13);
  @$pb.TagNumber(14)
  set acqTime($core.String value) => $_setString(13, value);
  @$pb.TagNumber(14)
  $core.bool hasAcqTime() => $_has(13);
  @$pb.TagNumber(14)
  void clearAcqTime() => $_clearField(14);

  @$pb.TagNumber(15)
  $core.String get daynight => $_getSZ(14);
  @$pb.TagNumber(15)
  set daynight($core.String value) => $_setString(14, value);
  @$pb.TagNumber(15)
  $core.bool hasDaynight() => $_has(14);
  @$pb.TagNumber(15)
  void clearDaynight() => $_clearField(15);

  @$pb.TagNumber(16)
  $core.String get sourceId => $_getSZ(15);
  @$pb.TagNumber(16)
  set sourceId($core.String value) => $_setString(15, value);
  @$pb.TagNumber(16)
  $core.bool hasSourceId() => $_has(15);
  @$pb.TagNumber(16)
  void clearSourceId() => $_clearField(16);

  @$pb.TagNumber(17)
  $core.double get fusedConfidence => $_getN(16);
  @$pb.TagNumber(17)
  set fusedConfidence($core.double value) => $_setDouble(16, value);
  @$pb.TagNumber(17)
  $core.bool hasFusedConfidence() => $_has(16);
  @$pb.TagNumber(17)
  void clearFusedConfidence() => $_clearField(17);

  @$pb.TagNumber(18)
  $core.String get departamento => $_getSZ(17);
  @$pb.TagNumber(18)
  set departamento($core.String value) => $_setString(17, value);
  @$pb.TagNumber(18)
  $core.bool hasDepartamento() => $_has(17);
  @$pb.TagNumber(18)
  void clearDepartamento() => $_clearField(18);

  @$pb.TagNumber(19)
  $core.String get municipio => $_getSZ(18);
  @$pb.TagNumber(19)
  set municipio($core.String value) => $_setString(18, value);
  @$pb.TagNumber(19)
  $core.bool hasMunicipio() => $_has(18);
  @$pb.TagNumber(19)
  void clearMunicipio() => $_clearField(19);

  @$pb.TagNumber(20)
  $core.String get areaProtegida => $_getSZ(19);
  @$pb.TagNumber(20)
  set areaProtegida($core.String value) => $_setString(19, value);
  @$pb.TagNumber(20)
  $core.bool hasAreaProtegida() => $_has(19);
  @$pb.TagNumber(20)
  void clearAreaProtegida() => $_clearField(20);
}

class FireListResponse extends $pb.GeneratedMessage {
  factory FireListResponse({
    $core.Iterable<Fire>? fires,
  }) {
    final result = create();
    if (fires != null) result.fires.addAll(fires);
    return result;
  }

  FireListResponse._();

  factory FireListResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FireListResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FireListResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.wildfire.v1'),
      createEmptyInstance: create)
    ..pPM<Fire>(1, _omitFieldNames ? '' : 'fires', subBuilder: Fire.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FireListResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FireListResponse copyWith(void Function(FireListResponse) updates) =>
      super.copyWith((message) => updates(message as FireListResponse))
          as FireListResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FireListResponse create() => FireListResponse._();
  @$core.override
  FireListResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FireListResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FireListResponse>(create);
  static FireListResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Fire> get fires => $_getList(0);
}

class FusedHotspot extends $pb.GeneratedMessage {
  factory FusedHotspot({
    $core.String? cellId,
    $core.double? latCenter,
    $core.double? lonCenter,
    $core.double? fusedConfidence,
    $core.Iterable<$core.String>? sourcesCorroborating,
    $core.String? recommendedState,
    $core.String? windowStart,
    $core.String? windowEnd,
    $core.String? departamento,
  }) {
    final result = create();
    if (cellId != null) result.cellId = cellId;
    if (latCenter != null) result.latCenter = latCenter;
    if (lonCenter != null) result.lonCenter = lonCenter;
    if (fusedConfidence != null) result.fusedConfidence = fusedConfidence;
    if (sourcesCorroborating != null)
      result.sourcesCorroborating.addAll(sourcesCorroborating);
    if (recommendedState != null) result.recommendedState = recommendedState;
    if (windowStart != null) result.windowStart = windowStart;
    if (windowEnd != null) result.windowEnd = windowEnd;
    if (departamento != null) result.departamento = departamento;
    return result;
  }

  FusedHotspot._();

  factory FusedHotspot.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FusedHotspot.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FusedHotspot',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.wildfire.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'cellId')
    ..aD(2, _omitFieldNames ? '' : 'latCenter')
    ..aD(3, _omitFieldNames ? '' : 'lonCenter')
    ..aD(4, _omitFieldNames ? '' : 'fusedConfidence')
    ..pPS(5, _omitFieldNames ? '' : 'sourcesCorroborating')
    ..aOS(6, _omitFieldNames ? '' : 'recommendedState')
    ..aOS(7, _omitFieldNames ? '' : 'windowStart')
    ..aOS(8, _omitFieldNames ? '' : 'windowEnd')
    ..aOS(9, _omitFieldNames ? '' : 'departamento')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FusedHotspot clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FusedHotspot copyWith(void Function(FusedHotspot) updates) =>
      super.copyWith((message) => updates(message as FusedHotspot))
          as FusedHotspot;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FusedHotspot create() => FusedHotspot._();
  @$core.override
  FusedHotspot createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FusedHotspot getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FusedHotspot>(create);
  static FusedHotspot? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get cellId => $_getSZ(0);
  @$pb.TagNumber(1)
  set cellId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCellId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCellId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get latCenter => $_getN(1);
  @$pb.TagNumber(2)
  set latCenter($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLatCenter() => $_has(1);
  @$pb.TagNumber(2)
  void clearLatCenter() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get lonCenter => $_getN(2);
  @$pb.TagNumber(3)
  set lonCenter($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLonCenter() => $_has(2);
  @$pb.TagNumber(3)
  void clearLonCenter() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.double get fusedConfidence => $_getN(3);
  @$pb.TagNumber(4)
  set fusedConfidence($core.double value) => $_setDouble(3, value);
  @$pb.TagNumber(4)
  $core.bool hasFusedConfidence() => $_has(3);
  @$pb.TagNumber(4)
  void clearFusedConfidence() => $_clearField(4);

  @$pb.TagNumber(5)
  $pb.PbList<$core.String> get sourcesCorroborating => $_getList(4);

  @$pb.TagNumber(6)
  $core.String get recommendedState => $_getSZ(5);
  @$pb.TagNumber(6)
  set recommendedState($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasRecommendedState() => $_has(5);
  @$pb.TagNumber(6)
  void clearRecommendedState() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get windowStart => $_getSZ(6);
  @$pb.TagNumber(7)
  set windowStart($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasWindowStart() => $_has(6);
  @$pb.TagNumber(7)
  void clearWindowStart() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get windowEnd => $_getSZ(7);
  @$pb.TagNumber(8)
  set windowEnd($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasWindowEnd() => $_has(7);
  @$pb.TagNumber(8)
  void clearWindowEnd() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get departamento => $_getSZ(8);
  @$pb.TagNumber(9)
  set departamento($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasDepartamento() => $_has(8);
  @$pb.TagNumber(9)
  void clearDepartamento() => $_clearField(9);
}

class FusedHotspotRequest extends $pb.GeneratedMessage {
  factory FusedHotspotRequest({
    $core.String? recommendedState,
    $core.double? minConfidence,
    $core.String? departamento,
  }) {
    final result = create();
    if (recommendedState != null) result.recommendedState = recommendedState;
    if (minConfidence != null) result.minConfidence = minConfidence;
    if (departamento != null) result.departamento = departamento;
    return result;
  }

  FusedHotspotRequest._();

  factory FusedHotspotRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FusedHotspotRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FusedHotspotRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.wildfire.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'recommendedState')
    ..aD(2, _omitFieldNames ? '' : 'minConfidence')
    ..aOS(3, _omitFieldNames ? '' : 'departamento')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FusedHotspotRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FusedHotspotRequest copyWith(void Function(FusedHotspotRequest) updates) =>
      super.copyWith((message) => updates(message as FusedHotspotRequest))
          as FusedHotspotRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FusedHotspotRequest create() => FusedHotspotRequest._();
  @$core.override
  FusedHotspotRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FusedHotspotRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FusedHotspotRequest>(create);
  static FusedHotspotRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get recommendedState => $_getSZ(0);
  @$pb.TagNumber(1)
  set recommendedState($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRecommendedState() => $_has(0);
  @$pb.TagNumber(1)
  void clearRecommendedState() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get minConfidence => $_getN(1);
  @$pb.TagNumber(2)
  set minConfidence($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMinConfidence() => $_has(1);
  @$pb.TagNumber(2)
  void clearMinConfidence() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get departamento => $_getSZ(2);
  @$pb.TagNumber(3)
  set departamento($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDepartamento() => $_has(2);
  @$pb.TagNumber(3)
  void clearDepartamento() => $_clearField(3);
}

class FusedHotspotResponse extends $pb.GeneratedMessage {
  factory FusedHotspotResponse({
    $core.Iterable<FusedHotspot>? hotspots,
  }) {
    final result = create();
    if (hotspots != null) result.hotspots.addAll(hotspots);
    return result;
  }

  FusedHotspotResponse._();

  factory FusedHotspotResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FusedHotspotResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FusedHotspotResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.wildfire.v1'),
      createEmptyInstance: create)
    ..pPM<FusedHotspot>(1, _omitFieldNames ? '' : 'hotspots',
        subBuilder: FusedHotspot.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FusedHotspotResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FusedHotspotResponse copyWith(void Function(FusedHotspotResponse) updates) =>
      super.copyWith((message) => updates(message as FusedHotspotResponse))
          as FusedHotspotResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FusedHotspotResponse create() => FusedHotspotResponse._();
  @$core.override
  FusedHotspotResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FusedHotspotResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FusedHotspotResponse>(create);
  static FusedHotspotResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<FusedHotspot> get hotspots => $_getList(0);
}

class JurisdictionRequest extends $pb.GeneratedMessage {
  factory JurisdictionRequest({
    $core.String? departamento,
    $core.String? municipio,
    $core.String? areaProtegida,
  }) {
    final result = create();
    if (departamento != null) result.departamento = departamento;
    if (municipio != null) result.municipio = municipio;
    if (areaProtegida != null) result.areaProtegida = areaProtegida;
    return result;
  }

  JurisdictionRequest._();

  factory JurisdictionRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory JurisdictionRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'JurisdictionRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.wildfire.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'departamento')
    ..aOS(2, _omitFieldNames ? '' : 'municipio')
    ..aOS(3, _omitFieldNames ? '' : 'areaProtegida')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  JurisdictionRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  JurisdictionRequest copyWith(void Function(JurisdictionRequest) updates) =>
      super.copyWith((message) => updates(message as JurisdictionRequest))
          as JurisdictionRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static JurisdictionRequest create() => JurisdictionRequest._();
  @$core.override
  JurisdictionRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static JurisdictionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<JurisdictionRequest>(create);
  static JurisdictionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get departamento => $_getSZ(0);
  @$pb.TagNumber(1)
  set departamento($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDepartamento() => $_has(0);
  @$pb.TagNumber(1)
  void clearDepartamento() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get municipio => $_getSZ(1);
  @$pb.TagNumber(2)
  set municipio($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMunicipio() => $_has(1);
  @$pb.TagNumber(2)
  void clearMunicipio() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get areaProtegida => $_getSZ(2);
  @$pb.TagNumber(3)
  set areaProtegida($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAreaProtegida() => $_has(2);
  @$pb.TagNumber(3)
  void clearAreaProtegida() => $_clearField(3);
}

class HMMStatePoint extends $pb.GeneratedMessage {
  factory HMMStatePoint({
    $core.String? timestep,
    FireState? state,
    $core.String? stateLabel,
    $core.double? confidence,
  }) {
    final result = create();
    if (timestep != null) result.timestep = timestep;
    if (state != null) result.state = state;
    if (stateLabel != null) result.stateLabel = stateLabel;
    if (confidence != null) result.confidence = confidence;
    return result;
  }

  HMMStatePoint._();

  factory HMMStatePoint.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HMMStatePoint.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HMMStatePoint',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.wildfire.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'timestep')
    ..aE<FireState>(2, _omitFieldNames ? '' : 'state',
        enumValues: FireState.values)
    ..aOS(3, _omitFieldNames ? '' : 'stateLabel')
    ..aD(4, _omitFieldNames ? '' : 'confidence')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HMMStatePoint clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HMMStatePoint copyWith(void Function(HMMStatePoint) updates) =>
      super.copyWith((message) => updates(message as HMMStatePoint))
          as HMMStatePoint;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HMMStatePoint create() => HMMStatePoint._();
  @$core.override
  HMMStatePoint createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HMMStatePoint getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HMMStatePoint>(create);
  static HMMStatePoint? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get timestep => $_getSZ(0);
  @$pb.TagNumber(1)
  set timestep($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTimestep() => $_has(0);
  @$pb.TagNumber(1)
  void clearTimestep() => $_clearField(1);

  @$pb.TagNumber(2)
  FireState get state => $_getN(1);
  @$pb.TagNumber(2)
  set state(FireState value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasState() => $_has(1);
  @$pb.TagNumber(2)
  void clearState() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get stateLabel => $_getSZ(2);
  @$pb.TagNumber(3)
  set stateLabel($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasStateLabel() => $_has(2);
  @$pb.TagNumber(3)
  void clearStateLabel() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.double get confidence => $_getN(3);
  @$pb.TagNumber(4)
  set confidence($core.double value) => $_setDouble(3, value);
  @$pb.TagNumber(4)
  $core.bool hasConfidence() => $_has(3);
  @$pb.TagNumber(4)
  void clearConfidence() => $_clearField(4);
}

class StateTrajectoryRequest extends $pb.GeneratedMessage {
  factory StateTrajectoryRequest({
    $core.String? cellId,
  }) {
    final result = create();
    if (cellId != null) result.cellId = cellId;
    return result;
  }

  StateTrajectoryRequest._();

  factory StateTrajectoryRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StateTrajectoryRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StateTrajectoryRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.wildfire.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'cellId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StateTrajectoryRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StateTrajectoryRequest copyWith(
          void Function(StateTrajectoryRequest) updates) =>
      super.copyWith((message) => updates(message as StateTrajectoryRequest))
          as StateTrajectoryRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StateTrajectoryRequest create() => StateTrajectoryRequest._();
  @$core.override
  StateTrajectoryRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StateTrajectoryRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StateTrajectoryRequest>(create);
  static StateTrajectoryRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get cellId => $_getSZ(0);
  @$pb.TagNumber(1)
  set cellId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCellId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCellId() => $_clearField(1);
}

class StateTrajectoryResponse extends $pb.GeneratedMessage {
  factory StateTrajectoryResponse({
    $core.String? cellId,
    $core.Iterable<HMMStatePoint>? trajectory,
    $core.int? totalTimesteps,
    $core.double? logProbability,
  }) {
    final result = create();
    if (cellId != null) result.cellId = cellId;
    if (trajectory != null) result.trajectory.addAll(trajectory);
    if (totalTimesteps != null) result.totalTimesteps = totalTimesteps;
    if (logProbability != null) result.logProbability = logProbability;
    return result;
  }

  StateTrajectoryResponse._();

  factory StateTrajectoryResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StateTrajectoryResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StateTrajectoryResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.wildfire.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'cellId')
    ..pPM<HMMStatePoint>(2, _omitFieldNames ? '' : 'trajectory',
        subBuilder: HMMStatePoint.create)
    ..aI(3, _omitFieldNames ? '' : 'totalTimesteps')
    ..aD(4, _omitFieldNames ? '' : 'logProbability')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StateTrajectoryResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StateTrajectoryResponse copyWith(
          void Function(StateTrajectoryResponse) updates) =>
      super.copyWith((message) => updates(message as StateTrajectoryResponse))
          as StateTrajectoryResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StateTrajectoryResponse create() => StateTrajectoryResponse._();
  @$core.override
  StateTrajectoryResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StateTrajectoryResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StateTrajectoryResponse>(create);
  static StateTrajectoryResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get cellId => $_getSZ(0);
  @$pb.TagNumber(1)
  set cellId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCellId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCellId() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<HMMStatePoint> get trajectory => $_getList(1);

  @$pb.TagNumber(3)
  $core.int get totalTimesteps => $_getIZ(2);
  @$pb.TagNumber(3)
  set totalTimesteps($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTotalTimesteps() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotalTimesteps() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.double get logProbability => $_getN(3);
  @$pb.TagNumber(4)
  set logProbability($core.double value) => $_setDouble(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLogProbability() => $_has(3);
  @$pb.TagNumber(4)
  void clearLogProbability() => $_clearField(4);
}

class WildfireTrackingServiceApi {
  final $pb.RpcClient _client;

  WildfireTrackingServiceApi(this._client);

  $async.Future<FireListResponse> getActiveFires(
          $pb.ClientContext? ctx, $0.Empty request) =>
      _client.invoke<FireListResponse>(ctx, 'WildfireTrackingService',
          'GetActiveFires', request, FireListResponse());
  $async.Future<FusedHotspotResponse> getFusedHotspots(
          $pb.ClientContext? ctx, FusedHotspotRequest request) =>
      _client.invoke<FusedHotspotResponse>(ctx, 'WildfireTrackingService',
          'GetFusedHotspots', request, FusedHotspotResponse());
  $async.Future<FireListResponse> getFiresByJurisdiction(
          $pb.ClientContext? ctx, JurisdictionRequest request) =>
      _client.invoke<FireListResponse>(ctx, 'WildfireTrackingService',
          'GetFiresByJurisdiction', request, FireListResponse());
  $async.Future<StateTrajectoryResponse> getFireStateTrajectory(
          $pb.ClientContext? ctx, StateTrajectoryRequest request) =>
      _client.invoke<StateTrajectoryResponse>(ctx, 'WildfireTrackingService',
          'GetFireStateTrajectory', request, StateTrajectoryResponse());
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
