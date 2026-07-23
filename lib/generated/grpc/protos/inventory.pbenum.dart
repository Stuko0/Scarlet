// This is a generated file - do not edit.
//
// Generated from protos/inventory.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class AssetCategory extends $pb.ProtobufEnum {
  static const AssetCategory ASSET_CATEGORY_UNSPECIFIED =
      AssetCategory._(0, _omitEnumNames ? '' : 'ASSET_CATEGORY_UNSPECIFIED');
  static const AssetCategory HEAVY_ENGINE =
      AssetCategory._(1, _omitEnumNames ? '' : 'HEAVY_ENGINE');
  static const AssetCategory LIGHT_ATTACK =
      AssetCategory._(2, _omitEnumNames ? '' : 'LIGHT_ATTACK');
  static const AssetCategory WATER_TENDER =
      AssetCategory._(3, _omitEnumNames ? '' : 'WATER_TENDER');
  static const AssetCategory AERIAL_DRONE =
      AssetCategory._(4, _omitEnumNames ? '' : 'AERIAL_DRONE');
  static const AssetCategory COMMAND_POST =
      AssetCategory._(5, _omitEnumNames ? '' : 'COMMAND_POST');
  static const AssetCategory MEDICAL_UNIT =
      AssetCategory._(6, _omitEnumNames ? '' : 'MEDICAL_UNIT');

  static const $core.List<AssetCategory> values = <AssetCategory>[
    ASSET_CATEGORY_UNSPECIFIED,
    HEAVY_ENGINE,
    LIGHT_ATTACK,
    WATER_TENDER,
    AERIAL_DRONE,
    COMMAND_POST,
    MEDICAL_UNIT,
  ];

  static final $core.List<AssetCategory?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 6);
  static AssetCategory? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const AssetCategory._(super.value, super.name);
}

class AssetStatus extends $pb.ProtobufEnum {
  static const AssetStatus ASSET_STATUS_UNSPECIFIED =
      AssetStatus._(0, _omitEnumNames ? '' : 'ASSET_STATUS_UNSPECIFIED');
  static const AssetStatus READY =
      AssetStatus._(1, _omitEnumNames ? '' : 'READY');
  static const AssetStatus DEPLOYED =
      AssetStatus._(2, _omitEnumNames ? '' : 'DEPLOYED');
  static const AssetStatus OUT_OF_SERVICE =
      AssetStatus._(3, _omitEnumNames ? '' : 'OUT_OF_SERVICE');
  static const AssetStatus IN_MAINTENANCE =
      AssetStatus._(4, _omitEnumNames ? '' : 'IN_MAINTENANCE');

  static const $core.List<AssetStatus> values = <AssetStatus>[
    ASSET_STATUS_UNSPECIFIED,
    READY,
    DEPLOYED,
    OUT_OF_SERVICE,
    IN_MAINTENANCE,
  ];

  static final $core.List<AssetStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static AssetStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const AssetStatus._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
