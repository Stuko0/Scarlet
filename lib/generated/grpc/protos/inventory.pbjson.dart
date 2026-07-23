// This is a generated file - do not edit.
//
// Generated from protos/inventory.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports
// ignore_for_file: unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

import 'package:protobuf/well_known_types/google/protobuf/empty.pbjson.dart'
    as $0;

@$core.Deprecated('Use assetCategoryDescriptor instead')
const AssetCategory$json = {
  '1': 'AssetCategory',
  '2': [
    {'1': 'ASSET_CATEGORY_UNSPECIFIED', '2': 0},
    {'1': 'HEAVY_ENGINE', '2': 1},
    {'1': 'LIGHT_ATTACK', '2': 2},
    {'1': 'WATER_TENDER', '2': 3},
    {'1': 'AERIAL_DRONE', '2': 4},
    {'1': 'COMMAND_POST', '2': 5},
    {'1': 'MEDICAL_UNIT', '2': 6},
  ],
};

/// Descriptor for `AssetCategory`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List assetCategoryDescriptor = $convert.base64Decode(
    'Cg1Bc3NldENhdGVnb3J5Eh4KGkFTU0VUX0NBVEVHT1JZX1VOU1BFQ0lGSUVEEAASEAoMSEVBVl'
    'lfRU5HSU5FEAESEAoMTElHSFRfQVRUQUNLEAISEAoMV0FURVJfVEVOREVSEAMSEAoMQUVSSUFM'
    'X0RST05FEAQSEAoMQ09NTUFORF9QT1NUEAUSEAoMTUVESUNBTF9VTklUEAY=');

@$core.Deprecated('Use assetStatusDescriptor instead')
const AssetStatus$json = {
  '1': 'AssetStatus',
  '2': [
    {'1': 'ASSET_STATUS_UNSPECIFIED', '2': 0},
    {'1': 'READY', '2': 1},
    {'1': 'DEPLOYED', '2': 2},
    {'1': 'OUT_OF_SERVICE', '2': 3},
    {'1': 'IN_MAINTENANCE', '2': 4},
  ],
};

/// Descriptor for `AssetStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List assetStatusDescriptor = $convert.base64Decode(
    'CgtBc3NldFN0YXR1cxIcChhBU1NFVF9TVEFUVVNfVU5TUEVDSUZJRUQQABIJCgVSRUFEWRABEg'
    'wKCERFUExPWUVEEAISEgoOT1VUX09GX1NFUlZJQ0UQAxISCg5JTl9NQUlOVEVOQU5DRRAE');

@$core.Deprecated('Use assetDescriptor instead')
const Asset$json = {
  '1': 'Asset',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'institution_id', '3': 2, '4': 1, '5': 5, '10': 'institutionId'},
    {'1': 'station_id', '3': 10, '4': 1, '5': 5, '10': 'stationId'},
    {'1': 'callsign', '3': 3, '4': 1, '5': 9, '10': 'callsign'},
    {
      '1': 'category',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.scarlet.operations.inventory.v1.AssetCategory',
      '10': 'category'
    },
    {
      '1': 'status',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.scarlet.operations.inventory.v1.AssetStatus',
      '10': 'status'
    },
    {
      '1': 'water_capacity_liters',
      '3': 6,
      '4': 1,
      '5': 5,
      '9': 0,
      '10': 'waterCapacityLiters',
      '17': true
    },
    {
      '1': 'fuel_level_percent',
      '3': 7,
      '4': 1,
      '5': 5,
      '9': 1,
      '10': 'fuelLevelPercent',
      '17': true
    },
    {
      '1': 'last_known_lat',
      '3': 8,
      '4': 1,
      '5': 1,
      '9': 2,
      '10': 'lastKnownLat',
      '17': true
    },
    {
      '1': 'last_known_lng',
      '3': 9,
      '4': 1,
      '5': 1,
      '9': 3,
      '10': 'lastKnownLng',
      '17': true
    },
  ],
  '8': [
    {'1': '_water_capacity_liters'},
    {'1': '_fuel_level_percent'},
    {'1': '_last_known_lat'},
    {'1': '_last_known_lng'},
  ],
};

/// Descriptor for `Asset`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List assetDescriptor = $convert.base64Decode(
    'CgVBc3NldBIOCgJpZBgBIAEoBVICaWQSJQoOaW5zdGl0dXRpb25faWQYAiABKAVSDWluc3RpdH'
    'V0aW9uSWQSHQoKc3RhdGlvbl9pZBgKIAEoBVIJc3RhdGlvbklkEhoKCGNhbGxzaWduGAMgASgJ'
    'UghjYWxsc2lnbhJKCghjYXRlZ29yeRgEIAEoDjIuLnNjYXJsZXQub3BlcmF0aW9ucy5pbnZlbn'
    'RvcnkudjEuQXNzZXRDYXRlZ29yeVIIY2F0ZWdvcnkSRAoGc3RhdHVzGAUgASgOMiwuc2Nhcmxl'
    'dC5vcGVyYXRpb25zLmludmVudG9yeS52MS5Bc3NldFN0YXR1c1IGc3RhdHVzEjcKFXdhdGVyX2'
    'NhcGFjaXR5X2xpdGVycxgGIAEoBUgAUhN3YXRlckNhcGFjaXR5TGl0ZXJziAEBEjEKEmZ1ZWxf'
    'bGV2ZWxfcGVyY2VudBgHIAEoBUgBUhBmdWVsTGV2ZWxQZXJjZW50iAEBEikKDmxhc3Rfa25vd2'
    '5fbGF0GAggASgBSAJSDGxhc3RLbm93bkxhdIgBARIpCg5sYXN0X2tub3duX2xuZxgJIAEoAUgD'
    'UgxsYXN0S25vd25MbmeIAQFCGAoWX3dhdGVyX2NhcGFjaXR5X2xpdGVyc0IVChNfZnVlbF9sZX'
    'ZlbF9wZXJjZW50QhEKD19sYXN0X2tub3duX2xhdEIRCg9fbGFzdF9rbm93bl9sbmc=');

@$core.Deprecated('Use listAssetsRequestDescriptor instead')
const ListAssetsRequest$json = {
  '1': 'ListAssetsRequest',
  '2': [
    {'1': 'page_size', '3': 1, '4': 1, '5': 5, '10': 'pageSize'},
    {'1': 'page_token', '3': 2, '4': 1, '5': 5, '10': 'pageToken'},
  ],
};

/// Descriptor for `ListAssetsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listAssetsRequestDescriptor = $convert.base64Decode(
    'ChFMaXN0QXNzZXRzUmVxdWVzdBIbCglwYWdlX3NpemUYASABKAVSCHBhZ2VTaXplEh0KCnBhZ2'
    'VfdG9rZW4YAiABKAVSCXBhZ2VUb2tlbg==');

@$core.Deprecated('Use listAssetsResponseDescriptor instead')
const ListAssetsResponse$json = {
  '1': 'ListAssetsResponse',
  '2': [
    {
      '1': 'assets',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.scarlet.operations.inventory.v1.Asset',
      '10': 'assets'
    },
    {'1': 'next_page_token', '3': 2, '4': 1, '5': 9, '10': 'nextPageToken'},
  ],
};

/// Descriptor for `ListAssetsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listAssetsResponseDescriptor = $convert.base64Decode(
    'ChJMaXN0QXNzZXRzUmVzcG9uc2USPgoGYXNzZXRzGAEgAygLMiYuc2NhcmxldC5vcGVyYXRpb2'
    '5zLmludmVudG9yeS52MS5Bc3NldFIGYXNzZXRzEiYKD25leHRfcGFnZV90b2tlbhgCIAEoCVIN'
    'bmV4dFBhZ2VUb2tlbg==');

@$core.Deprecated('Use createAssetRequestDescriptor instead')
const CreateAssetRequest$json = {
  '1': 'CreateAssetRequest',
  '2': [
    {'1': 'institution_id', '3': 1, '4': 1, '5': 5, '10': 'institutionId'},
    {'1': 'station_id', '3': 5, '4': 1, '5': 5, '10': 'stationId'},
    {'1': 'callsign', '3': 2, '4': 1, '5': 9, '10': 'callsign'},
    {
      '1': 'category',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.scarlet.operations.inventory.v1.AssetCategory',
      '10': 'category'
    },
    {
      '1': 'water_capacity_liters',
      '3': 4,
      '4': 1,
      '5': 5,
      '9': 0,
      '10': 'waterCapacityLiters',
      '17': true
    },
  ],
  '8': [
    {'1': '_water_capacity_liters'},
  ],
};

/// Descriptor for `CreateAssetRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createAssetRequestDescriptor = $convert.base64Decode(
    'ChJDcmVhdGVBc3NldFJlcXVlc3QSJQoOaW5zdGl0dXRpb25faWQYASABKAVSDWluc3RpdHV0aW'
    '9uSWQSHQoKc3RhdGlvbl9pZBgFIAEoBVIJc3RhdGlvbklkEhoKCGNhbGxzaWduGAIgASgJUghj'
    'YWxsc2lnbhJKCghjYXRlZ29yeRgDIAEoDjIuLnNjYXJsZXQub3BlcmF0aW9ucy5pbnZlbnRvcn'
    'kudjEuQXNzZXRDYXRlZ29yeVIIY2F0ZWdvcnkSNwoVd2F0ZXJfY2FwYWNpdHlfbGl0ZXJzGAQg'
    'ASgFSABSE3dhdGVyQ2FwYWNpdHlMaXRlcnOIAQFCGAoWX3dhdGVyX2NhcGFjaXR5X2xpdGVycw'
    '==');

@$core.Deprecated('Use updateAssetStatusRequestDescriptor instead')
const UpdateAssetStatusRequest$json = {
  '1': 'UpdateAssetStatusRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {
      '1': 'new_status',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.scarlet.operations.inventory.v1.AssetStatus',
      '10': 'newStatus'
    },
  ],
};

/// Descriptor for `UpdateAssetStatusRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateAssetStatusRequestDescriptor = $convert.base64Decode(
    'ChhVcGRhdGVBc3NldFN0YXR1c1JlcXVlc3QSDgoCaWQYASABKAVSAmlkEksKCm5ld19zdGF0dX'
    'MYAiABKA4yLC5zY2FybGV0Lm9wZXJhdGlvbnMuaW52ZW50b3J5LnYxLkFzc2V0U3RhdHVzUglu'
    'ZXdTdGF0dXM=');

@$core.Deprecated('Use getAssetRequestDescriptor instead')
const GetAssetRequest$json = {
  '1': 'GetAssetRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
  ],
};

/// Descriptor for `GetAssetRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAssetRequestDescriptor =
    $convert.base64Decode('Cg9HZXRBc3NldFJlcXVlc3QSDgoCaWQYASABKAVSAmlk');

@$core.Deprecated('Use fleetAnalyticsResponseDescriptor instead')
const FleetAnalyticsResponse$json = {
  '1': 'FleetAnalyticsResponse',
  '2': [
    {'1': 'total_ready', '3': 1, '4': 1, '5': 5, '10': 'totalReady'},
    {'1': 'total_deployed', '3': 2, '4': 1, '5': 5, '10': 'totalDeployed'},
    {
      '1': 'total_maintenance',
      '3': 3,
      '4': 1,
      '5': 5,
      '10': 'totalMaintenance'
    },
    {
      '1': 'total_water_capacity_available',
      '3': 4,
      '4': 1,
      '5': 5,
      '10': 'totalWaterCapacityAvailable'
    },
  ],
};

/// Descriptor for `FleetAnalyticsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fleetAnalyticsResponseDescriptor = $convert.base64Decode(
    'ChZGbGVldEFuYWx5dGljc1Jlc3BvbnNlEh8KC3RvdGFsX3JlYWR5GAEgASgFUgp0b3RhbFJlYW'
    'R5EiUKDnRvdGFsX2RlcGxveWVkGAIgASgFUg10b3RhbERlcGxveWVkEisKEXRvdGFsX21haW50'
    'ZW5hbmNlGAMgASgFUhB0b3RhbE1haW50ZW5hbmNlEkMKHnRvdGFsX3dhdGVyX2NhcGFjaXR5X2'
    'F2YWlsYWJsZRgEIAEoBVIbdG90YWxXYXRlckNhcGFjaXR5QXZhaWxhYmxl');

const $core.Map<$core.String, $core.dynamic> InventoryServiceBase$json = {
  '1': 'InventoryService',
  '2': [
    {
      '1': 'CreateAsset',
      '2': '.scarlet.operations.inventory.v1.CreateAssetRequest',
      '3': '.scarlet.operations.inventory.v1.Asset',
      '4': {}
    },
    {
      '1': 'GetAsset',
      '2': '.scarlet.operations.inventory.v1.GetAssetRequest',
      '3': '.scarlet.operations.inventory.v1.Asset',
      '4': {}
    },
    {
      '1': 'UpdateAssetStatus',
      '2': '.scarlet.operations.inventory.v1.UpdateAssetStatusRequest',
      '3': '.scarlet.operations.inventory.v1.Asset',
      '4': {}
    },
    {
      '1': 'ListAssets',
      '2': '.scarlet.operations.inventory.v1.ListAssetsRequest',
      '3': '.scarlet.operations.inventory.v1.ListAssetsResponse',
      '4': {}
    },
    {
      '1': 'GetFleetAnalytics',
      '2': '.google.protobuf.Empty',
      '3': '.scarlet.operations.inventory.v1.FleetAnalyticsResponse',
      '4': {}
    },
  ],
};

@$core.Deprecated('Use inventoryServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    InventoryServiceBase$messageJson = {
  '.scarlet.operations.inventory.v1.CreateAssetRequest':
      CreateAssetRequest$json,
  '.scarlet.operations.inventory.v1.Asset': Asset$json,
  '.scarlet.operations.inventory.v1.GetAssetRequest': GetAssetRequest$json,
  '.scarlet.operations.inventory.v1.UpdateAssetStatusRequest':
      UpdateAssetStatusRequest$json,
  '.scarlet.operations.inventory.v1.ListAssetsRequest': ListAssetsRequest$json,
  '.scarlet.operations.inventory.v1.ListAssetsResponse':
      ListAssetsResponse$json,
  '.google.protobuf.Empty': $0.Empty$json,
  '.scarlet.operations.inventory.v1.FleetAnalyticsResponse':
      FleetAnalyticsResponse$json,
};

/// Descriptor for `InventoryService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List inventoryServiceDescriptor = $convert.base64Decode(
    'ChBJbnZlbnRvcnlTZXJ2aWNlEo8BCgtDcmVhdGVBc3NldBIzLnNjYXJsZXQub3BlcmF0aW9ucy'
    '5pbnZlbnRvcnkudjEuQ3JlYXRlQXNzZXRSZXF1ZXN0GiYuc2NhcmxldC5vcGVyYXRpb25zLmlu'
    'dmVudG9yeS52MS5Bc3NldCIjgtPkkwIdIhgvYXBpL3YxL2ludmVudG9yeS9hc3NldHM6ASoSiw'
    'EKCEdldEFzc2V0EjAuc2NhcmxldC5vcGVyYXRpb25zLmludmVudG9yeS52MS5HZXRBc3NldFJl'
    'cXVlc3QaJi5zY2FybGV0Lm9wZXJhdGlvbnMuaW52ZW50b3J5LnYxLkFzc2V0IiWC0+STAh8SHS'
    '9hcGkvdjEvaW52ZW50b3J5L2Fzc2V0cy97aWR9EqcBChFVcGRhdGVBc3NldFN0YXR1cxI5LnNj'
    'YXJsZXQub3BlcmF0aW9ucy5pbnZlbnRvcnkudjEuVXBkYXRlQXNzZXRTdGF0dXNSZXF1ZXN0Gi'
    'Yuc2NhcmxldC5vcGVyYXRpb25zLmludmVudG9yeS52MS5Bc3NldCIvgtPkkwIpMiQvYXBpL3Yx'
    'L2ludmVudG9yeS9hc3NldHMve2lkfS9zdGF0dXM6ASoSlwEKCkxpc3RBc3NldHMSMi5zY2FybG'
    'V0Lm9wZXJhdGlvbnMuaW52ZW50b3J5LnYxLkxpc3RBc3NldHNSZXF1ZXN0GjMuc2NhcmxldC5v'
    'cGVyYXRpb25zLmludmVudG9yeS52MS5MaXN0QXNzZXRzUmVzcG9uc2UiIILT5JMCGhIYL2FwaS'
    '92MS9pbnZlbnRvcnkvYXNzZXRzEokBChFHZXRGbGVldEFuYWx5dGljcxIWLmdvb2dsZS5wcm90'
    'b2J1Zi5FbXB0eRo3LnNjYXJsZXQub3BlcmF0aW9ucy5pbnZlbnRvcnkudjEuRmxlZXRBbmFseX'
    'RpY3NSZXNwb25zZSIjgtPkkwIdEhsvYXBpL3YxL2ludmVudG9yeS9hbmFseXRpY3M=');
