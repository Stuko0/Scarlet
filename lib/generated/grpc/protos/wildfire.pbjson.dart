// This is a generated file - do not edit.
//
// Generated from protos/wildfire.proto.

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

@$core.Deprecated('Use fireStateDescriptor instead')
const FireState$json = {
  '1': 'FireState',
  '2': [
    {'1': 'FIRE_STATE_UNSPECIFIED', '2': 0},
    {'1': 'NO_FIRE', '2': 1},
    {'1': 'EMERGING', '2': 2},
    {'1': 'ACTIVE', '2': 3},
    {'1': 'EXTINGUISHED', '2': 4},
    {'1': 'SUSPECT', '2': 5},
  ],
};

/// Descriptor for `FireState`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List fireStateDescriptor = $convert.base64Decode(
    'CglGaXJlU3RhdGUSGgoWRklSRV9TVEFURV9VTlNQRUNJRklFRBAAEgsKB05PX0ZJUkUQARIMCg'
    'hFTUVSR0lORxACEgoKBkFDVElWRRADEhAKDEVYVElOR1VJU0hFRBAEEgsKB1NVU1BFQ1QQBQ==');

@$core.Deprecated('Use fireDescriptor instead')
const Fire$json = {
  '1': 'Fire',
  '2': [
    {'1': 'event_id', '3': 1, '4': 1, '5': 9, '10': 'eventId'},
    {'1': 'latitude', '3': 2, '4': 1, '5': 1, '10': 'latitude'},
    {'1': 'longitude', '3': 3, '4': 1, '5': 1, '10': 'longitude'},
    {'1': 'confidence', '3': 4, '4': 1, '5': 9, '10': 'confidence'},
    {'1': 'temperature', '3': 5, '4': 1, '5': 1, '10': 'temperature'},
    {'1': 'humidity', '3': 6, '4': 1, '5': 1, '10': 'humidity'},
    {'1': 'wind', '3': 7, '4': 1, '5': 1, '10': 'wind'},
    {'1': 'frp', '3': 8, '4': 1, '5': 1, '10': 'frp'},
    {'1': 'brightness', '3': 9, '4': 1, '5': 1, '10': 'brightness'},
    {'1': 'scan', '3': 10, '4': 1, '5': 9, '10': 'scan'},
    {'1': 'track', '3': 11, '4': 1, '5': 9, '10': 'track'},
    {'1': 'satellite', '3': 12, '4': 1, '5': 9, '10': 'satellite'},
    {'1': 'acq_date', '3': 13, '4': 1, '5': 9, '10': 'acqDate'},
    {'1': 'acq_time', '3': 14, '4': 1, '5': 9, '10': 'acqTime'},
    {'1': 'daynight', '3': 15, '4': 1, '5': 9, '10': 'daynight'},
    {'1': 'source_id', '3': 16, '4': 1, '5': 9, '10': 'sourceId'},
    {'1': 'fused_confidence', '3': 17, '4': 1, '5': 1, '10': 'fusedConfidence'},
    {'1': 'departamento', '3': 18, '4': 1, '5': 9, '10': 'departamento'},
    {'1': 'municipio', '3': 19, '4': 1, '5': 9, '10': 'municipio'},
    {'1': 'area_protegida', '3': 20, '4': 1, '5': 9, '10': 'areaProtegida'},
  ],
};

/// Descriptor for `Fire`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fireDescriptor = $convert.base64Decode(
    'CgRGaXJlEhkKCGV2ZW50X2lkGAEgASgJUgdldmVudElkEhoKCGxhdGl0dWRlGAIgASgBUghsYX'
    'RpdHVkZRIcCglsb25naXR1ZGUYAyABKAFSCWxvbmdpdHVkZRIeCgpjb25maWRlbmNlGAQgASgJ'
    'Ugpjb25maWRlbmNlEiAKC3RlbXBlcmF0dXJlGAUgASgBUgt0ZW1wZXJhdHVyZRIaCghodW1pZG'
    'l0eRgGIAEoAVIIaHVtaWRpdHkSEgoEd2luZBgHIAEoAVIEd2luZBIQCgNmcnAYCCABKAFSA2Zy'
    'cBIeCgpicmlnaHRuZXNzGAkgASgBUgpicmlnaHRuZXNzEhIKBHNjYW4YCiABKAlSBHNjYW4SFA'
    'oFdHJhY2sYCyABKAlSBXRyYWNrEhwKCXNhdGVsbGl0ZRgMIAEoCVIJc2F0ZWxsaXRlEhkKCGFj'
    'cV9kYXRlGA0gASgJUgdhY3FEYXRlEhkKCGFjcV90aW1lGA4gASgJUgdhY3FUaW1lEhoKCGRheW'
    '5pZ2h0GA8gASgJUghkYXluaWdodBIbCglzb3VyY2VfaWQYECABKAlSCHNvdXJjZUlkEikKEGZ1'
    'c2VkX2NvbmZpZGVuY2UYESABKAFSD2Z1c2VkQ29uZmlkZW5jZRIiCgxkZXBhcnRhbWVudG8YEi'
    'ABKAlSDGRlcGFydGFtZW50bxIcCgltdW5pY2lwaW8YEyABKAlSCW11bmljaXBpbxIlCg5hcmVh'
    'X3Byb3RlZ2lkYRgUIAEoCVINYXJlYVByb3RlZ2lkYQ==');

@$core.Deprecated('Use fireListResponseDescriptor instead')
const FireListResponse$json = {
  '1': 'FireListResponse',
  '2': [
    {
      '1': 'fires',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.scarlet.operations.wildfire.v1.Fire',
      '10': 'fires'
    },
  ],
};

/// Descriptor for `FireListResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fireListResponseDescriptor = $convert.base64Decode(
    'ChBGaXJlTGlzdFJlc3BvbnNlEjoKBWZpcmVzGAEgAygLMiQuc2NhcmxldC5vcGVyYXRpb25zLn'
    'dpbGRmaXJlLnYxLkZpcmVSBWZpcmVz');

@$core.Deprecated('Use fusedHotspotDescriptor instead')
const FusedHotspot$json = {
  '1': 'FusedHotspot',
  '2': [
    {'1': 'cell_id', '3': 1, '4': 1, '5': 9, '10': 'cellId'},
    {'1': 'lat_center', '3': 2, '4': 1, '5': 1, '10': 'latCenter'},
    {'1': 'lon_center', '3': 3, '4': 1, '5': 1, '10': 'lonCenter'},
    {'1': 'fused_confidence', '3': 4, '4': 1, '5': 1, '10': 'fusedConfidence'},
    {
      '1': 'sources_corroborating',
      '3': 5,
      '4': 3,
      '5': 9,
      '10': 'sourcesCorroborating'
    },
    {
      '1': 'recommended_state',
      '3': 6,
      '4': 1,
      '5': 9,
      '10': 'recommendedState'
    },
    {'1': 'window_start', '3': 7, '4': 1, '5': 9, '10': 'windowStart'},
    {'1': 'window_end', '3': 8, '4': 1, '5': 9, '10': 'windowEnd'},
    {'1': 'departamento', '3': 9, '4': 1, '5': 9, '10': 'departamento'},
  ],
};

/// Descriptor for `FusedHotspot`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fusedHotspotDescriptor = $convert.base64Decode(
    'CgxGdXNlZEhvdHNwb3QSFwoHY2VsbF9pZBgBIAEoCVIGY2VsbElkEh0KCmxhdF9jZW50ZXIYAi'
    'ABKAFSCWxhdENlbnRlchIdCgpsb25fY2VudGVyGAMgASgBUglsb25DZW50ZXISKQoQZnVzZWRf'
    'Y29uZmlkZW5jZRgEIAEoAVIPZnVzZWRDb25maWRlbmNlEjMKFXNvdXJjZXNfY29ycm9ib3JhdG'
    'luZxgFIAMoCVIUc291cmNlc0NvcnJvYm9yYXRpbmcSKwoRcmVjb21tZW5kZWRfc3RhdGUYBiAB'
    'KAlSEHJlY29tbWVuZGVkU3RhdGUSIQoMd2luZG93X3N0YXJ0GAcgASgJUgt3aW5kb3dTdGFydB'
    'IdCgp3aW5kb3dfZW5kGAggASgJUgl3aW5kb3dFbmQSIgoMZGVwYXJ0YW1lbnRvGAkgASgJUgxk'
    'ZXBhcnRhbWVudG8=');

@$core.Deprecated('Use fusedHotspotRequestDescriptor instead')
const FusedHotspotRequest$json = {
  '1': 'FusedHotspotRequest',
  '2': [
    {
      '1': 'recommended_state',
      '3': 1,
      '4': 1,
      '5': 9,
      '10': 'recommendedState'
    },
    {'1': 'min_confidence', '3': 2, '4': 1, '5': 1, '10': 'minConfidence'},
    {'1': 'departamento', '3': 3, '4': 1, '5': 9, '10': 'departamento'},
  ],
};

/// Descriptor for `FusedHotspotRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fusedHotspotRequestDescriptor = $convert.base64Decode(
    'ChNGdXNlZEhvdHNwb3RSZXF1ZXN0EisKEXJlY29tbWVuZGVkX3N0YXRlGAEgASgJUhByZWNvbW'
    '1lbmRlZFN0YXRlEiUKDm1pbl9jb25maWRlbmNlGAIgASgBUg1taW5Db25maWRlbmNlEiIKDGRl'
    'cGFydGFtZW50bxgDIAEoCVIMZGVwYXJ0YW1lbnRv');

@$core.Deprecated('Use fusedHotspotResponseDescriptor instead')
const FusedHotspotResponse$json = {
  '1': 'FusedHotspotResponse',
  '2': [
    {
      '1': 'hotspots',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.scarlet.operations.wildfire.v1.FusedHotspot',
      '10': 'hotspots'
    },
  ],
};

/// Descriptor for `FusedHotspotResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fusedHotspotResponseDescriptor = $convert.base64Decode(
    'ChRGdXNlZEhvdHNwb3RSZXNwb25zZRJICghob3RzcG90cxgBIAMoCzIsLnNjYXJsZXQub3Blcm'
    'F0aW9ucy53aWxkZmlyZS52MS5GdXNlZEhvdHNwb3RSCGhvdHNwb3Rz');

@$core.Deprecated('Use jurisdictionRequestDescriptor instead')
const JurisdictionRequest$json = {
  '1': 'JurisdictionRequest',
  '2': [
    {'1': 'departamento', '3': 1, '4': 1, '5': 9, '10': 'departamento'},
    {'1': 'municipio', '3': 2, '4': 1, '5': 9, '10': 'municipio'},
    {'1': 'area_protegida', '3': 3, '4': 1, '5': 9, '10': 'areaProtegida'},
  ],
};

/// Descriptor for `JurisdictionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List jurisdictionRequestDescriptor = $convert.base64Decode(
    'ChNKdXJpc2RpY3Rpb25SZXF1ZXN0EiIKDGRlcGFydGFtZW50bxgBIAEoCVIMZGVwYXJ0YW1lbn'
    'RvEhwKCW11bmljaXBpbxgCIAEoCVIJbXVuaWNpcGlvEiUKDmFyZWFfcHJvdGVnaWRhGAMgASgJ'
    'Ug1hcmVhUHJvdGVnaWRh');

@$core.Deprecated('Use hMMStatePointDescriptor instead')
const HMMStatePoint$json = {
  '1': 'HMMStatePoint',
  '2': [
    {'1': 'timestep', '3': 1, '4': 1, '5': 9, '10': 'timestep'},
    {
      '1': 'state',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.scarlet.operations.wildfire.v1.FireState',
      '10': 'state'
    },
    {'1': 'state_label', '3': 3, '4': 1, '5': 9, '10': 'stateLabel'},
    {'1': 'confidence', '3': 4, '4': 1, '5': 1, '10': 'confidence'},
  ],
};

/// Descriptor for `HMMStatePoint`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List hMMStatePointDescriptor = $convert.base64Decode(
    'Cg1ITU1TdGF0ZVBvaW50EhoKCHRpbWVzdGVwGAEgASgJUgh0aW1lc3RlcBI/CgVzdGF0ZRgCIA'
    'EoDjIpLnNjYXJsZXQub3BlcmF0aW9ucy53aWxkZmlyZS52MS5GaXJlU3RhdGVSBXN0YXRlEh8K'
    'C3N0YXRlX2xhYmVsGAMgASgJUgpzdGF0ZUxhYmVsEh4KCmNvbmZpZGVuY2UYBCABKAFSCmNvbm'
    'ZpZGVuY2U=');

@$core.Deprecated('Use stateTrajectoryRequestDescriptor instead')
const StateTrajectoryRequest$json = {
  '1': 'StateTrajectoryRequest',
  '2': [
    {'1': 'cell_id', '3': 1, '4': 1, '5': 9, '10': 'cellId'},
  ],
};

/// Descriptor for `StateTrajectoryRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stateTrajectoryRequestDescriptor =
    $convert.base64Decode(
        'ChZTdGF0ZVRyYWplY3RvcnlSZXF1ZXN0EhcKB2NlbGxfaWQYASABKAlSBmNlbGxJZA==');

@$core.Deprecated('Use stateTrajectoryResponseDescriptor instead')
const StateTrajectoryResponse$json = {
  '1': 'StateTrajectoryResponse',
  '2': [
    {'1': 'cell_id', '3': 1, '4': 1, '5': 9, '10': 'cellId'},
    {
      '1': 'trajectory',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.scarlet.operations.wildfire.v1.HMMStatePoint',
      '10': 'trajectory'
    },
    {'1': 'total_timesteps', '3': 3, '4': 1, '5': 5, '10': 'totalTimesteps'},
    {'1': 'log_probability', '3': 4, '4': 1, '5': 1, '10': 'logProbability'},
  ],
};

/// Descriptor for `StateTrajectoryResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stateTrajectoryResponseDescriptor = $convert.base64Decode(
    'ChdTdGF0ZVRyYWplY3RvcnlSZXNwb25zZRIXCgdjZWxsX2lkGAEgASgJUgZjZWxsSWQSTQoKdH'
    'JhamVjdG9yeRgCIAMoCzItLnNjYXJsZXQub3BlcmF0aW9ucy53aWxkZmlyZS52MS5ITU1TdGF0'
    'ZVBvaW50Ugp0cmFqZWN0b3J5EicKD3RvdGFsX3RpbWVzdGVwcxgDIAEoBVIOdG90YWxUaW1lc3'
    'RlcHMSJwoPbG9nX3Byb2JhYmlsaXR5GAQgASgBUg5sb2dQcm9iYWJpbGl0eQ==');

const $core.Map<$core.String, $core.dynamic> WildfireTrackingServiceBase$json =
    {
  '1': 'WildfireTrackingService',
  '2': [
    {
      '1': 'GetActiveFires',
      '2': '.google.protobuf.Empty',
      '3': '.scarlet.operations.wildfire.v1.FireListResponse',
      '4': {}
    },
    {
      '1': 'GetFusedHotspots',
      '2': '.scarlet.operations.wildfire.v1.FusedHotspotRequest',
      '3': '.scarlet.operations.wildfire.v1.FusedHotspotResponse',
      '4': {}
    },
    {
      '1': 'GetFiresByJurisdiction',
      '2': '.scarlet.operations.wildfire.v1.JurisdictionRequest',
      '3': '.scarlet.operations.wildfire.v1.FireListResponse',
      '4': {}
    },
    {
      '1': 'GetFireStateTrajectory',
      '2': '.scarlet.operations.wildfire.v1.StateTrajectoryRequest',
      '3': '.scarlet.operations.wildfire.v1.StateTrajectoryResponse',
      '4': {}
    },
  ],
};

@$core.Deprecated('Use wildfireTrackingServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    WildfireTrackingServiceBase$messageJson = {
  '.google.protobuf.Empty': $0.Empty$json,
  '.scarlet.operations.wildfire.v1.FireListResponse': FireListResponse$json,
  '.scarlet.operations.wildfire.v1.Fire': Fire$json,
  '.scarlet.operations.wildfire.v1.FusedHotspotRequest':
      FusedHotspotRequest$json,
  '.scarlet.operations.wildfire.v1.FusedHotspotResponse':
      FusedHotspotResponse$json,
  '.scarlet.operations.wildfire.v1.FusedHotspot': FusedHotspot$json,
  '.scarlet.operations.wildfire.v1.JurisdictionRequest':
      JurisdictionRequest$json,
  '.scarlet.operations.wildfire.v1.StateTrajectoryRequest':
      StateTrajectoryRequest$json,
  '.scarlet.operations.wildfire.v1.StateTrajectoryResponse':
      StateTrajectoryResponse$json,
  '.scarlet.operations.wildfire.v1.HMMStatePoint': HMMStatePoint$json,
};

/// Descriptor for `WildfireTrackingService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List wildfireTrackingServiceDescriptor = $convert.base64Decode(
    'ChdXaWxkZmlyZVRyYWNraW5nU2VydmljZRJ7Cg5HZXRBY3RpdmVGaXJlcxIWLmdvb2dsZS5wcm'
    '90b2J1Zi5FbXB0eRowLnNjYXJsZXQub3BlcmF0aW9ucy53aWxkZmlyZS52MS5GaXJlTGlzdFJl'
    'c3BvbnNlIh+C0+STAhkSFy9hcGkvd2lsZGZpcmUvdjEvYWN0aXZlEp0BChBHZXRGdXNlZEhvdH'
    'Nwb3RzEjMuc2NhcmxldC5vcGVyYXRpb25zLndpbGRmaXJlLnYxLkZ1c2VkSG90c3BvdFJlcXVl'
    'c3QaNC5zY2FybGV0Lm9wZXJhdGlvbnMud2lsZGZpcmUudjEuRnVzZWRIb3RzcG90UmVzcG9uc2'
    'UiHoLT5JMCGBIWL2FwaS93aWxkZmlyZS92MS9mdXNlZBKpAQoWR2V0RmlyZXNCeUp1cmlzZGlj'
    'dGlvbhIzLnNjYXJsZXQub3BlcmF0aW9ucy53aWxkZmlyZS52MS5KdXJpc2RpY3Rpb25SZXF1ZX'
    'N0GjAuc2NhcmxldC5vcGVyYXRpb25zLndpbGRmaXJlLnYxLkZpcmVMaXN0UmVzcG9uc2UiKILT'
    '5JMCIhIgL2FwaS93aWxkZmlyZS92MS9ieS1qdXJpc2RpY3Rpb24SuAEKFkdldEZpcmVTdGF0ZV'
    'RyYWplY3RvcnkSNi5zY2FybGV0Lm9wZXJhdGlvbnMud2lsZGZpcmUudjEuU3RhdGVUcmFqZWN0'
    'b3J5UmVxdWVzdBo3LnNjYXJsZXQub3BlcmF0aW9ucy53aWxkZmlyZS52MS5TdGF0ZVRyYWplY3'
    'RvcnlSZXNwb25zZSItgtPkkwInEiUvYXBpL3dpbGRmaXJlL3YxL3RyYWplY3Rvcnkve2NlbGxf'
    'aWR9');
