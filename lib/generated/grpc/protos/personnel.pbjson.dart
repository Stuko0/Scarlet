// This is a generated file - do not edit.
//
// Generated from protos/personnel.proto.

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

@$core.Deprecated('Use institutionDescriptor instead')
const Institution$json = {
  '1': 'Institution',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'region', '3': 3, '4': 1, '5': 9, '10': 'region'},
    {'1': 'created_at', '3': 4, '4': 1, '5': 9, '10': 'createdAt'},
    {'1': 'is_active', '3': 5, '4': 1, '5': 8, '10': 'isActive'},
  ],
};

/// Descriptor for `Institution`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List institutionDescriptor = $convert.base64Decode(
    'CgtJbnN0aXR1dGlvbhIOCgJpZBgBIAEoBVICaWQSEgoEbmFtZRgCIAEoCVIEbmFtZRIWCgZyZW'
    'dpb24YAyABKAlSBnJlZ2lvbhIdCgpjcmVhdGVkX2F0GAQgASgJUgljcmVhdGVkQXQSGwoJaXNf'
    'YWN0aXZlGAUgASgIUghpc0FjdGl2ZQ==');

@$core.Deprecated('Use branchDescriptor instead')
const Branch$json = {
  '1': 'Branch',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'institution_id', '3': 2, '4': 1, '5': 5, '10': 'institutionId'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'description', '3': 4, '4': 1, '5': 9, '10': 'description'},
  ],
};

/// Descriptor for `Branch`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List branchDescriptor = $convert.base64Decode(
    'CgZCcmFuY2gSDgoCaWQYASABKAVSAmlkEiUKDmluc3RpdHV0aW9uX2lkGAIgASgFUg1pbnN0aX'
    'R1dGlvbklkEhIKBG5hbWUYAyABKAlSBG5hbWUSIAoLZGVzY3JpcHRpb24YBCABKAlSC2Rlc2Ny'
    'aXB0aW9u');

@$core.Deprecated('Use teamDescriptor instead')
const Team$json = {
  '1': 'Team',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'branch_id', '3': 2, '4': 1, '5': 5, '10': 'branchId'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'is_active', '3': 4, '4': 1, '5': 8, '10': 'isActive'},
  ],
};

/// Descriptor for `Team`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List teamDescriptor = $convert.base64Decode(
    'CgRUZWFtEg4KAmlkGAEgASgFUgJpZBIbCglicmFuY2hfaWQYAiABKAVSCGJyYW5jaElkEhIKBG'
    '5hbWUYAyABKAlSBG5hbWUSGwoJaXNfYWN0aXZlGAQgASgIUghpc0FjdGl2ZQ==');

@$core.Deprecated('Use certificationDescriptor instead')
const Certification$json = {
  '1': 'Certification',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 5, '10': 'userId'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'issue_date', '3': 4, '4': 1, '5': 9, '10': 'issueDate'},
    {'1': 'expiry_date', '3': 5, '4': 1, '5': 9, '10': 'expiryDate'},
    {'1': 'certificate_url', '3': 6, '4': 1, '5': 9, '10': 'certificateUrl'},
  ],
};

/// Descriptor for `Certification`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List certificationDescriptor = $convert.base64Decode(
    'Cg1DZXJ0aWZpY2F0aW9uEg4KAmlkGAEgASgFUgJpZBIXCgd1c2VyX2lkGAIgASgFUgZ1c2VySW'
    'QSEgoEbmFtZRgDIAEoCVIEbmFtZRIdCgppc3N1ZV9kYXRlGAQgASgJUglpc3N1ZURhdGUSHwoL'
    'ZXhwaXJ5X2RhdGUYBSABKAlSCmV4cGlyeURhdGUSJwoPY2VydGlmaWNhdGVfdXJsGAYgASgJUg'
    '5jZXJ0aWZpY2F0ZVVybA==');

@$core.Deprecated('Use userDescriptor instead')
const User$json = {
  '1': 'User',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {
      '1': 'institution_id',
      '3': 2,
      '4': 1,
      '5': 5,
      '9': 0,
      '10': 'institutionId',
      '17': true
    },
    {
      '1': 'team_id',
      '3': 3,
      '4': 1,
      '5': 5,
      '9': 1,
      '10': 'teamId',
      '17': true
    },
    {'1': 'full_name', '3': 4, '4': 1, '5': 9, '10': 'fullName'},
    {'1': 'ci', '3': 13, '4': 1, '5': 9, '10': 'ci'},
    {'1': 'email', '3': 5, '4': 1, '5': 9, '10': 'email'},
    {'1': 'phone', '3': 6, '4': 1, '5': 9, '10': 'phone'},
    {'1': 'blood_type', '3': 7, '4': 1, '5': 9, '10': 'bloodType'},
    {'1': 'role', '3': 8, '4': 1, '5': 9, '10': 'role'},
    {'1': 'years_experience', '3': 9, '4': 1, '5': 5, '10': 'yearsExperience'},
    {'1': 'is_active', '3': 10, '4': 1, '5': 8, '10': 'isActive'},
    {'1': 'created_at', '3': 11, '4': 1, '5': 9, '10': 'createdAt'},
    {'1': 'duty_status', '3': 12, '4': 1, '5': 9, '10': 'dutyStatus'},
  ],
  '8': [
    {'1': '_institution_id'},
    {'1': '_team_id'},
  ],
};

/// Descriptor for `User`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDescriptor = $convert.base64Decode(
    'CgRVc2VyEg4KAmlkGAEgASgFUgJpZBIqCg5pbnN0aXR1dGlvbl9pZBgCIAEoBUgAUg1pbnN0aX'
    'R1dGlvbklkiAEBEhwKB3RlYW1faWQYAyABKAVIAVIGdGVhbUlkiAEBEhsKCWZ1bGxfbmFtZRgE'
    'IAEoCVIIZnVsbE5hbWUSDgoCY2kYDSABKAlSAmNpEhQKBWVtYWlsGAUgASgJUgVlbWFpbBIUCg'
    'VwaG9uZRgGIAEoCVIFcGhvbmUSHQoKYmxvb2RfdHlwZRgHIAEoCVIJYmxvb2RUeXBlEhIKBHJv'
    'bGUYCCABKAlSBHJvbGUSKQoQeWVhcnNfZXhwZXJpZW5jZRgJIAEoBVIPeWVhcnNFeHBlcmllbm'
    'NlEhsKCWlzX2FjdGl2ZRgKIAEoCFIIaXNBY3RpdmUSHQoKY3JlYXRlZF9hdBgLIAEoCVIJY3Jl'
    'YXRlZEF0Eh8KC2R1dHlfc3RhdHVzGAwgASgJUgpkdXR5U3RhdHVzQhEKD19pbnN0aXR1dGlvbl'
    '9pZEIKCghfdGVhbV9pZA==');

@$core.Deprecated('Use locationUpdateDescriptor instead')
const LocationUpdate$json = {
  '1': 'LocationUpdate',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 5, '10': 'userId'},
    {'1': 'latitude', '3': 2, '4': 1, '5': 1, '10': 'latitude'},
    {'1': 'longitude', '3': 3, '4': 1, '5': 1, '10': 'longitude'},
    {'1': 'timestamp_ms', '3': 4, '4': 1, '5': 3, '10': 'timestampMs'},
  ],
};

/// Descriptor for `LocationUpdate`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List locationUpdateDescriptor = $convert.base64Decode(
    'Cg5Mb2NhdGlvblVwZGF0ZRIXCgd1c2VyX2lkGAEgASgFUgZ1c2VySWQSGgoIbGF0aXR1ZGUYAi'
    'ABKAFSCGxhdGl0dWRlEhwKCWxvbmdpdHVkZRgDIAEoAVIJbG9uZ2l0dWRlEiEKDHRpbWVzdGFt'
    'cF9tcxgEIAEoA1ILdGltZXN0YW1wTXM=');

@$core.Deprecated('Use taskDescriptor instead')
const Task$json = {
  '1': 'Task',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {
      '1': 'institution_id',
      '3': 2,
      '4': 1,
      '5': 5,
      '9': 0,
      '10': 'institutionId',
      '17': true
    },
    {
      '1': 'assigned_team_id',
      '3': 3,
      '4': 1,
      '5': 5,
      '9': 1,
      '10': 'assignedTeamId',
      '17': true
    },
    {
      '1': 'assigned_user_id',
      '3': 4,
      '4': 1,
      '5': 5,
      '9': 2,
      '10': 'assignedUserId',
      '17': true
    },
    {'1': 'title', '3': 5, '4': 1, '5': 9, '10': 'title'},
    {'1': 'description', '3': 6, '4': 1, '5': 9, '10': 'description'},
    {'1': 'priority', '3': 7, '4': 1, '5': 9, '10': 'priority'},
    {'1': 'status', '3': 8, '4': 1, '5': 9, '10': 'status'},
    {
      '1': 'due_date',
      '3': 9,
      '4': 1,
      '5': 9,
      '9': 3,
      '10': 'dueDate',
      '17': true
    },
    {
      '1': 'created_by',
      '3': 10,
      '4': 1,
      '5': 5,
      '9': 4,
      '10': 'createdBy',
      '17': true
    },
    {'1': 'created_at', '3': 11, '4': 1, '5': 9, '10': 'createdAt'},
  ],
  '8': [
    {'1': '_institution_id'},
    {'1': '_assigned_team_id'},
    {'1': '_assigned_user_id'},
    {'1': '_due_date'},
    {'1': '_created_by'},
  ],
};

/// Descriptor for `Task`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List taskDescriptor = $convert.base64Decode(
    'CgRUYXNrEg4KAmlkGAEgASgFUgJpZBIqCg5pbnN0aXR1dGlvbl9pZBgCIAEoBUgAUg1pbnN0aX'
    'R1dGlvbklkiAEBEi0KEGFzc2lnbmVkX3RlYW1faWQYAyABKAVIAVIOYXNzaWduZWRUZWFtSWSI'
    'AQESLQoQYXNzaWduZWRfdXNlcl9pZBgEIAEoBUgCUg5hc3NpZ25lZFVzZXJJZIgBARIUCgV0aX'
    'RsZRgFIAEoCVIFdGl0bGUSIAoLZGVzY3JpcHRpb24YBiABKAlSC2Rlc2NyaXB0aW9uEhoKCHBy'
    'aW9yaXR5GAcgASgJUghwcmlvcml0eRIWCgZzdGF0dXMYCCABKAlSBnN0YXR1cxIeCghkdWVfZG'
    'F0ZRgJIAEoCUgDUgdkdWVEYXRliAEBEiIKCmNyZWF0ZWRfYnkYCiABKAVIBFIJY3JlYXRlZEJ5'
    'iAEBEh0KCmNyZWF0ZWRfYXQYCyABKAlSCWNyZWF0ZWRBdEIRCg9faW5zdGl0dXRpb25faWRCEw'
    'oRX2Fzc2lnbmVkX3RlYW1faWRCEwoRX2Fzc2lnbmVkX3VzZXJfaWRCCwoJX2R1ZV9kYXRlQg0K'
    'C19jcmVhdGVkX2J5');

@$core.Deprecated('Use loginRequestDescriptor instead')
const LoginRequest$json = {
  '1': 'LoginRequest',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `LoginRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginRequestDescriptor = $convert.base64Decode(
    'CgxMb2dpblJlcXVlc3QSFAoFZW1haWwYASABKAlSBWVtYWlsEhoKCHBhc3N3b3JkGAIgASgJUg'
    'hwYXNzd29yZA==');

@$core.Deprecated('Use loginResponseDescriptor instead')
const LoginResponse$json = {
  '1': 'LoginResponse',
  '2': [
    {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
    {
      '1': 'user',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.scarlet.operations.personnel.v1.User',
      '10': 'user'
    },
  ],
};

/// Descriptor for `LoginResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginResponseDescriptor = $convert.base64Decode(
    'Cg1Mb2dpblJlc3BvbnNlEhQKBXRva2VuGAEgASgJUgV0b2tlbhI5CgR1c2VyGAIgASgLMiUuc2'
    'NhcmxldC5vcGVyYXRpb25zLnBlcnNvbm5lbC52MS5Vc2VyUgR1c2Vy');

@$core.Deprecated('Use getUserRequestDescriptor instead')
const GetUserRequest$json = {
  '1': 'GetUserRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 5, '10': 'userId'},
  ],
};

/// Descriptor for `GetUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserRequestDescriptor = $convert
    .base64Decode('Cg5HZXRVc2VyUmVxdWVzdBIXCgd1c2VyX2lkGAEgASgFUgZ1c2VySWQ=');

@$core.Deprecated('Use userResponseDescriptor instead')
const UserResponse$json = {
  '1': 'UserResponse',
  '2': [
    {
      '1': 'user',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.scarlet.operations.personnel.v1.User',
      '10': 'user'
    },
  ],
};

/// Descriptor for `UserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userResponseDescriptor = $convert.base64Decode(
    'CgxVc2VyUmVzcG9uc2USOQoEdXNlchgBIAEoCzIlLnNjYXJsZXQub3BlcmF0aW9ucy5wZXJzb2'
    '5uZWwudjEuVXNlclIEdXNlcg==');

@$core.Deprecated('Use listUsersByTeamRequestDescriptor instead')
const ListUsersByTeamRequest$json = {
  '1': 'ListUsersByTeamRequest',
  '2': [
    {'1': 'team_id', '3': 1, '4': 1, '5': 5, '10': 'teamId'},
  ],
};

/// Descriptor for `ListUsersByTeamRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listUsersByTeamRequestDescriptor =
    $convert.base64Decode(
        'ChZMaXN0VXNlcnNCeVRlYW1SZXF1ZXN0EhcKB3RlYW1faWQYASABKAVSBnRlYW1JZA==');

@$core.Deprecated('Use listUsersRequestDescriptor instead')
const ListUsersRequest$json = {
  '1': 'ListUsersRequest',
  '2': [
    {'1': 'page_size', '3': 1, '4': 1, '5': 5, '10': 'pageSize'},
    {'1': 'page_token', '3': 2, '4': 1, '5': 5, '10': 'pageToken'},
  ],
};

/// Descriptor for `ListUsersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listUsersRequestDescriptor = $convert.base64Decode(
    'ChBMaXN0VXNlcnNSZXF1ZXN0EhsKCXBhZ2Vfc2l6ZRgBIAEoBVIIcGFnZVNpemUSHQoKcGFnZV'
    '90b2tlbhgCIAEoBVIJcGFnZVRva2Vu');

@$core.Deprecated('Use listUsersResponseDescriptor instead')
const ListUsersResponse$json = {
  '1': 'ListUsersResponse',
  '2': [
    {
      '1': 'users',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.scarlet.operations.personnel.v1.User',
      '10': 'users'
    },
    {'1': 'next_page_token', '3': 2, '4': 1, '5': 9, '10': 'nextPageToken'},
  ],
};

/// Descriptor for `ListUsersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listUsersResponseDescriptor = $convert.base64Decode(
    'ChFMaXN0VXNlcnNSZXNwb25zZRI7CgV1c2VycxgBIAMoCzIlLnNjYXJsZXQub3BlcmF0aW9ucy'
    '5wZXJzb25uZWwudjEuVXNlclIFdXNlcnMSJgoPbmV4dF9wYWdlX3Rva2VuGAIgASgJUg1uZXh0'
    'UGFnZVRva2Vu');

@$core.Deprecated('Use userListResponseDescriptor instead')
const UserListResponse$json = {
  '1': 'UserListResponse',
  '2': [
    {
      '1': 'users',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.scarlet.operations.personnel.v1.User',
      '10': 'users'
    },
  ],
};

/// Descriptor for `UserListResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userListResponseDescriptor = $convert.base64Decode(
    'ChBVc2VyTGlzdFJlc3BvbnNlEjsKBXVzZXJzGAEgAygLMiUuc2NhcmxldC5vcGVyYXRpb25zLn'
    'BlcnNvbm5lbC52MS5Vc2VyUgV1c2Vycw==');

@$core.Deprecated('Use teamListResponseDescriptor instead')
const TeamListResponse$json = {
  '1': 'TeamListResponse',
  '2': [
    {
      '1': 'teams',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.scarlet.operations.personnel.v1.Team',
      '10': 'teams'
    },
  ],
};

/// Descriptor for `TeamListResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List teamListResponseDescriptor = $convert.base64Decode(
    'ChBUZWFtTGlzdFJlc3BvbnNlEjsKBXRlYW1zGAEgAygLMiUuc2NhcmxldC5vcGVyYXRpb25zLn'
    'BlcnNvbm5lbC52MS5UZWFtUgV0ZWFtcw==');

@$core.Deprecated('Use institutionListResponseDescriptor instead')
const InstitutionListResponse$json = {
  '1': 'InstitutionListResponse',
  '2': [
    {
      '1': 'institutions',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.scarlet.operations.personnel.v1.Institution',
      '10': 'institutions'
    },
  ],
};

/// Descriptor for `InstitutionListResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List institutionListResponseDescriptor = $convert.base64Decode(
    'ChdJbnN0aXR1dGlvbkxpc3RSZXNwb25zZRJQCgxpbnN0aXR1dGlvbnMYASADKAsyLC5zY2FybG'
    'V0Lm9wZXJhdGlvbnMucGVyc29ubmVsLnYxLkluc3RpdHV0aW9uUgxpbnN0aXR1dGlvbnM=');

@$core.Deprecated('Use listBranchesRequestDescriptor instead')
const ListBranchesRequest$json = {
  '1': 'ListBranchesRequest',
  '2': [
    {'1': 'institution_id', '3': 1, '4': 1, '5': 5, '10': 'institutionId'},
  ],
};

/// Descriptor for `ListBranchesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listBranchesRequestDescriptor = $convert.base64Decode(
    'ChNMaXN0QnJhbmNoZXNSZXF1ZXN0EiUKDmluc3RpdHV0aW9uX2lkGAEgASgFUg1pbnN0aXR1dG'
    'lvbklk');

@$core.Deprecated('Use branchListResponseDescriptor instead')
const BranchListResponse$json = {
  '1': 'BranchListResponse',
  '2': [
    {
      '1': 'branches',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.scarlet.operations.personnel.v1.Branch',
      '10': 'branches'
    },
  ],
};

/// Descriptor for `BranchListResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List branchListResponseDescriptor = $convert.base64Decode(
    'ChJCcmFuY2hMaXN0UmVzcG9uc2USQwoIYnJhbmNoZXMYASADKAsyJy5zY2FybGV0Lm9wZXJhdG'
    'lvbnMucGVyc29ubmVsLnYxLkJyYW5jaFIIYnJhbmNoZXM=');

@$core.Deprecated('Use createUserRequestDescriptor instead')
const CreateUserRequest$json = {
  '1': 'CreateUserRequest',
  '2': [
    {'1': 'ci', '3': 10, '4': 1, '5': 9, '10': 'ci'},
    {
      '1': 'institution_id',
      '3': 1,
      '4': 1,
      '5': 5,
      '9': 0,
      '10': 'institutionId',
      '17': true
    },
    {
      '1': 'team_id',
      '3': 2,
      '4': 1,
      '5': 5,
      '9': 1,
      '10': 'teamId',
      '17': true
    },
    {'1': 'full_name', '3': 3, '4': 1, '5': 9, '10': 'fullName'},
    {'1': 'email', '3': 4, '4': 1, '5': 9, '10': 'email'},
    {'1': 'raw_password', '3': 5, '4': 1, '5': 9, '10': 'rawPassword'},
    {'1': 'phone', '3': 6, '4': 1, '5': 9, '10': 'phone'},
    {'1': 'blood_type', '3': 7, '4': 1, '5': 9, '10': 'bloodType'},
    {'1': 'role', '3': 8, '4': 1, '5': 9, '10': 'role'},
    {'1': 'years_experience', '3': 9, '4': 1, '5': 5, '10': 'yearsExperience'},
  ],
  '8': [
    {'1': '_institution_id'},
    {'1': '_team_id'},
  ],
};

/// Descriptor for `CreateUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createUserRequestDescriptor = $convert.base64Decode(
    'ChFDcmVhdGVVc2VyUmVxdWVzdBIOCgJjaRgKIAEoCVICY2kSKgoOaW5zdGl0dXRpb25faWQYAS'
    'ABKAVIAFINaW5zdGl0dXRpb25JZIgBARIcCgd0ZWFtX2lkGAIgASgFSAFSBnRlYW1JZIgBARIb'
    'CglmdWxsX25hbWUYAyABKAlSCGZ1bGxOYW1lEhQKBWVtYWlsGAQgASgJUgVlbWFpbBIhCgxyYX'
    'dfcGFzc3dvcmQYBSABKAlSC3Jhd1Bhc3N3b3JkEhQKBXBob25lGAYgASgJUgVwaG9uZRIdCgpi'
    'bG9vZF90eXBlGAcgASgJUglibG9vZFR5cGUSEgoEcm9sZRgIIAEoCVIEcm9sZRIpChB5ZWFyc1'
    '9leHBlcmllbmNlGAkgASgFUg95ZWFyc0V4cGVyaWVuY2VCEQoPX2luc3RpdHV0aW9uX2lkQgoK'
    'CF90ZWFtX2lk');

@$core.Deprecated('Use certificationListResponseDescriptor instead')
const CertificationListResponse$json = {
  '1': 'CertificationListResponse',
  '2': [
    {
      '1': 'certifications',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.scarlet.operations.personnel.v1.Certification',
      '10': 'certifications'
    },
  ],
};

/// Descriptor for `CertificationListResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List certificationListResponseDescriptor = $convert.base64Decode(
    'ChlDZXJ0aWZpY2F0aW9uTGlzdFJlc3BvbnNlElYKDmNlcnRpZmljYXRpb25zGAEgAygLMi4uc2'
    'NhcmxldC5vcGVyYXRpb25zLnBlcnNvbm5lbC52MS5DZXJ0aWZpY2F0aW9uUg5jZXJ0aWZpY2F0'
    'aW9ucw==');

@$core.Deprecated('Use updateUserRequestDescriptor instead')
const UpdateUserRequest$json = {
  '1': 'UpdateUserRequest',
  '2': [
    {
      '1': 'user',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.scarlet.operations.personnel.v1.User',
      '10': 'user'
    },
  ],
};

/// Descriptor for `UpdateUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateUserRequestDescriptor = $convert.base64Decode(
    'ChFVcGRhdGVVc2VyUmVxdWVzdBI5CgR1c2VyGAEgASgLMiUuc2NhcmxldC5vcGVyYXRpb25zLn'
    'BlcnNvbm5lbC52MS5Vc2VyUgR1c2Vy');

@$core.Deprecated('Use getTeamRequestDescriptor instead')
const GetTeamRequest$json = {
  '1': 'GetTeamRequest',
  '2': [
    {'1': 'team_id', '3': 1, '4': 1, '5': 5, '10': 'teamId'},
  ],
};

/// Descriptor for `GetTeamRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTeamRequestDescriptor = $convert
    .base64Decode('Cg5HZXRUZWFtUmVxdWVzdBIXCgd0ZWFtX2lkGAEgASgFUgZ0ZWFtSWQ=');

@$core.Deprecated('Use teamResponseDescriptor instead')
const TeamResponse$json = {
  '1': 'TeamResponse',
  '2': [
    {
      '1': 'team',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.scarlet.operations.personnel.v1.Team',
      '10': 'team'
    },
    {
      '1': 'branch',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.scarlet.operations.personnel.v1.Branch',
      '10': 'branch'
    },
    {
      '1': 'institution',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.scarlet.operations.personnel.v1.Institution',
      '10': 'institution'
    },
  ],
};

/// Descriptor for `TeamResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List teamResponseDescriptor = $convert.base64Decode(
    'CgxUZWFtUmVzcG9uc2USOQoEdGVhbRgBIAEoCzIlLnNjYXJsZXQub3BlcmF0aW9ucy5wZXJzb2'
    '5uZWwudjEuVGVhbVIEdGVhbRI/CgZicmFuY2gYAiABKAsyJy5zY2FybGV0Lm9wZXJhdGlvbnMu'
    'cGVyc29ubmVsLnYxLkJyYW5jaFIGYnJhbmNoEk4KC2luc3RpdHV0aW9uGAMgASgLMiwuc2Nhcm'
    'xldC5vcGVyYXRpb25zLnBlcnNvbm5lbC52MS5JbnN0aXR1dGlvblILaW5zdGl0dXRpb24=');

@$core.Deprecated('Use reportLocationResponseDescriptor instead')
const ReportLocationResponse$json = {
  '1': 'ReportLocationResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `ReportLocationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reportLocationResponseDescriptor =
    $convert.base64Decode(
        'ChZSZXBvcnRMb2NhdGlvblJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3M=');

@$core.Deprecated('Use updateStatusRequestDescriptor instead')
const UpdateStatusRequest$json = {
  '1': 'UpdateStatusRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 5, '10': 'userId'},
    {'1': 'duty_status', '3': 2, '4': 1, '5': 9, '10': 'dutyStatus'},
  ],
};

/// Descriptor for `UpdateStatusRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateStatusRequestDescriptor = $convert.base64Decode(
    'ChNVcGRhdGVTdGF0dXNSZXF1ZXN0EhcKB3VzZXJfaWQYASABKAVSBnVzZXJJZBIfCgtkdXR5X3'
    'N0YXR1cxgCIAEoCVIKZHV0eVN0YXR1cw==');

@$core.Deprecated('Use skillDescriptor instead')
const Skill$json = {
  '1': 'Skill',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 5, '10': 'userId'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'category', '3': 4, '4': 1, '5': 9, '10': 'category'},
  ],
};

/// Descriptor for `Skill`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List skillDescriptor = $convert.base64Decode(
    'CgVTa2lsbBIOCgJpZBgBIAEoBVICaWQSFwoHdXNlcl9pZBgCIAEoBVIGdXNlcklkEhIKBG5hbW'
    'UYAyABKAlSBG5hbWUSGgoIY2F0ZWdvcnkYBCABKAlSCGNhdGVnb3J5');

@$core.Deprecated('Use skillRequestDescriptor instead')
const SkillRequest$json = {
  '1': 'SkillRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 5, '10': 'userId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'category', '3': 3, '4': 1, '5': 9, '10': 'category'},
  ],
};

/// Descriptor for `SkillRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List skillRequestDescriptor = $convert.base64Decode(
    'CgxTa2lsbFJlcXVlc3QSFwoHdXNlcl9pZBgBIAEoBVIGdXNlcklkEhIKBG5hbWUYAiABKAlSBG'
    '5hbWUSGgoIY2F0ZWdvcnkYAyABKAlSCGNhdGVnb3J5');

@$core.Deprecated('Use skillListDescriptor instead')
const SkillList$json = {
  '1': 'SkillList',
  '2': [
    {
      '1': 'skills',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.scarlet.operations.personnel.v1.Skill',
      '10': 'skills'
    },
  ],
};

/// Descriptor for `SkillList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List skillListDescriptor = $convert.base64Decode(
    'CglTa2lsbExpc3QSPgoGc2tpbGxzGAEgAygLMiYuc2NhcmxldC5vcGVyYXRpb25zLnBlcnNvbm'
    '5lbC52MS5Ta2lsbFIGc2tpbGxz');

@$core.Deprecated('Use assignRequestDescriptor instead')
const AssignRequest$json = {
  '1': 'AssignRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 5, '10': 'userId'},
    {'1': 'new_team_id', '3': 2, '4': 1, '5': 5, '10': 'newTeamId'},
    {'1': 'new_role', '3': 3, '4': 1, '5': 9, '10': 'newRole'},
  ],
};

/// Descriptor for `AssignRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List assignRequestDescriptor = $convert.base64Decode(
    'Cg1Bc3NpZ25SZXF1ZXN0EhcKB3VzZXJfaWQYASABKAVSBnVzZXJJZBIeCgtuZXdfdGVhbV9pZB'
    'gCIAEoBVIJbmV3VGVhbUlkEhkKCG5ld19yb2xlGAMgASgJUgduZXdSb2xl');

@$core.Deprecated('Use createTeamRequestDescriptor instead')
const CreateTeamRequest$json = {
  '1': 'CreateTeamRequest',
  '2': [
    {'1': 'branch_id', '3': 1, '4': 1, '5': 5, '10': 'branchId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `CreateTeamRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createTeamRequestDescriptor = $convert.base64Decode(
    'ChFDcmVhdGVUZWFtUmVxdWVzdBIbCglicmFuY2hfaWQYASABKAVSCGJyYW5jaElkEhIKBG5hbW'
    'UYAiABKAlSBG5hbWU=');

@$core.Deprecated('Use updateTeamRequestDescriptor instead')
const UpdateTeamRequest$json = {
  '1': 'UpdateTeamRequest',
  '2': [
    {'1': 'team_id', '3': 1, '4': 1, '5': 5, '10': 'teamId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'is_active', '3': 3, '4': 1, '5': 8, '10': 'isActive'},
  ],
};

/// Descriptor for `UpdateTeamRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateTeamRequestDescriptor = $convert.base64Decode(
    'ChFVcGRhdGVUZWFtUmVxdWVzdBIXCgd0ZWFtX2lkGAEgASgFUgZ0ZWFtSWQSEgoEbmFtZRgCIA'
    'EoCVIEbmFtZRIbCglpc19hY3RpdmUYAyABKAhSCGlzQWN0aXZl');

@$core.Deprecated('Use deleteTeamRequestDescriptor instead')
const DeleteTeamRequest$json = {
  '1': 'DeleteTeamRequest',
  '2': [
    {'1': 'team_id', '3': 1, '4': 1, '5': 5, '10': 'teamId'},
  ],
};

/// Descriptor for `DeleteTeamRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteTeamRequestDescriptor = $convert.base64Decode(
    'ChFEZWxldGVUZWFtUmVxdWVzdBIXCgd0ZWFtX2lkGAEgASgFUgZ0ZWFtSWQ=');

@$core.Deprecated('Use getInstitutionRequestDescriptor instead')
const GetInstitutionRequest$json = {
  '1': 'GetInstitutionRequest',
  '2': [
    {'1': 'institution_id', '3': 1, '4': 1, '5': 5, '10': 'institutionId'},
  ],
};

/// Descriptor for `GetInstitutionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getInstitutionRequestDescriptor = $convert.base64Decode(
    'ChVHZXRJbnN0aXR1dGlvblJlcXVlc3QSJQoOaW5zdGl0dXRpb25faWQYASABKAVSDWluc3RpdH'
    'V0aW9uSWQ=');

@$core.Deprecated('Use institutionResponseDescriptor instead')
const InstitutionResponse$json = {
  '1': 'InstitutionResponse',
  '2': [
    {
      '1': 'institution',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.scarlet.operations.personnel.v1.Institution',
      '10': 'institution'
    },
  ],
};

/// Descriptor for `InstitutionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List institutionResponseDescriptor = $convert.base64Decode(
    'ChNJbnN0aXR1dGlvblJlc3BvbnNlEk4KC2luc3RpdHV0aW9uGAEgASgLMiwuc2NhcmxldC5vcG'
    'VyYXRpb25zLnBlcnNvbm5lbC52MS5JbnN0aXR1dGlvblILaW5zdGl0dXRpb24=');

@$core.Deprecated('Use createInstitutionRequestDescriptor instead')
const CreateInstitutionRequest$json = {
  '1': 'CreateInstitutionRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'region', '3': 2, '4': 1, '5': 9, '10': 'region'},
  ],
};

/// Descriptor for `CreateInstitutionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createInstitutionRequestDescriptor =
    $convert.base64Decode(
        'ChhDcmVhdGVJbnN0aXR1dGlvblJlcXVlc3QSEgoEbmFtZRgBIAEoCVIEbmFtZRIWCgZyZWdpb2'
        '4YAiABKAlSBnJlZ2lvbg==');

@$core.Deprecated('Use updateInstitutionRequestDescriptor instead')
const UpdateInstitutionRequest$json = {
  '1': 'UpdateInstitutionRequest',
  '2': [
    {'1': 'institution_id', '3': 1, '4': 1, '5': 5, '10': 'institutionId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'region', '3': 3, '4': 1, '5': 9, '10': 'region'},
    {'1': 'is_active', '3': 4, '4': 1, '5': 8, '10': 'isActive'},
  ],
};

/// Descriptor for `UpdateInstitutionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateInstitutionRequestDescriptor = $convert.base64Decode(
    'ChhVcGRhdGVJbnN0aXR1dGlvblJlcXVlc3QSJQoOaW5zdGl0dXRpb25faWQYASABKAVSDWluc3'
    'RpdHV0aW9uSWQSEgoEbmFtZRgCIAEoCVIEbmFtZRIWCgZyZWdpb24YAyABKAlSBnJlZ2lvbhIb'
    'Cglpc19hY3RpdmUYBCABKAhSCGlzQWN0aXZl');

@$core.Deprecated('Use deleteInstitutionRequestDescriptor instead')
const DeleteInstitutionRequest$json = {
  '1': 'DeleteInstitutionRequest',
  '2': [
    {'1': 'institution_id', '3': 1, '4': 1, '5': 5, '10': 'institutionId'},
  ],
};

/// Descriptor for `DeleteInstitutionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteInstitutionRequestDescriptor =
    $convert.base64Decode(
        'ChhEZWxldGVJbnN0aXR1dGlvblJlcXVlc3QSJQoOaW5zdGl0dXRpb25faWQYASABKAVSDWluc3'
        'RpdHV0aW9uSWQ=');

@$core.Deprecated('Use createBranchRequestDescriptor instead')
const CreateBranchRequest$json = {
  '1': 'CreateBranchRequest',
  '2': [
    {'1': 'institution_id', '3': 1, '4': 1, '5': 5, '10': 'institutionId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
  ],
};

/// Descriptor for `CreateBranchRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createBranchRequestDescriptor = $convert.base64Decode(
    'ChNDcmVhdGVCcmFuY2hSZXF1ZXN0EiUKDmluc3RpdHV0aW9uX2lkGAEgASgFUg1pbnN0aXR1dG'
    'lvbklkEhIKBG5hbWUYAiABKAlSBG5hbWUSIAoLZGVzY3JpcHRpb24YAyABKAlSC2Rlc2NyaXB0'
    'aW9u');

@$core.Deprecated('Use branchResponseDescriptor instead')
const BranchResponse$json = {
  '1': 'BranchResponse',
  '2': [
    {
      '1': 'branch',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.scarlet.operations.personnel.v1.Branch',
      '10': 'branch'
    },
  ],
};

/// Descriptor for `BranchResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List branchResponseDescriptor = $convert.base64Decode(
    'Cg5CcmFuY2hSZXNwb25zZRI/CgZicmFuY2gYASABKAsyJy5zY2FybGV0Lm9wZXJhdGlvbnMucG'
    'Vyc29ubmVsLnYxLkJyYW5jaFIGYnJhbmNo');

@$core.Deprecated('Use updateBranchRequestDescriptor instead')
const UpdateBranchRequest$json = {
  '1': 'UpdateBranchRequest',
  '2': [
    {'1': 'branch_id', '3': 1, '4': 1, '5': 5, '10': 'branchId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
  ],
};

/// Descriptor for `UpdateBranchRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateBranchRequestDescriptor = $convert.base64Decode(
    'ChNVcGRhdGVCcmFuY2hSZXF1ZXN0EhsKCWJyYW5jaF9pZBgBIAEoBVIIYnJhbmNoSWQSEgoEbm'
    'FtZRgCIAEoCVIEbmFtZRIgCgtkZXNjcmlwdGlvbhgDIAEoCVILZGVzY3JpcHRpb24=');

@$core.Deprecated('Use deleteBranchRequestDescriptor instead')
const DeleteBranchRequest$json = {
  '1': 'DeleteBranchRequest',
  '2': [
    {'1': 'branch_id', '3': 1, '4': 1, '5': 5, '10': 'branchId'},
  ],
};

/// Descriptor for `DeleteBranchRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteBranchRequestDescriptor =
    $convert.base64Decode(
        'ChNEZWxldGVCcmFuY2hSZXF1ZXN0EhsKCWJyYW5jaF9pZBgBIAEoBVIIYnJhbmNoSWQ=');

@$core.Deprecated('Use deleteUserRequestDescriptor instead')
const DeleteUserRequest$json = {
  '1': 'DeleteUserRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 5, '10': 'userId'},
  ],
};

/// Descriptor for `DeleteUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteUserRequestDescriptor = $convert.base64Decode(
    'ChFEZWxldGVVc2VyUmVxdWVzdBIXCgd1c2VyX2lkGAEgASgFUgZ1c2VySWQ=');

@$core.Deprecated('Use addCertificationRequestDescriptor instead')
const AddCertificationRequest$json = {
  '1': 'AddCertificationRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 5, '10': 'userId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'issue_date', '3': 3, '4': 1, '5': 9, '10': 'issueDate'},
    {'1': 'expiry_date', '3': 4, '4': 1, '5': 9, '10': 'expiryDate'},
    {'1': 'certificate_url', '3': 5, '4': 1, '5': 9, '10': 'certificateUrl'},
  ],
};

/// Descriptor for `AddCertificationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addCertificationRequestDescriptor = $convert.base64Decode(
    'ChdBZGRDZXJ0aWZpY2F0aW9uUmVxdWVzdBIXCgd1c2VyX2lkGAEgASgFUgZ1c2VySWQSEgoEbm'
    'FtZRgCIAEoCVIEbmFtZRIdCgppc3N1ZV9kYXRlGAMgASgJUglpc3N1ZURhdGUSHwoLZXhwaXJ5'
    'X2RhdGUYBCABKAlSCmV4cGlyeURhdGUSJwoPY2VydGlmaWNhdGVfdXJsGAUgASgJUg5jZXJ0aW'
    'ZpY2F0ZVVybA==');

@$core.Deprecated('Use listTasksRequestDescriptor instead')
const ListTasksRequest$json = {
  '1': 'ListTasksRequest',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'status', '17': true},
    {
      '1': 'team_id',
      '3': 2,
      '4': 1,
      '5': 5,
      '9': 1,
      '10': 'teamId',
      '17': true
    },
  ],
  '8': [
    {'1': '_status'},
    {'1': '_team_id'},
  ],
};

/// Descriptor for `ListTasksRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listTasksRequestDescriptor = $convert.base64Decode(
    'ChBMaXN0VGFza3NSZXF1ZXN0EhsKBnN0YXR1cxgBIAEoCUgAUgZzdGF0dXOIAQESHAoHdGVhbV'
    '9pZBgCIAEoBUgBUgZ0ZWFtSWSIAQFCCQoHX3N0YXR1c0IKCghfdGVhbV9pZA==');

@$core.Deprecated('Use taskListResponseDescriptor instead')
const TaskListResponse$json = {
  '1': 'TaskListResponse',
  '2': [
    {
      '1': 'tasks',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.scarlet.operations.personnel.v1.Task',
      '10': 'tasks'
    },
  ],
};

/// Descriptor for `TaskListResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List taskListResponseDescriptor = $convert.base64Decode(
    'ChBUYXNrTGlzdFJlc3BvbnNlEjsKBXRhc2tzGAEgAygLMiUuc2NhcmxldC5vcGVyYXRpb25zLn'
    'BlcnNvbm5lbC52MS5UYXNrUgV0YXNrcw==');

@$core.Deprecated('Use taskResponseDescriptor instead')
const TaskResponse$json = {
  '1': 'TaskResponse',
  '2': [
    {
      '1': 'task',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.scarlet.operations.personnel.v1.Task',
      '10': 'task'
    },
  ],
};

/// Descriptor for `TaskResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List taskResponseDescriptor = $convert.base64Decode(
    'CgxUYXNrUmVzcG9uc2USOQoEdGFzaxgBIAEoCzIlLnNjYXJsZXQub3BlcmF0aW9ucy5wZXJzb2'
    '5uZWwudjEuVGFza1IEdGFzaw==');

@$core.Deprecated('Use createTaskRequestDescriptor instead')
const CreateTaskRequest$json = {
  '1': 'CreateTaskRequest',
  '2': [
    {
      '1': 'institution_id',
      '3': 1,
      '4': 1,
      '5': 5,
      '9': 0,
      '10': 'institutionId',
      '17': true
    },
    {
      '1': 'assigned_team_id',
      '3': 2,
      '4': 1,
      '5': 5,
      '9': 1,
      '10': 'assignedTeamId',
      '17': true
    },
    {
      '1': 'assigned_user_id',
      '3': 3,
      '4': 1,
      '5': 5,
      '9': 2,
      '10': 'assignedUserId',
      '17': true
    },
    {'1': 'title', '3': 4, '4': 1, '5': 9, '10': 'title'},
    {'1': 'description', '3': 5, '4': 1, '5': 9, '10': 'description'},
    {'1': 'priority', '3': 6, '4': 1, '5': 9, '10': 'priority'},
    {'1': 'status', '3': 7, '4': 1, '5': 9, '10': 'status'},
    {
      '1': 'due_date',
      '3': 8,
      '4': 1,
      '5': 9,
      '9': 3,
      '10': 'dueDate',
      '17': true
    },
    {
      '1': 'created_by',
      '3': 9,
      '4': 1,
      '5': 5,
      '9': 4,
      '10': 'createdBy',
      '17': true
    },
  ],
  '8': [
    {'1': '_institution_id'},
    {'1': '_assigned_team_id'},
    {'1': '_assigned_user_id'},
    {'1': '_due_date'},
    {'1': '_created_by'},
  ],
};

/// Descriptor for `CreateTaskRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createTaskRequestDescriptor = $convert.base64Decode(
    'ChFDcmVhdGVUYXNrUmVxdWVzdBIqCg5pbnN0aXR1dGlvbl9pZBgBIAEoBUgAUg1pbnN0aXR1dG'
    'lvbklkiAEBEi0KEGFzc2lnbmVkX3RlYW1faWQYAiABKAVIAVIOYXNzaWduZWRUZWFtSWSIAQES'
    'LQoQYXNzaWduZWRfdXNlcl9pZBgDIAEoBUgCUg5hc3NpZ25lZFVzZXJJZIgBARIUCgV0aXRsZR'
    'gEIAEoCVIFdGl0bGUSIAoLZGVzY3JpcHRpb24YBSABKAlSC2Rlc2NyaXB0aW9uEhoKCHByaW9y'
    'aXR5GAYgASgJUghwcmlvcml0eRIWCgZzdGF0dXMYByABKAlSBnN0YXR1cxIeCghkdWVfZGF0ZR'
    'gIIAEoCUgDUgdkdWVEYXRliAEBEiIKCmNyZWF0ZWRfYnkYCSABKAVIBFIJY3JlYXRlZEJ5iAEB'
    'QhEKD19pbnN0aXR1dGlvbl9pZEITChFfYXNzaWduZWRfdGVhbV9pZEITChFfYXNzaWduZWRfdX'
    'Nlcl9pZEILCglfZHVlX2RhdGVCDQoLX2NyZWF0ZWRfYnk=');

@$core.Deprecated('Use dashboardStatsRequestDescriptor instead')
const DashboardStatsRequest$json = {
  '1': 'DashboardStatsRequest',
  '2': [
    {
      '1': 'institution_id',
      '3': 1,
      '4': 1,
      '5': 5,
      '9': 0,
      '10': 'institutionId',
      '17': true
    },
  ],
  '8': [
    {'1': '_institution_id'},
  ],
};

/// Descriptor for `DashboardStatsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dashboardStatsRequestDescriptor = $convert.base64Decode(
    'ChVEYXNoYm9hcmRTdGF0c1JlcXVlc3QSKgoOaW5zdGl0dXRpb25faWQYASABKAVIAFINaW5zdG'
    'l0dXRpb25JZIgBAUIRCg9faW5zdGl0dXRpb25faWQ=');

@$core.Deprecated('Use dashboardStatsResponseDescriptor instead')
const DashboardStatsResponse$json = {
  '1': 'DashboardStatsResponse',
  '2': [
    {'1': 'active_users', '3': 1, '4': 1, '5': 5, '10': 'activeUsers'},
    {'1': 'active_teams', '3': 2, '4': 1, '5': 5, '10': 'activeTeams'},
    {'1': 'total_branches', '3': 3, '4': 1, '5': 5, '10': 'totalBranches'},
    {'1': 'pending_tasks', '3': 4, '4': 1, '5': 5, '10': 'pendingTasks'},
    {'1': 'in_progress_tasks', '3': 5, '4': 1, '5': 5, '10': 'inProgressTasks'},
    {'1': 'critical_tasks', '3': 6, '4': 1, '5': 5, '10': 'criticalTasks'},
  ],
};

/// Descriptor for `DashboardStatsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dashboardStatsResponseDescriptor = $convert.base64Decode(
    'ChZEYXNoYm9hcmRTdGF0c1Jlc3BvbnNlEiEKDGFjdGl2ZV91c2VycxgBIAEoBVILYWN0aXZlVX'
    'NlcnMSIQoMYWN0aXZlX3RlYW1zGAIgASgFUgthY3RpdmVUZWFtcxIlCg50b3RhbF9icmFuY2hl'
    'cxgDIAEoBVINdG90YWxCcmFuY2hlcxIjCg1wZW5kaW5nX3Rhc2tzGAQgASgFUgxwZW5kaW5nVG'
    'Fza3MSKgoRaW5fcHJvZ3Jlc3NfdGFza3MYBSABKAVSD2luUHJvZ3Jlc3NUYXNrcxIlCg5jcml0'
    'aWNhbF90YXNrcxgGIAEoBVINY3JpdGljYWxUYXNrcw==');

@$core.Deprecated('Use updateTaskStatusRequestDescriptor instead')
const UpdateTaskStatusRequest$json = {
  '1': 'UpdateTaskStatusRequest',
  '2': [
    {'1': 'task_id', '3': 1, '4': 1, '5': 5, '10': 'taskId'},
    {'1': 'status', '3': 2, '4': 1, '5': 9, '10': 'status'},
  ],
};

/// Descriptor for `UpdateTaskStatusRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateTaskStatusRequestDescriptor =
    $convert.base64Decode(
        'ChdVcGRhdGVUYXNrU3RhdHVzUmVxdWVzdBIXCgd0YXNrX2lkGAEgASgFUgZ0YXNrSWQSFgoGc3'
        'RhdHVzGAIgASgJUgZzdGF0dXM=');

@$core.Deprecated('Use deleteResponseDescriptor instead')
const DeleteResponse$json = {
  '1': 'DeleteResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `DeleteResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteResponseDescriptor = $convert
    .base64Decode('Cg5EZWxldGVSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNz');

const $core.Map<$core.String, $core.dynamic> PersonnelServiceBase$json = {
  '1': 'PersonnelService',
  '2': [
    {
      '1': 'LoginUser',
      '2': '.scarlet.operations.personnel.v1.LoginRequest',
      '3': '.scarlet.operations.personnel.v1.LoginResponse',
      '4': {}
    },
    {
      '1': 'GetUser',
      '2': '.scarlet.operations.personnel.v1.GetUserRequest',
      '3': '.scarlet.operations.personnel.v1.UserResponse',
      '4': {}
    },
    {
      '1': 'ListAllUsers',
      '2': '.scarlet.operations.personnel.v1.ListUsersRequest',
      '3': '.scarlet.operations.personnel.v1.ListUsersResponse',
      '4': {}
    },
    {
      '1': 'UpdateUser',
      '2': '.scarlet.operations.personnel.v1.UpdateUserRequest',
      '3': '.scarlet.operations.personnel.v1.UserResponse',
      '4': {}
    },
    {
      '1': 'CreateUser',
      '2': '.scarlet.operations.personnel.v1.CreateUserRequest',
      '3': '.scarlet.operations.personnel.v1.UserResponse',
      '4': {}
    },
    {
      '1': 'DeleteUser',
      '2': '.scarlet.operations.personnel.v1.DeleteUserRequest',
      '3': '.scarlet.operations.personnel.v1.DeleteResponse',
      '4': {}
    },
    {
      '1': 'UpdateDutyStatus',
      '2': '.scarlet.operations.personnel.v1.UpdateStatusRequest',
      '3': '.scarlet.operations.personnel.v1.UserResponse',
      '4': {}
    },
    {
      '1': 'ReportLocation',
      '2': '.scarlet.operations.personnel.v1.LocationUpdate',
      '3': '.scarlet.operations.personnel.v1.ReportLocationResponse',
      '4': {}
    },
    {
      '1': 'AddUserSkill',
      '2': '.scarlet.operations.personnel.v1.SkillRequest',
      '3': '.scarlet.operations.personnel.v1.SkillList',
      '4': {}
    },
    {
      '1': 'ListAllTeams',
      '2': '.google.protobuf.Empty',
      '3': '.scarlet.operations.personnel.v1.TeamListResponse',
      '4': {}
    },
    {
      '1': 'ListUsersByTeam',
      '2': '.scarlet.operations.personnel.v1.ListUsersByTeamRequest',
      '3': '.scarlet.operations.personnel.v1.UserListResponse',
      '4': {}
    },
    {
      '1': 'GetTeamDetails',
      '2': '.scarlet.operations.personnel.v1.GetTeamRequest',
      '3': '.scarlet.operations.personnel.v1.TeamResponse',
      '4': {}
    },
    {
      '1': 'CreateTeam',
      '2': '.scarlet.operations.personnel.v1.CreateTeamRequest',
      '3': '.scarlet.operations.personnel.v1.TeamResponse',
      '4': {}
    },
    {
      '1': 'UpdateTeam',
      '2': '.scarlet.operations.personnel.v1.UpdateTeamRequest',
      '3': '.scarlet.operations.personnel.v1.TeamResponse',
      '4': {}
    },
    {
      '1': 'DeleteTeam',
      '2': '.scarlet.operations.personnel.v1.DeleteTeamRequest',
      '3': '.scarlet.operations.personnel.v1.DeleteResponse',
      '4': {}
    },
    {
      '1': 'AssignUserToTeam',
      '2': '.scarlet.operations.personnel.v1.AssignRequest',
      '3': '.scarlet.operations.personnel.v1.UserResponse',
      '4': {}
    },
    {
      '1': 'ListInstitutions',
      '2': '.google.protobuf.Empty',
      '3': '.scarlet.operations.personnel.v1.InstitutionListResponse',
      '4': {}
    },
    {
      '1': 'GetInstitution',
      '2': '.scarlet.operations.personnel.v1.GetInstitutionRequest',
      '3': '.scarlet.operations.personnel.v1.InstitutionResponse',
      '4': {}
    },
    {
      '1': 'CreateInstitution',
      '2': '.scarlet.operations.personnel.v1.CreateInstitutionRequest',
      '3': '.scarlet.operations.personnel.v1.InstitutionResponse',
      '4': {}
    },
    {
      '1': 'UpdateInstitution',
      '2': '.scarlet.operations.personnel.v1.UpdateInstitutionRequest',
      '3': '.scarlet.operations.personnel.v1.InstitutionResponse',
      '4': {}
    },
    {
      '1': 'DeleteInstitution',
      '2': '.scarlet.operations.personnel.v1.DeleteInstitutionRequest',
      '3': '.scarlet.operations.personnel.v1.DeleteResponse',
      '4': {}
    },
    {
      '1': 'ListBranches',
      '2': '.scarlet.operations.personnel.v1.ListBranchesRequest',
      '3': '.scarlet.operations.personnel.v1.BranchListResponse',
      '4': {}
    },
    {
      '1': 'CreateBranch',
      '2': '.scarlet.operations.personnel.v1.CreateBranchRequest',
      '3': '.scarlet.operations.personnel.v1.BranchResponse',
      '4': {}
    },
    {
      '1': 'UpdateBranch',
      '2': '.scarlet.operations.personnel.v1.UpdateBranchRequest',
      '3': '.scarlet.operations.personnel.v1.BranchResponse',
      '4': {}
    },
    {
      '1': 'DeleteBranch',
      '2': '.scarlet.operations.personnel.v1.DeleteBranchRequest',
      '3': '.scarlet.operations.personnel.v1.DeleteResponse',
      '4': {}
    },
    {
      '1': 'GetUserCertifications',
      '2': '.scarlet.operations.personnel.v1.GetUserRequest',
      '3': '.scarlet.operations.personnel.v1.CertificationListResponse',
      '4': {}
    },
    {
      '1': 'AddCertification',
      '2': '.scarlet.operations.personnel.v1.AddCertificationRequest',
      '3': '.scarlet.operations.personnel.v1.CertificationListResponse',
      '4': {}
    },
    {
      '1': 'ListUserSkills',
      '2': '.scarlet.operations.personnel.v1.GetUserRequest',
      '3': '.scarlet.operations.personnel.v1.SkillList',
      '4': {}
    },
    {
      '1': 'ListTasks',
      '2': '.scarlet.operations.personnel.v1.ListTasksRequest',
      '3': '.scarlet.operations.personnel.v1.TaskListResponse',
      '4': {}
    },
    {
      '1': 'CreateTask',
      '2': '.scarlet.operations.personnel.v1.CreateTaskRequest',
      '3': '.scarlet.operations.personnel.v1.TaskResponse',
      '4': {}
    },
    {
      '1': 'UpdateTaskStatus',
      '2': '.scarlet.operations.personnel.v1.UpdateTaskStatusRequest',
      '3': '.scarlet.operations.personnel.v1.TaskResponse',
      '4': {}
    },
    {
      '1': 'GetDashboardStats',
      '2': '.scarlet.operations.personnel.v1.DashboardStatsRequest',
      '3': '.scarlet.operations.personnel.v1.DashboardStatsResponse',
      '4': {}
    },
  ],
};

@$core.Deprecated('Use personnelServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    PersonnelServiceBase$messageJson = {
  '.scarlet.operations.personnel.v1.LoginRequest': LoginRequest$json,
  '.scarlet.operations.personnel.v1.LoginResponse': LoginResponse$json,
  '.scarlet.operations.personnel.v1.User': User$json,
  '.scarlet.operations.personnel.v1.GetUserRequest': GetUserRequest$json,
  '.scarlet.operations.personnel.v1.UserResponse': UserResponse$json,
  '.scarlet.operations.personnel.v1.ListUsersRequest': ListUsersRequest$json,
  '.scarlet.operations.personnel.v1.ListUsersResponse': ListUsersResponse$json,
  '.scarlet.operations.personnel.v1.UpdateUserRequest': UpdateUserRequest$json,
  '.scarlet.operations.personnel.v1.CreateUserRequest': CreateUserRequest$json,
  '.scarlet.operations.personnel.v1.DeleteUserRequest': DeleteUserRequest$json,
  '.scarlet.operations.personnel.v1.DeleteResponse': DeleteResponse$json,
  '.scarlet.operations.personnel.v1.UpdateStatusRequest':
      UpdateStatusRequest$json,
  '.scarlet.operations.personnel.v1.LocationUpdate': LocationUpdate$json,
  '.scarlet.operations.personnel.v1.ReportLocationResponse':
      ReportLocationResponse$json,
  '.scarlet.operations.personnel.v1.SkillRequest': SkillRequest$json,
  '.scarlet.operations.personnel.v1.SkillList': SkillList$json,
  '.scarlet.operations.personnel.v1.Skill': Skill$json,
  '.google.protobuf.Empty': $0.Empty$json,
  '.scarlet.operations.personnel.v1.TeamListResponse': TeamListResponse$json,
  '.scarlet.operations.personnel.v1.Team': Team$json,
  '.scarlet.operations.personnel.v1.ListUsersByTeamRequest':
      ListUsersByTeamRequest$json,
  '.scarlet.operations.personnel.v1.UserListResponse': UserListResponse$json,
  '.scarlet.operations.personnel.v1.GetTeamRequest': GetTeamRequest$json,
  '.scarlet.operations.personnel.v1.TeamResponse': TeamResponse$json,
  '.scarlet.operations.personnel.v1.Branch': Branch$json,
  '.scarlet.operations.personnel.v1.Institution': Institution$json,
  '.scarlet.operations.personnel.v1.CreateTeamRequest': CreateTeamRequest$json,
  '.scarlet.operations.personnel.v1.UpdateTeamRequest': UpdateTeamRequest$json,
  '.scarlet.operations.personnel.v1.DeleteTeamRequest': DeleteTeamRequest$json,
  '.scarlet.operations.personnel.v1.AssignRequest': AssignRequest$json,
  '.scarlet.operations.personnel.v1.InstitutionListResponse':
      InstitutionListResponse$json,
  '.scarlet.operations.personnel.v1.GetInstitutionRequest':
      GetInstitutionRequest$json,
  '.scarlet.operations.personnel.v1.InstitutionResponse':
      InstitutionResponse$json,
  '.scarlet.operations.personnel.v1.CreateInstitutionRequest':
      CreateInstitutionRequest$json,
  '.scarlet.operations.personnel.v1.UpdateInstitutionRequest':
      UpdateInstitutionRequest$json,
  '.scarlet.operations.personnel.v1.DeleteInstitutionRequest':
      DeleteInstitutionRequest$json,
  '.scarlet.operations.personnel.v1.ListBranchesRequest':
      ListBranchesRequest$json,
  '.scarlet.operations.personnel.v1.BranchListResponse':
      BranchListResponse$json,
  '.scarlet.operations.personnel.v1.CreateBranchRequest':
      CreateBranchRequest$json,
  '.scarlet.operations.personnel.v1.BranchResponse': BranchResponse$json,
  '.scarlet.operations.personnel.v1.UpdateBranchRequest':
      UpdateBranchRequest$json,
  '.scarlet.operations.personnel.v1.DeleteBranchRequest':
      DeleteBranchRequest$json,
  '.scarlet.operations.personnel.v1.CertificationListResponse':
      CertificationListResponse$json,
  '.scarlet.operations.personnel.v1.Certification': Certification$json,
  '.scarlet.operations.personnel.v1.AddCertificationRequest':
      AddCertificationRequest$json,
  '.scarlet.operations.personnel.v1.ListTasksRequest': ListTasksRequest$json,
  '.scarlet.operations.personnel.v1.TaskListResponse': TaskListResponse$json,
  '.scarlet.operations.personnel.v1.Task': Task$json,
  '.scarlet.operations.personnel.v1.CreateTaskRequest': CreateTaskRequest$json,
  '.scarlet.operations.personnel.v1.TaskResponse': TaskResponse$json,
  '.scarlet.operations.personnel.v1.UpdateTaskStatusRequest':
      UpdateTaskStatusRequest$json,
  '.scarlet.operations.personnel.v1.DashboardStatsRequest':
      DashboardStatsRequest$json,
  '.scarlet.operations.personnel.v1.DashboardStatsResponse':
      DashboardStatsResponse$json,
};

/// Descriptor for `PersonnelService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List personnelServiceDescriptor = $convert.base64Decode(
    'ChBQZXJzb25uZWxTZXJ2aWNlEokBCglMb2dpblVzZXISLS5zY2FybGV0Lm9wZXJhdGlvbnMucG'
    'Vyc29ubmVsLnYxLkxvZ2luUmVxdWVzdBouLnNjYXJsZXQub3BlcmF0aW9ucy5wZXJzb25uZWwu'
    'djEuTG9naW5SZXNwb25zZSIdgtPkkwIXIhIvYXBpL3YxL2F1dGgvbG9naW46ASoSigEKB0dldF'
    'VzZXISLy5zY2FybGV0Lm9wZXJhdGlvbnMucGVyc29ubmVsLnYxLkdldFVzZXJSZXF1ZXN0Gi0u'
    'c2NhcmxldC5vcGVyYXRpb25zLnBlcnNvbm5lbC52MS5Vc2VyUmVzcG9uc2UiH4LT5JMCGRIXL2'
    'FwaS92MS91c2Vycy97dXNlcl9pZH0SjAEKDExpc3RBbGxVc2VycxIxLnNjYXJsZXQub3BlcmF0'
    'aW9ucy5wZXJzb25uZWwudjEuTGlzdFVzZXJzUmVxdWVzdBoyLnNjYXJsZXQub3BlcmF0aW9ucy'
    '5wZXJzb25uZWwudjEuTGlzdFVzZXJzUmVzcG9uc2UiFYLT5JMCDxINL2FwaS92MS91c2VycxKW'
    'AQoKVXBkYXRlVXNlchIyLnNjYXJsZXQub3BlcmF0aW9ucy5wZXJzb25uZWwudjEuVXBkYXRlVX'
    'NlclJlcXVlc3QaLS5zY2FybGV0Lm9wZXJhdGlvbnMucGVyc29ubmVsLnYxLlVzZXJSZXNwb25z'
    'ZSIlgtPkkwIfMhcvYXBpL3YxL3VzZXJzL3t1c2VyLmlkfToEdXNlchKJAQoKQ3JlYXRlVXNlch'
    'IyLnNjYXJsZXQub3BlcmF0aW9ucy5wZXJzb25uZWwudjEuQ3JlYXRlVXNlclJlcXVlc3QaLS5z'
    'Y2FybGV0Lm9wZXJhdGlvbnMucGVyc29ubmVsLnYxLlVzZXJSZXNwb25zZSIYgtPkkwISIg0vYX'
    'BpL3YxL3VzZXJzOgEqEpIBCgpEZWxldGVVc2VyEjIuc2NhcmxldC5vcGVyYXRpb25zLnBlcnNv'
    'bm5lbC52MS5EZWxldGVVc2VyUmVxdWVzdBovLnNjYXJsZXQub3BlcmF0aW9ucy5wZXJzb25uZW'
    'wudjEuRGVsZXRlUmVzcG9uc2UiH4LT5JMCGSoXL2FwaS92MS91c2Vycy97dXNlcl9pZH0SogEK'
    'EFVwZGF0ZUR1dHlTdGF0dXMSNC5zY2FybGV0Lm9wZXJhdGlvbnMucGVyc29ubmVsLnYxLlVwZG'
    'F0ZVN0YXR1c1JlcXVlc3QaLS5zY2FybGV0Lm9wZXJhdGlvbnMucGVyc29ubmVsLnYxLlVzZXJS'
    'ZXNwb25zZSIpgtPkkwIjMh4vYXBpL3YxL3VzZXJzL3t1c2VyX2lkfS9zdGF0dXM6ASoSoQEKDl'
    'JlcG9ydExvY2F0aW9uEi8uc2NhcmxldC5vcGVyYXRpb25zLnBlcnNvbm5lbC52MS5Mb2NhdGlv'
    'blVwZGF0ZRo3LnNjYXJsZXQub3BlcmF0aW9ucy5wZXJzb25uZWwudjEuUmVwb3J0TG9jYXRpb2'
    '5SZXNwb25zZSIlgtPkkwIfIhovYXBpL3YxL3BlcnNvbm5lbC9sb2NhdGlvbjoBKhKUAQoMQWRk'
    'VXNlclNraWxsEi0uc2NhcmxldC5vcGVyYXRpb25zLnBlcnNvbm5lbC52MS5Ta2lsbFJlcXVlc3'
    'QaKi5zY2FybGV0Lm9wZXJhdGlvbnMucGVyc29ubmVsLnYxLlNraWxsTGlzdCIpgtPkkwIjIh4v'
    'YXBpL3YxL3VzZXJzL3t1c2VyX2lkfS9za2lsbHM6ASoScAoMTGlzdEFsbFRlYW1zEhYuZ29vZ2'
    'xlLnByb3RvYnVmLkVtcHR5GjEuc2NhcmxldC5vcGVyYXRpb25zLnBlcnNvbm5lbC52MS5UZWFt'
    'TGlzdFJlc3BvbnNlIhWC0+STAg8SDS9hcGkvdjEvdGVhbXMSpAEKD0xpc3RVc2Vyc0J5VGVhbR'
    'I3LnNjYXJsZXQub3BlcmF0aW9ucy5wZXJzb25uZWwudjEuTGlzdFVzZXJzQnlUZWFtUmVxdWVz'
    'dBoxLnNjYXJsZXQub3BlcmF0aW9ucy5wZXJzb25uZWwudjEuVXNlckxpc3RSZXNwb25zZSIlgt'
    'PkkwIfEh0vYXBpL3YxL3RlYW1zL3t0ZWFtX2lkfS91c2VycxKRAQoOR2V0VGVhbURldGFpbHMS'
    'Ly5zY2FybGV0Lm9wZXJhdGlvbnMucGVyc29ubmVsLnYxLkdldFRlYW1SZXF1ZXN0Gi0uc2Nhcm'
    'xldC5vcGVyYXRpb25zLnBlcnNvbm5lbC52MS5UZWFtUmVzcG9uc2UiH4LT5JMCGRIXL2FwaS92'
    'MS90ZWFtcy97dGVhbV9pZH0SiQEKCkNyZWF0ZVRlYW0SMi5zY2FybGV0Lm9wZXJhdGlvbnMucG'
    'Vyc29ubmVsLnYxLkNyZWF0ZVRlYW1SZXF1ZXN0Gi0uc2NhcmxldC5vcGVyYXRpb25zLnBlcnNv'
    'bm5lbC52MS5UZWFtUmVzcG9uc2UiGILT5JMCEiINL2FwaS92MS90ZWFtczoBKhKTAQoKVXBkYX'
    'RlVGVhbRIyLnNjYXJsZXQub3BlcmF0aW9ucy5wZXJzb25uZWwudjEuVXBkYXRlVGVhbVJlcXVl'
    'c3QaLS5zY2FybGV0Lm9wZXJhdGlvbnMucGVyc29ubmVsLnYxLlRlYW1SZXNwb25zZSIigtPkkw'
    'IcMhcvYXBpL3YxL3RlYW1zL3t0ZWFtX2lkfToBKhKSAQoKRGVsZXRlVGVhbRIyLnNjYXJsZXQu'
    'b3BlcmF0aW9ucy5wZXJzb25uZWwudjEuRGVsZXRlVGVhbVJlcXVlc3QaLy5zY2FybGV0Lm9wZX'
    'JhdGlvbnMucGVyc29ubmVsLnYxLkRlbGV0ZVJlc3BvbnNlIh+C0+STAhkqFy9hcGkvdjEvdGVh'
    'bXMve3RlYW1faWR9EqABChBBc3NpZ25Vc2VyVG9UZWFtEi4uc2NhcmxldC5vcGVyYXRpb25zLn'
    'BlcnNvbm5lbC52MS5Bc3NpZ25SZXF1ZXN0Gi0uc2NhcmxldC5vcGVyYXRpb25zLnBlcnNvbm5l'
    'bC52MS5Vc2VyUmVzcG9uc2UiLYLT5JMCJxoiL2FwaS92MS91c2Vycy97dXNlcl9pZH0vYXNzaW'
    'dubWVudDoBKhKCAQoQTGlzdEluc3RpdHV0aW9ucxIWLmdvb2dsZS5wcm90b2J1Zi5FbXB0eRo4'
    'LnNjYXJsZXQub3BlcmF0aW9ucy5wZXJzb25uZWwudjEuSW5zdGl0dXRpb25MaXN0UmVzcG9uc2'
    'UiHILT5JMCFhIUL2FwaS92MS9pbnN0aXR1dGlvbnMSrQEKDkdldEluc3RpdHV0aW9uEjYuc2Nh'
    'cmxldC5vcGVyYXRpb25zLnBlcnNvbm5lbC52MS5HZXRJbnN0aXR1dGlvblJlcXVlc3QaNC5zY2'
    'FybGV0Lm9wZXJhdGlvbnMucGVyc29ubmVsLnYxLkluc3RpdHV0aW9uUmVzcG9uc2UiLYLT5JMC'
    'JxIlL2FwaS92MS9pbnN0aXR1dGlvbnMve2luc3RpdHV0aW9uX2lkfRKlAQoRQ3JlYXRlSW5zdG'
    'l0dXRpb24SOS5zY2FybGV0Lm9wZXJhdGlvbnMucGVyc29ubmVsLnYxLkNyZWF0ZUluc3RpdHV0'
    'aW9uUmVxdWVzdBo0LnNjYXJsZXQub3BlcmF0aW9ucy5wZXJzb25uZWwudjEuSW5zdGl0dXRpb2'
    '5SZXNwb25zZSIfgtPkkwIZIhQvYXBpL3YxL2luc3RpdHV0aW9uczoBKhK2AQoRVXBkYXRlSW5z'
    'dGl0dXRpb24SOS5zY2FybGV0Lm9wZXJhdGlvbnMucGVyc29ubmVsLnYxLlVwZGF0ZUluc3RpdH'
    'V0aW9uUmVxdWVzdBo0LnNjYXJsZXQub3BlcmF0aW9ucy5wZXJzb25uZWwudjEuSW5zdGl0dXRp'
    'b25SZXNwb25zZSIwgtPkkwIqMiUvYXBpL3YxL2luc3RpdHV0aW9ucy97aW5zdGl0dXRpb25faW'
    'R9OgEqEq4BChFEZWxldGVJbnN0aXR1dGlvbhI5LnNjYXJsZXQub3BlcmF0aW9ucy5wZXJzb25u'
    'ZWwudjEuRGVsZXRlSW5zdGl0dXRpb25SZXF1ZXN0Gi8uc2NhcmxldC5vcGVyYXRpb25zLnBlcn'
    'Nvbm5lbC52MS5EZWxldGVSZXNwb25zZSItgtPkkwInKiUvYXBpL3YxL2luc3RpdHV0aW9ucy97'
    'aW5zdGl0dXRpb25faWR9ErEBCgxMaXN0QnJhbmNoZXMSNC5zY2FybGV0Lm9wZXJhdGlvbnMucG'
    'Vyc29ubmVsLnYxLkxpc3RCcmFuY2hlc1JlcXVlc3QaMy5zY2FybGV0Lm9wZXJhdGlvbnMucGVy'
    'c29ubmVsLnYxLkJyYW5jaExpc3RSZXNwb25zZSI2gtPkkwIwEi4vYXBpL3YxL2luc3RpdHV0aW'
    '9ucy97aW5zdGl0dXRpb25faWR9L2JyYW5jaGVzErABCgxDcmVhdGVCcmFuY2gSNC5zY2FybGV0'
    'Lm9wZXJhdGlvbnMucGVyc29ubmVsLnYxLkNyZWF0ZUJyYW5jaFJlcXVlc3QaLy5zY2FybGV0Lm'
    '9wZXJhdGlvbnMucGVyc29ubmVsLnYxLkJyYW5jaFJlc3BvbnNlIjmC0+STAjMiLi9hcGkvdjEv'
    'aW5zdGl0dXRpb25zL3tpbnN0aXR1dGlvbl9pZH0vYnJhbmNoZXM6ASoSngEKDFVwZGF0ZUJyYW'
    '5jaBI0LnNjYXJsZXQub3BlcmF0aW9ucy5wZXJzb25uZWwudjEuVXBkYXRlQnJhbmNoUmVxdWVz'
    'dBovLnNjYXJsZXQub3BlcmF0aW9ucy5wZXJzb25uZWwudjEuQnJhbmNoUmVzcG9uc2UiJ4LT5J'
    'MCITIcL2FwaS92MS9icmFuY2hlcy97YnJhbmNoX2lkfToBKhKbAQoMRGVsZXRlQnJhbmNoEjQu'
    'c2NhcmxldC5vcGVyYXRpb25zLnBlcnNvbm5lbC52MS5EZWxldGVCcmFuY2hSZXF1ZXN0Gi8uc2'
    'NhcmxldC5vcGVyYXRpb25zLnBlcnNvbm5lbC52MS5EZWxldGVSZXNwb25zZSIkgtPkkwIeKhwv'
    'YXBpL3YxL2JyYW5jaGVzL3ticmFuY2hfaWR9ErQBChVHZXRVc2VyQ2VydGlmaWNhdGlvbnMSLy'
    '5zY2FybGV0Lm9wZXJhdGlvbnMucGVyc29ubmVsLnYxLkdldFVzZXJSZXF1ZXN0Gjouc2Nhcmxl'
    'dC5vcGVyYXRpb25zLnBlcnNvbm5lbC52MS5DZXJ0aWZpY2F0aW9uTGlzdFJlc3BvbnNlIi6C0+'
    'STAigSJi9hcGkvdjEvdXNlcnMve3VzZXJfaWR9L2NlcnRpZmljYXRpb25zErsBChBBZGRDZXJ0'
    'aWZpY2F0aW9uEjguc2NhcmxldC5vcGVyYXRpb25zLnBlcnNvbm5lbC52MS5BZGRDZXJ0aWZpY2'
    'F0aW9uUmVxdWVzdBo6LnNjYXJsZXQub3BlcmF0aW9ucy5wZXJzb25uZWwudjEuQ2VydGlmaWNh'
    'dGlvbkxpc3RSZXNwb25zZSIxgtPkkwIrIiYvYXBpL3YxL3VzZXJzL3t1c2VyX2lkfS9jZXJ0aW'
    'ZpY2F0aW9uczoBKhKVAQoOTGlzdFVzZXJTa2lsbHMSLy5zY2FybGV0Lm9wZXJhdGlvbnMucGVy'
    'c29ubmVsLnYxLkdldFVzZXJSZXF1ZXN0Giouc2NhcmxldC5vcGVyYXRpb25zLnBlcnNvbm5lbC'
    '52MS5Ta2lsbExpc3QiJoLT5JMCIBIeL2FwaS92MS91c2Vycy97dXNlcl9pZH0vc2tpbGxzEogB'
    'CglMaXN0VGFza3MSMS5zY2FybGV0Lm9wZXJhdGlvbnMucGVyc29ubmVsLnYxLkxpc3RUYXNrc1'
    'JlcXVlc3QaMS5zY2FybGV0Lm9wZXJhdGlvbnMucGVyc29ubmVsLnYxLlRhc2tMaXN0UmVzcG9u'
    'c2UiFYLT5JMCDxINL2FwaS92MS90YXNrcxKJAQoKQ3JlYXRlVGFzaxIyLnNjYXJsZXQub3Blcm'
    'F0aW9ucy5wZXJzb25uZWwudjEuQ3JlYXRlVGFza1JlcXVlc3QaLS5zY2FybGV0Lm9wZXJhdGlv'
    'bnMucGVyc29ubmVsLnYxLlRhc2tSZXNwb25zZSIYgtPkkwISIg0vYXBpL3YxL3Rhc2tzOgEqEq'
    'YBChBVcGRhdGVUYXNrU3RhdHVzEjguc2NhcmxldC5vcGVyYXRpb25zLnBlcnNvbm5lbC52MS5V'
    'cGRhdGVUYXNrU3RhdHVzUmVxdWVzdBotLnNjYXJsZXQub3BlcmF0aW9ucy5wZXJzb25uZWwudj'
    'EuVGFza1Jlc3BvbnNlIimC0+STAiMyHi9hcGkvdjEvdGFza3Mve3Rhc2tfaWR9L3N0YXR1czoB'
    'KhKlAQoRR2V0RGFzaGJvYXJkU3RhdHMSNi5zY2FybGV0Lm9wZXJhdGlvbnMucGVyc29ubmVsLn'
    'YxLkRhc2hib2FyZFN0YXRzUmVxdWVzdBo3LnNjYXJsZXQub3BlcmF0aW9ucy5wZXJzb25uZWwu'
    'djEuRGFzaGJvYXJkU3RhdHNSZXNwb25zZSIfgtPkkwIZEhcvYXBpL3YxL3N0YXRzL2Rhc2hib2'
    'FyZA==');
