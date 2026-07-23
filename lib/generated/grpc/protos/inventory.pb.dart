// This is a generated file - do not edit.
//
// Generated from protos/inventory.proto.

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

import 'inventory.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'inventory.pbenum.dart';

class Asset extends $pb.GeneratedMessage {
  factory Asset({
    $core.int? id,
    $core.int? institutionId,
    $core.String? callsign,
    AssetCategory? category,
    AssetStatus? status,
    $core.int? waterCapacityLiters,
    $core.int? fuelLevelPercent,
    $core.double? lastKnownLat,
    $core.double? lastKnownLng,
    $core.int? stationId,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (institutionId != null) result.institutionId = institutionId;
    if (callsign != null) result.callsign = callsign;
    if (category != null) result.category = category;
    if (status != null) result.status = status;
    if (waterCapacityLiters != null)
      result.waterCapacityLiters = waterCapacityLiters;
    if (fuelLevelPercent != null) result.fuelLevelPercent = fuelLevelPercent;
    if (lastKnownLat != null) result.lastKnownLat = lastKnownLat;
    if (lastKnownLng != null) result.lastKnownLng = lastKnownLng;
    if (stationId != null) result.stationId = stationId;
    return result;
  }

  Asset._();

  factory Asset.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Asset.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Asset',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.inventory.v1'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'id')
    ..aI(2, _omitFieldNames ? '' : 'institutionId')
    ..aOS(3, _omitFieldNames ? '' : 'callsign')
    ..aE<AssetCategory>(4, _omitFieldNames ? '' : 'category',
        enumValues: AssetCategory.values)
    ..aE<AssetStatus>(5, _omitFieldNames ? '' : 'status',
        enumValues: AssetStatus.values)
    ..aI(6, _omitFieldNames ? '' : 'waterCapacityLiters')
    ..aI(7, _omitFieldNames ? '' : 'fuelLevelPercent')
    ..aD(8, _omitFieldNames ? '' : 'lastKnownLat')
    ..aD(9, _omitFieldNames ? '' : 'lastKnownLng')
    ..aI(10, _omitFieldNames ? '' : 'stationId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Asset clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Asset copyWith(void Function(Asset) updates) =>
      super.copyWith((message) => updates(message as Asset)) as Asset;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Asset create() => Asset._();
  @$core.override
  Asset createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Asset getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Asset>(create);
  static Asset? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get institutionId => $_getIZ(1);
  @$pb.TagNumber(2)
  set institutionId($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasInstitutionId() => $_has(1);
  @$pb.TagNumber(2)
  void clearInstitutionId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get callsign => $_getSZ(2);
  @$pb.TagNumber(3)
  set callsign($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCallsign() => $_has(2);
  @$pb.TagNumber(3)
  void clearCallsign() => $_clearField(3);

  @$pb.TagNumber(4)
  AssetCategory get category => $_getN(3);
  @$pb.TagNumber(4)
  set category(AssetCategory value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasCategory() => $_has(3);
  @$pb.TagNumber(4)
  void clearCategory() => $_clearField(4);

  @$pb.TagNumber(5)
  AssetStatus get status => $_getN(4);
  @$pb.TagNumber(5)
  set status(AssetStatus value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get waterCapacityLiters => $_getIZ(5);
  @$pb.TagNumber(6)
  set waterCapacityLiters($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasWaterCapacityLiters() => $_has(5);
  @$pb.TagNumber(6)
  void clearWaterCapacityLiters() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get fuelLevelPercent => $_getIZ(6);
  @$pb.TagNumber(7)
  set fuelLevelPercent($core.int value) => $_setSignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasFuelLevelPercent() => $_has(6);
  @$pb.TagNumber(7)
  void clearFuelLevelPercent() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.double get lastKnownLat => $_getN(7);
  @$pb.TagNumber(8)
  set lastKnownLat($core.double value) => $_setDouble(7, value);
  @$pb.TagNumber(8)
  $core.bool hasLastKnownLat() => $_has(7);
  @$pb.TagNumber(8)
  void clearLastKnownLat() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.double get lastKnownLng => $_getN(8);
  @$pb.TagNumber(9)
  set lastKnownLng($core.double value) => $_setDouble(8, value);
  @$pb.TagNumber(9)
  $core.bool hasLastKnownLng() => $_has(8);
  @$pb.TagNumber(9)
  void clearLastKnownLng() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.int get stationId => $_getIZ(9);
  @$pb.TagNumber(10)
  set stationId($core.int value) => $_setSignedInt32(9, value);
  @$pb.TagNumber(10)
  $core.bool hasStationId() => $_has(9);
  @$pb.TagNumber(10)
  void clearStationId() => $_clearField(10);
}

class ListAssetsRequest extends $pb.GeneratedMessage {
  factory ListAssetsRequest({
    $core.int? pageSize,
    $core.int? pageToken,
  }) {
    final result = create();
    if (pageSize != null) result.pageSize = pageSize;
    if (pageToken != null) result.pageToken = pageToken;
    return result;
  }

  ListAssetsRequest._();

  factory ListAssetsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListAssetsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListAssetsRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.inventory.v1'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'pageSize')
    ..aI(2, _omitFieldNames ? '' : 'pageToken')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListAssetsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListAssetsRequest copyWith(void Function(ListAssetsRequest) updates) =>
      super.copyWith((message) => updates(message as ListAssetsRequest))
          as ListAssetsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListAssetsRequest create() => ListAssetsRequest._();
  @$core.override
  ListAssetsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListAssetsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListAssetsRequest>(create);
  static ListAssetsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get pageSize => $_getIZ(0);
  @$pb.TagNumber(1)
  set pageSize($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPageSize() => $_has(0);
  @$pb.TagNumber(1)
  void clearPageSize() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get pageToken => $_getIZ(1);
  @$pb.TagNumber(2)
  set pageToken($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPageToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearPageToken() => $_clearField(2);
}

class ListAssetsResponse extends $pb.GeneratedMessage {
  factory ListAssetsResponse({
    $core.Iterable<Asset>? assets,
    $core.String? nextPageToken,
  }) {
    final result = create();
    if (assets != null) result.assets.addAll(assets);
    if (nextPageToken != null) result.nextPageToken = nextPageToken;
    return result;
  }

  ListAssetsResponse._();

  factory ListAssetsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListAssetsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListAssetsResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.inventory.v1'),
      createEmptyInstance: create)
    ..pPM<Asset>(1, _omitFieldNames ? '' : 'assets', subBuilder: Asset.create)
    ..aOS(2, _omitFieldNames ? '' : 'nextPageToken')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListAssetsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListAssetsResponse copyWith(void Function(ListAssetsResponse) updates) =>
      super.copyWith((message) => updates(message as ListAssetsResponse))
          as ListAssetsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListAssetsResponse create() => ListAssetsResponse._();
  @$core.override
  ListAssetsResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListAssetsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListAssetsResponse>(create);
  static ListAssetsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Asset> get assets => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get nextPageToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set nextPageToken($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNextPageToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearNextPageToken() => $_clearField(2);
}

class CreateAssetRequest extends $pb.GeneratedMessage {
  factory CreateAssetRequest({
    $core.int? institutionId,
    $core.String? callsign,
    AssetCategory? category,
    $core.int? waterCapacityLiters,
    $core.int? stationId,
  }) {
    final result = create();
    if (institutionId != null) result.institutionId = institutionId;
    if (callsign != null) result.callsign = callsign;
    if (category != null) result.category = category;
    if (waterCapacityLiters != null)
      result.waterCapacityLiters = waterCapacityLiters;
    if (stationId != null) result.stationId = stationId;
    return result;
  }

  CreateAssetRequest._();

  factory CreateAssetRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateAssetRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateAssetRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.inventory.v1'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'institutionId')
    ..aOS(2, _omitFieldNames ? '' : 'callsign')
    ..aE<AssetCategory>(3, _omitFieldNames ? '' : 'category',
        enumValues: AssetCategory.values)
    ..aI(4, _omitFieldNames ? '' : 'waterCapacityLiters')
    ..aI(5, _omitFieldNames ? '' : 'stationId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateAssetRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateAssetRequest copyWith(void Function(CreateAssetRequest) updates) =>
      super.copyWith((message) => updates(message as CreateAssetRequest))
          as CreateAssetRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateAssetRequest create() => CreateAssetRequest._();
  @$core.override
  CreateAssetRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateAssetRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateAssetRequest>(create);
  static CreateAssetRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get institutionId => $_getIZ(0);
  @$pb.TagNumber(1)
  set institutionId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasInstitutionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearInstitutionId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get callsign => $_getSZ(1);
  @$pb.TagNumber(2)
  set callsign($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCallsign() => $_has(1);
  @$pb.TagNumber(2)
  void clearCallsign() => $_clearField(2);

  @$pb.TagNumber(3)
  AssetCategory get category => $_getN(2);
  @$pb.TagNumber(3)
  set category(AssetCategory value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasCategory() => $_has(2);
  @$pb.TagNumber(3)
  void clearCategory() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get waterCapacityLiters => $_getIZ(3);
  @$pb.TagNumber(4)
  set waterCapacityLiters($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasWaterCapacityLiters() => $_has(3);
  @$pb.TagNumber(4)
  void clearWaterCapacityLiters() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get stationId => $_getIZ(4);
  @$pb.TagNumber(5)
  set stationId($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasStationId() => $_has(4);
  @$pb.TagNumber(5)
  void clearStationId() => $_clearField(5);
}

class UpdateAssetStatusRequest extends $pb.GeneratedMessage {
  factory UpdateAssetStatusRequest({
    $core.int? id,
    AssetStatus? newStatus,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (newStatus != null) result.newStatus = newStatus;
    return result;
  }

  UpdateAssetStatusRequest._();

  factory UpdateAssetStatusRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateAssetStatusRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateAssetStatusRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.inventory.v1'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'id')
    ..aE<AssetStatus>(2, _omitFieldNames ? '' : 'newStatus',
        enumValues: AssetStatus.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateAssetStatusRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateAssetStatusRequest copyWith(
          void Function(UpdateAssetStatusRequest) updates) =>
      super.copyWith((message) => updates(message as UpdateAssetStatusRequest))
          as UpdateAssetStatusRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateAssetStatusRequest create() => UpdateAssetStatusRequest._();
  @$core.override
  UpdateAssetStatusRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UpdateAssetStatusRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateAssetStatusRequest>(create);
  static UpdateAssetStatusRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  AssetStatus get newStatus => $_getN(1);
  @$pb.TagNumber(2)
  set newStatus(AssetStatus value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasNewStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearNewStatus() => $_clearField(2);
}

class GetAssetRequest extends $pb.GeneratedMessage {
  factory GetAssetRequest({
    $core.int? id,
  }) {
    final result = create();
    if (id != null) result.id = id;
    return result;
  }

  GetAssetRequest._();

  factory GetAssetRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetAssetRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetAssetRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.inventory.v1'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetAssetRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetAssetRequest copyWith(void Function(GetAssetRequest) updates) =>
      super.copyWith((message) => updates(message as GetAssetRequest))
          as GetAssetRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAssetRequest create() => GetAssetRequest._();
  @$core.override
  GetAssetRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetAssetRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetAssetRequest>(create);
  static GetAssetRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);
}

class FleetAnalyticsResponse extends $pb.GeneratedMessage {
  factory FleetAnalyticsResponse({
    $core.int? totalReady,
    $core.int? totalDeployed,
    $core.int? totalMaintenance,
    $core.int? totalWaterCapacityAvailable,
  }) {
    final result = create();
    if (totalReady != null) result.totalReady = totalReady;
    if (totalDeployed != null) result.totalDeployed = totalDeployed;
    if (totalMaintenance != null) result.totalMaintenance = totalMaintenance;
    if (totalWaterCapacityAvailable != null)
      result.totalWaterCapacityAvailable = totalWaterCapacityAvailable;
    return result;
  }

  FleetAnalyticsResponse._();

  factory FleetAnalyticsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FleetAnalyticsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FleetAnalyticsResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.inventory.v1'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'totalReady')
    ..aI(2, _omitFieldNames ? '' : 'totalDeployed')
    ..aI(3, _omitFieldNames ? '' : 'totalMaintenance')
    ..aI(4, _omitFieldNames ? '' : 'totalWaterCapacityAvailable')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetAnalyticsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetAnalyticsResponse copyWith(
          void Function(FleetAnalyticsResponse) updates) =>
      super.copyWith((message) => updates(message as FleetAnalyticsResponse))
          as FleetAnalyticsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FleetAnalyticsResponse create() => FleetAnalyticsResponse._();
  @$core.override
  FleetAnalyticsResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FleetAnalyticsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FleetAnalyticsResponse>(create);
  static FleetAnalyticsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get totalReady => $_getIZ(0);
  @$pb.TagNumber(1)
  set totalReady($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTotalReady() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotalReady() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get totalDeployed => $_getIZ(1);
  @$pb.TagNumber(2)
  set totalDeployed($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTotalDeployed() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalDeployed() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get totalMaintenance => $_getIZ(2);
  @$pb.TagNumber(3)
  set totalMaintenance($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTotalMaintenance() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotalMaintenance() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get totalWaterCapacityAvailable => $_getIZ(3);
  @$pb.TagNumber(4)
  set totalWaterCapacityAvailable($core.int value) =>
      $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTotalWaterCapacityAvailable() => $_has(3);
  @$pb.TagNumber(4)
  void clearTotalWaterCapacityAvailable() => $_clearField(4);
}

class InventoryServiceApi {
  final $pb.RpcClient _client;

  InventoryServiceApi(this._client);

  $async.Future<Asset> createAsset(
          $pb.ClientContext? ctx, CreateAssetRequest request) =>
      _client.invoke<Asset>(
          ctx, 'InventoryService', 'CreateAsset', request, Asset());
  $async.Future<Asset> getAsset(
          $pb.ClientContext? ctx, GetAssetRequest request) =>
      _client.invoke<Asset>(
          ctx, 'InventoryService', 'GetAsset', request, Asset());
  $async.Future<Asset> updateAssetStatus(
          $pb.ClientContext? ctx, UpdateAssetStatusRequest request) =>
      _client.invoke<Asset>(
          ctx, 'InventoryService', 'UpdateAssetStatus', request, Asset());
  $async.Future<ListAssetsResponse> listAssets(
          $pb.ClientContext? ctx, ListAssetsRequest request) =>
      _client.invoke<ListAssetsResponse>(
          ctx, 'InventoryService', 'ListAssets', request, ListAssetsResponse());
  $async.Future<FleetAnalyticsResponse> getFleetAnalytics(
          $pb.ClientContext? ctx, $0.Empty request) =>
      _client.invoke<FleetAnalyticsResponse>(ctx, 'InventoryService',
          'GetFleetAnalytics', request, FleetAnalyticsResponse());
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
