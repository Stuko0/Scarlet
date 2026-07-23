// This is a generated file - do not edit.
//
// Generated from protos/wildfire.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class FireState extends $pb.ProtobufEnum {
  static const FireState FIRE_STATE_UNSPECIFIED =
      FireState._(0, _omitEnumNames ? '' : 'FIRE_STATE_UNSPECIFIED');
  static const FireState NO_FIRE =
      FireState._(1, _omitEnumNames ? '' : 'NO_FIRE');
  static const FireState EMERGING =
      FireState._(2, _omitEnumNames ? '' : 'EMERGING');
  static const FireState ACTIVE =
      FireState._(3, _omitEnumNames ? '' : 'ACTIVE');
  static const FireState EXTINGUISHED =
      FireState._(4, _omitEnumNames ? '' : 'EXTINGUISHED');
  static const FireState SUSPECT =
      FireState._(5, _omitEnumNames ? '' : 'SUSPECT');

  static const $core.List<FireState> values = <FireState>[
    FIRE_STATE_UNSPECIFIED,
    NO_FIRE,
    EMERGING,
    ACTIVE,
    EXTINGUISHED,
    SUSPECT,
  ];

  static final $core.List<FireState?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 5);
  static FireState? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const FireState._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
