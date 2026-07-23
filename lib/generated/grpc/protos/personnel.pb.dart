// This is a generated file - do not edit.
//
// Generated from protos/personnel.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;
import 'package:protobuf/well_known_types/google/protobuf/empty.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class Institution extends $pb.GeneratedMessage {
  factory Institution({
    $core.int? id,
    $core.String? name,
    $core.String? region,
    $core.String? createdAt,
    $core.bool? isActive,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (region != null) result.region = region;
    if (createdAt != null) result.createdAt = createdAt;
    if (isActive != null) result.isActive = isActive;
    return result;
  }

  Institution._();

  factory Institution.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Institution.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Institution',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.personnel.v1'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'region')
    ..aOS(4, _omitFieldNames ? '' : 'createdAt')
    ..aOB(5, _omitFieldNames ? '' : 'isActive')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Institution clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Institution copyWith(void Function(Institution) updates) =>
      super.copyWith((message) => updates(message as Institution))
          as Institution;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Institution create() => Institution._();
  @$core.override
  Institution createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Institution getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Institution>(create);
  static Institution? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get region => $_getSZ(2);
  @$pb.TagNumber(3)
  set region($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRegion() => $_has(2);
  @$pb.TagNumber(3)
  void clearRegion() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get createdAt => $_getSZ(3);
  @$pb.TagNumber(4)
  set createdAt($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCreatedAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearCreatedAt() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get isActive => $_getBF(4);
  @$pb.TagNumber(5)
  set isActive($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasIsActive() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsActive() => $_clearField(5);
}

class Branch extends $pb.GeneratedMessage {
  factory Branch({
    $core.int? id,
    $core.int? institutionId,
    $core.String? name,
    $core.String? description,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (institutionId != null) result.institutionId = institutionId;
    if (name != null) result.name = name;
    if (description != null) result.description = description;
    return result;
  }

  Branch._();

  factory Branch.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Branch.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Branch',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.personnel.v1'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'id')
    ..aI(2, _omitFieldNames ? '' : 'institutionId')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOS(4, _omitFieldNames ? '' : 'description')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Branch clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Branch copyWith(void Function(Branch) updates) =>
      super.copyWith((message) => updates(message as Branch)) as Branch;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Branch create() => Branch._();
  @$core.override
  Branch createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Branch getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Branch>(create);
  static Branch? _defaultInstance;

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
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get description => $_getSZ(3);
  @$pb.TagNumber(4)
  set description($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDescription() => $_has(3);
  @$pb.TagNumber(4)
  void clearDescription() => $_clearField(4);
}

class Team extends $pb.GeneratedMessage {
  factory Team({
    $core.int? id,
    $core.int? branchId,
    $core.String? name,
    $core.bool? isActive,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (branchId != null) result.branchId = branchId;
    if (name != null) result.name = name;
    if (isActive != null) result.isActive = isActive;
    return result;
  }

  Team._();

  factory Team.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Team.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Team',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.personnel.v1'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'id')
    ..aI(2, _omitFieldNames ? '' : 'branchId')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOB(4, _omitFieldNames ? '' : 'isActive')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Team clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Team copyWith(void Function(Team) updates) =>
      super.copyWith((message) => updates(message as Team)) as Team;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Team create() => Team._();
  @$core.override
  Team createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Team getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Team>(create);
  static Team? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get branchId => $_getIZ(1);
  @$pb.TagNumber(2)
  set branchId($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBranchId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBranchId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isActive => $_getBF(3);
  @$pb.TagNumber(4)
  set isActive($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasIsActive() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsActive() => $_clearField(4);
}

class Certification extends $pb.GeneratedMessage {
  factory Certification({
    $core.int? id,
    $core.int? userId,
    $core.String? name,
    $core.String? issueDate,
    $core.String? expiryDate,
    $core.String? certificateUrl,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (userId != null) result.userId = userId;
    if (name != null) result.name = name;
    if (issueDate != null) result.issueDate = issueDate;
    if (expiryDate != null) result.expiryDate = expiryDate;
    if (certificateUrl != null) result.certificateUrl = certificateUrl;
    return result;
  }

  Certification._();

  factory Certification.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Certification.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Certification',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.personnel.v1'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'id')
    ..aI(2, _omitFieldNames ? '' : 'userId')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOS(4, _omitFieldNames ? '' : 'issueDate')
    ..aOS(5, _omitFieldNames ? '' : 'expiryDate')
    ..aOS(6, _omitFieldNames ? '' : 'certificateUrl')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Certification clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Certification copyWith(void Function(Certification) updates) =>
      super.copyWith((message) => updates(message as Certification))
          as Certification;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Certification create() => Certification._();
  @$core.override
  Certification createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Certification getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Certification>(create);
  static Certification? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get userId => $_getIZ(1);
  @$pb.TagNumber(2)
  set userId($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get issueDate => $_getSZ(3);
  @$pb.TagNumber(4)
  set issueDate($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasIssueDate() => $_has(3);
  @$pb.TagNumber(4)
  void clearIssueDate() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get expiryDate => $_getSZ(4);
  @$pb.TagNumber(5)
  set expiryDate($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasExpiryDate() => $_has(4);
  @$pb.TagNumber(5)
  void clearExpiryDate() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get certificateUrl => $_getSZ(5);
  @$pb.TagNumber(6)
  set certificateUrl($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasCertificateUrl() => $_has(5);
  @$pb.TagNumber(6)
  void clearCertificateUrl() => $_clearField(6);
}

class User extends $pb.GeneratedMessage {
  factory User({
    $core.int? id,
    $core.int? institutionId,
    $core.int? teamId,
    $core.String? fullName,
    $core.String? email,
    $core.String? phone,
    $core.String? bloodType,
    $core.String? role,
    $core.int? yearsExperience,
    $core.bool? isActive,
    $core.String? createdAt,
    $core.String? dutyStatus,
    $core.String? ci,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (institutionId != null) result.institutionId = institutionId;
    if (teamId != null) result.teamId = teamId;
    if (fullName != null) result.fullName = fullName;
    if (email != null) result.email = email;
    if (phone != null) result.phone = phone;
    if (bloodType != null) result.bloodType = bloodType;
    if (role != null) result.role = role;
    if (yearsExperience != null) result.yearsExperience = yearsExperience;
    if (isActive != null) result.isActive = isActive;
    if (createdAt != null) result.createdAt = createdAt;
    if (dutyStatus != null) result.dutyStatus = dutyStatus;
    if (ci != null) result.ci = ci;
    return result;
  }

  User._();

  factory User.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory User.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'User',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.personnel.v1'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'id')
    ..aI(2, _omitFieldNames ? '' : 'institutionId')
    ..aI(3, _omitFieldNames ? '' : 'teamId')
    ..aOS(4, _omitFieldNames ? '' : 'fullName')
    ..aOS(5, _omitFieldNames ? '' : 'email')
    ..aOS(6, _omitFieldNames ? '' : 'phone')
    ..aOS(7, _omitFieldNames ? '' : 'bloodType')
    ..aOS(8, _omitFieldNames ? '' : 'role')
    ..aI(9, _omitFieldNames ? '' : 'yearsExperience')
    ..aOB(10, _omitFieldNames ? '' : 'isActive')
    ..aOS(11, _omitFieldNames ? '' : 'createdAt')
    ..aOS(12, _omitFieldNames ? '' : 'dutyStatus')
    ..aOS(13, _omitFieldNames ? '' : 'ci')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  User clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  User copyWith(void Function(User) updates) =>
      super.copyWith((message) => updates(message as User)) as User;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static User create() => User._();
  @$core.override
  User createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static User getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<User>(create);
  static User? _defaultInstance;

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
  $core.int get teamId => $_getIZ(2);
  @$pb.TagNumber(3)
  set teamId($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTeamId() => $_has(2);
  @$pb.TagNumber(3)
  void clearTeamId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get fullName => $_getSZ(3);
  @$pb.TagNumber(4)
  set fullName($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasFullName() => $_has(3);
  @$pb.TagNumber(4)
  void clearFullName() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get email => $_getSZ(4);
  @$pb.TagNumber(5)
  set email($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasEmail() => $_has(4);
  @$pb.TagNumber(5)
  void clearEmail() => $_clearField(5);

  /// password_hash omitido intencionalmente por seguridad
  @$pb.TagNumber(6)
  $core.String get phone => $_getSZ(5);
  @$pb.TagNumber(6)
  set phone($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasPhone() => $_has(5);
  @$pb.TagNumber(6)
  void clearPhone() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get bloodType => $_getSZ(6);
  @$pb.TagNumber(7)
  set bloodType($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasBloodType() => $_has(6);
  @$pb.TagNumber(7)
  void clearBloodType() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get role => $_getSZ(7);
  @$pb.TagNumber(8)
  set role($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasRole() => $_has(7);
  @$pb.TagNumber(8)
  void clearRole() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.int get yearsExperience => $_getIZ(8);
  @$pb.TagNumber(9)
  set yearsExperience($core.int value) => $_setSignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasYearsExperience() => $_has(8);
  @$pb.TagNumber(9)
  void clearYearsExperience() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.bool get isActive => $_getBF(9);
  @$pb.TagNumber(10)
  set isActive($core.bool value) => $_setBool(9, value);
  @$pb.TagNumber(10)
  $core.bool hasIsActive() => $_has(9);
  @$pb.TagNumber(10)
  void clearIsActive() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.String get createdAt => $_getSZ(10);
  @$pb.TagNumber(11)
  set createdAt($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasCreatedAt() => $_has(10);
  @$pb.TagNumber(11)
  void clearCreatedAt() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.String get dutyStatus => $_getSZ(11);
  @$pb.TagNumber(12)
  set dutyStatus($core.String value) => $_setString(11, value);
  @$pb.TagNumber(12)
  $core.bool hasDutyStatus() => $_has(11);
  @$pb.TagNumber(12)
  void clearDutyStatus() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.String get ci => $_getSZ(12);
  @$pb.TagNumber(13)
  set ci($core.String value) => $_setString(12, value);
  @$pb.TagNumber(13)
  $core.bool hasCi() => $_has(12);
  @$pb.TagNumber(13)
  void clearCi() => $_clearField(13);
}

/// Estructura para la telemetría en tiempo real (Rastreo GPS)
class LocationUpdate extends $pb.GeneratedMessage {
  factory LocationUpdate({
    $core.int? userId,
    $core.double? latitude,
    $core.double? longitude,
    $fixnum.Int64? timestampMs,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (latitude != null) result.latitude = latitude;
    if (longitude != null) result.longitude = longitude;
    if (timestampMs != null) result.timestampMs = timestampMs;
    return result;
  }

  LocationUpdate._();

  factory LocationUpdate.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LocationUpdate.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LocationUpdate',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.personnel.v1'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'userId')
    ..aD(2, _omitFieldNames ? '' : 'latitude')
    ..aD(3, _omitFieldNames ? '' : 'longitude')
    ..aInt64(4, _omitFieldNames ? '' : 'timestampMs')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LocationUpdate clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LocationUpdate copyWith(void Function(LocationUpdate) updates) =>
      super.copyWith((message) => updates(message as LocationUpdate))
          as LocationUpdate;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LocationUpdate create() => LocationUpdate._();
  @$core.override
  LocationUpdate createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LocationUpdate getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LocationUpdate>(create);
  static LocationUpdate? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get userId => $_getIZ(0);
  @$pb.TagNumber(1)
  set userId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

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
  $fixnum.Int64 get timestampMs => $_getI64(3);
  @$pb.TagNumber(4)
  set timestampMs($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTimestampMs() => $_has(3);
  @$pb.TagNumber(4)
  void clearTimestampMs() => $_clearField(4);
}

class Task extends $pb.GeneratedMessage {
  factory Task({
    $core.int? id,
    $core.int? institutionId,
    $core.int? assignedTeamId,
    $core.int? assignedUserId,
    $core.String? title,
    $core.String? description,
    $core.String? priority,
    $core.String? status,
    $core.String? dueDate,
    $core.int? createdBy,
    $core.String? createdAt,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (institutionId != null) result.institutionId = institutionId;
    if (assignedTeamId != null) result.assignedTeamId = assignedTeamId;
    if (assignedUserId != null) result.assignedUserId = assignedUserId;
    if (title != null) result.title = title;
    if (description != null) result.description = description;
    if (priority != null) result.priority = priority;
    if (status != null) result.status = status;
    if (dueDate != null) result.dueDate = dueDate;
    if (createdBy != null) result.createdBy = createdBy;
    if (createdAt != null) result.createdAt = createdAt;
    return result;
  }

  Task._();

  factory Task.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Task.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Task',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.personnel.v1'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'id')
    ..aI(2, _omitFieldNames ? '' : 'institutionId')
    ..aI(3, _omitFieldNames ? '' : 'assignedTeamId')
    ..aI(4, _omitFieldNames ? '' : 'assignedUserId')
    ..aOS(5, _omitFieldNames ? '' : 'title')
    ..aOS(6, _omitFieldNames ? '' : 'description')
    ..aOS(7, _omitFieldNames ? '' : 'priority')
    ..aOS(8, _omitFieldNames ? '' : 'status')
    ..aOS(9, _omitFieldNames ? '' : 'dueDate')
    ..aI(10, _omitFieldNames ? '' : 'createdBy')
    ..aOS(11, _omitFieldNames ? '' : 'createdAt')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Task clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Task copyWith(void Function(Task) updates) =>
      super.copyWith((message) => updates(message as Task)) as Task;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Task create() => Task._();
  @$core.override
  Task createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Task getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Task>(create);
  static Task? _defaultInstance;

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
  $core.int get assignedTeamId => $_getIZ(2);
  @$pb.TagNumber(3)
  set assignedTeamId($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAssignedTeamId() => $_has(2);
  @$pb.TagNumber(3)
  void clearAssignedTeamId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get assignedUserId => $_getIZ(3);
  @$pb.TagNumber(4)
  set assignedUserId($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAssignedUserId() => $_has(3);
  @$pb.TagNumber(4)
  void clearAssignedUserId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get title => $_getSZ(4);
  @$pb.TagNumber(5)
  set title($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasTitle() => $_has(4);
  @$pb.TagNumber(5)
  void clearTitle() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get description => $_getSZ(5);
  @$pb.TagNumber(6)
  set description($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasDescription() => $_has(5);
  @$pb.TagNumber(6)
  void clearDescription() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get priority => $_getSZ(6);
  @$pb.TagNumber(7)
  set priority($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasPriority() => $_has(6);
  @$pb.TagNumber(7)
  void clearPriority() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get status => $_getSZ(7);
  @$pb.TagNumber(8)
  set status($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasStatus() => $_has(7);
  @$pb.TagNumber(8)
  void clearStatus() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get dueDate => $_getSZ(8);
  @$pb.TagNumber(9)
  set dueDate($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasDueDate() => $_has(8);
  @$pb.TagNumber(9)
  void clearDueDate() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.int get createdBy => $_getIZ(9);
  @$pb.TagNumber(10)
  set createdBy($core.int value) => $_setSignedInt32(9, value);
  @$pb.TagNumber(10)
  $core.bool hasCreatedBy() => $_has(9);
  @$pb.TagNumber(10)
  void clearCreatedBy() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.String get createdAt => $_getSZ(10);
  @$pb.TagNumber(11)
  set createdAt($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasCreatedAt() => $_has(10);
  @$pb.TagNumber(11)
  void clearCreatedAt() => $_clearField(11);
}

class LoginRequest extends $pb.GeneratedMessage {
  factory LoginRequest({
    $core.String? email,
    $core.String? password,
  }) {
    final result = create();
    if (email != null) result.email = email;
    if (password != null) result.password = password;
    return result;
  }

  LoginRequest._();

  factory LoginRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LoginRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LoginRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.personnel.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'email')
    ..aOS(2, _omitFieldNames ? '' : 'password')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LoginRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LoginRequest copyWith(void Function(LoginRequest) updates) =>
      super.copyWith((message) => updates(message as LoginRequest))
          as LoginRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LoginRequest create() => LoginRequest._();
  @$core.override
  LoginRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LoginRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LoginRequest>(create);
  static LoginRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => $_clearField(2);
}

class LoginResponse extends $pb.GeneratedMessage {
  factory LoginResponse({
    $core.String? token,
    User? user,
  }) {
    final result = create();
    if (token != null) result.token = token;
    if (user != null) result.user = user;
    return result;
  }

  LoginResponse._();

  factory LoginResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LoginResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LoginResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.personnel.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'token')
    ..aOM<User>(2, _omitFieldNames ? '' : 'user', subBuilder: User.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LoginResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LoginResponse copyWith(void Function(LoginResponse) updates) =>
      super.copyWith((message) => updates(message as LoginResponse))
          as LoginResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LoginResponse create() => LoginResponse._();
  @$core.override
  LoginResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LoginResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LoginResponse>(create);
  static LoginResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get token => $_getSZ(0);
  @$pb.TagNumber(1)
  set token($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearToken() => $_clearField(1);

  @$pb.TagNumber(2)
  User get user => $_getN(1);
  @$pb.TagNumber(2)
  set user(User value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasUser() => $_has(1);
  @$pb.TagNumber(2)
  void clearUser() => $_clearField(2);
  @$pb.TagNumber(2)
  User ensureUser() => $_ensure(1);
}

class GetUserRequest extends $pb.GeneratedMessage {
  factory GetUserRequest({
    $core.int? userId,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    return result;
  }

  GetUserRequest._();

  factory GetUserRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetUserRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetUserRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.personnel.v1'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'userId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetUserRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetUserRequest copyWith(void Function(GetUserRequest) updates) =>
      super.copyWith((message) => updates(message as GetUserRequest))
          as GetUserRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUserRequest create() => GetUserRequest._();
  @$core.override
  GetUserRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetUserRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetUserRequest>(create);
  static GetUserRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get userId => $_getIZ(0);
  @$pb.TagNumber(1)
  set userId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);
}

class UserResponse extends $pb.GeneratedMessage {
  factory UserResponse({
    User? user,
  }) {
    final result = create();
    if (user != null) result.user = user;
    return result;
  }

  UserResponse._();

  factory UserResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.personnel.v1'),
      createEmptyInstance: create)
    ..aOM<User>(1, _omitFieldNames ? '' : 'user', subBuilder: User.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserResponse copyWith(void Function(UserResponse) updates) =>
      super.copyWith((message) => updates(message as UserResponse))
          as UserResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserResponse create() => UserResponse._();
  @$core.override
  UserResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserResponse>(create);
  static UserResponse? _defaultInstance;

  @$pb.TagNumber(1)
  User get user => $_getN(0);
  @$pb.TagNumber(1)
  set user(User value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => $_clearField(1);
  @$pb.TagNumber(1)
  User ensureUser() => $_ensure(0);
}

class ListUsersByTeamRequest extends $pb.GeneratedMessage {
  factory ListUsersByTeamRequest({
    $core.int? teamId,
  }) {
    final result = create();
    if (teamId != null) result.teamId = teamId;
    return result;
  }

  ListUsersByTeamRequest._();

  factory ListUsersByTeamRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListUsersByTeamRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListUsersByTeamRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.personnel.v1'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'teamId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListUsersByTeamRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListUsersByTeamRequest copyWith(
          void Function(ListUsersByTeamRequest) updates) =>
      super.copyWith((message) => updates(message as ListUsersByTeamRequest))
          as ListUsersByTeamRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListUsersByTeamRequest create() => ListUsersByTeamRequest._();
  @$core.override
  ListUsersByTeamRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListUsersByTeamRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListUsersByTeamRequest>(create);
  static ListUsersByTeamRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get teamId => $_getIZ(0);
  @$pb.TagNumber(1)
  set teamId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTeamId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTeamId() => $_clearField(1);
}

class ListUsersRequest extends $pb.GeneratedMessage {
  factory ListUsersRequest({
    $core.int? pageSize,
    $core.int? pageToken,
  }) {
    final result = create();
    if (pageSize != null) result.pageSize = pageSize;
    if (pageToken != null) result.pageToken = pageToken;
    return result;
  }

  ListUsersRequest._();

  factory ListUsersRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListUsersRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListUsersRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.personnel.v1'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'pageSize')
    ..aI(2, _omitFieldNames ? '' : 'pageToken')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListUsersRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListUsersRequest copyWith(void Function(ListUsersRequest) updates) =>
      super.copyWith((message) => updates(message as ListUsersRequest))
          as ListUsersRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListUsersRequest create() => ListUsersRequest._();
  @$core.override
  ListUsersRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListUsersRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListUsersRequest>(create);
  static ListUsersRequest? _defaultInstance;

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

class ListUsersResponse extends $pb.GeneratedMessage {
  factory ListUsersResponse({
    $core.Iterable<User>? users,
    $core.String? nextPageToken,
  }) {
    final result = create();
    if (users != null) result.users.addAll(users);
    if (nextPageToken != null) result.nextPageToken = nextPageToken;
    return result;
  }

  ListUsersResponse._();

  factory ListUsersResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListUsersResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListUsersResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.personnel.v1'),
      createEmptyInstance: create)
    ..pPM<User>(1, _omitFieldNames ? '' : 'users', subBuilder: User.create)
    ..aOS(2, _omitFieldNames ? '' : 'nextPageToken')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListUsersResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListUsersResponse copyWith(void Function(ListUsersResponse) updates) =>
      super.copyWith((message) => updates(message as ListUsersResponse))
          as ListUsersResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListUsersResponse create() => ListUsersResponse._();
  @$core.override
  ListUsersResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListUsersResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListUsersResponse>(create);
  static ListUsersResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<User> get users => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get nextPageToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set nextPageToken($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNextPageToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearNextPageToken() => $_clearField(2);
}

class UserListResponse extends $pb.GeneratedMessage {
  factory UserListResponse({
    $core.Iterable<User>? users,
  }) {
    final result = create();
    if (users != null) result.users.addAll(users);
    return result;
  }

  UserListResponse._();

  factory UserListResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserListResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserListResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.personnel.v1'),
      createEmptyInstance: create)
    ..pPM<User>(1, _omitFieldNames ? '' : 'users', subBuilder: User.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserListResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserListResponse copyWith(void Function(UserListResponse) updates) =>
      super.copyWith((message) => updates(message as UserListResponse))
          as UserListResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserListResponse create() => UserListResponse._();
  @$core.override
  UserListResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserListResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserListResponse>(create);
  static UserListResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<User> get users => $_getList(0);
}

class TeamListResponse extends $pb.GeneratedMessage {
  factory TeamListResponse({
    $core.Iterable<Team>? teams,
  }) {
    final result = create();
    if (teams != null) result.teams.addAll(teams);
    return result;
  }

  TeamListResponse._();

  factory TeamListResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TeamListResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TeamListResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.personnel.v1'),
      createEmptyInstance: create)
    ..pPM<Team>(1, _omitFieldNames ? '' : 'teams', subBuilder: Team.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TeamListResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TeamListResponse copyWith(void Function(TeamListResponse) updates) =>
      super.copyWith((message) => updates(message as TeamListResponse))
          as TeamListResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TeamListResponse create() => TeamListResponse._();
  @$core.override
  TeamListResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TeamListResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TeamListResponse>(create);
  static TeamListResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Team> get teams => $_getList(0);
}

class InstitutionListResponse extends $pb.GeneratedMessage {
  factory InstitutionListResponse({
    $core.Iterable<Institution>? institutions,
  }) {
    final result = create();
    if (institutions != null) result.institutions.addAll(institutions);
    return result;
  }

  InstitutionListResponse._();

  factory InstitutionListResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InstitutionListResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InstitutionListResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.personnel.v1'),
      createEmptyInstance: create)
    ..pPM<Institution>(1, _omitFieldNames ? '' : 'institutions',
        subBuilder: Institution.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InstitutionListResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InstitutionListResponse copyWith(
          void Function(InstitutionListResponse) updates) =>
      super.copyWith((message) => updates(message as InstitutionListResponse))
          as InstitutionListResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InstitutionListResponse create() => InstitutionListResponse._();
  @$core.override
  InstitutionListResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InstitutionListResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InstitutionListResponse>(create);
  static InstitutionListResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Institution> get institutions => $_getList(0);
}

class ListBranchesRequest extends $pb.GeneratedMessage {
  factory ListBranchesRequest({
    $core.int? institutionId,
  }) {
    final result = create();
    if (institutionId != null) result.institutionId = institutionId;
    return result;
  }

  ListBranchesRequest._();

  factory ListBranchesRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListBranchesRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListBranchesRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.personnel.v1'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'institutionId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListBranchesRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListBranchesRequest copyWith(void Function(ListBranchesRequest) updates) =>
      super.copyWith((message) => updates(message as ListBranchesRequest))
          as ListBranchesRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListBranchesRequest create() => ListBranchesRequest._();
  @$core.override
  ListBranchesRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListBranchesRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListBranchesRequest>(create);
  static ListBranchesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get institutionId => $_getIZ(0);
  @$pb.TagNumber(1)
  set institutionId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasInstitutionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearInstitutionId() => $_clearField(1);
}

class BranchListResponse extends $pb.GeneratedMessage {
  factory BranchListResponse({
    $core.Iterable<Branch>? branches,
  }) {
    final result = create();
    if (branches != null) result.branches.addAll(branches);
    return result;
  }

  BranchListResponse._();

  factory BranchListResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BranchListResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BranchListResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.personnel.v1'),
      createEmptyInstance: create)
    ..pPM<Branch>(1, _omitFieldNames ? '' : 'branches',
        subBuilder: Branch.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BranchListResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BranchListResponse copyWith(void Function(BranchListResponse) updates) =>
      super.copyWith((message) => updates(message as BranchListResponse))
          as BranchListResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BranchListResponse create() => BranchListResponse._();
  @$core.override
  BranchListResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BranchListResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BranchListResponse>(create);
  static BranchListResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Branch> get branches => $_getList(0);
}

class CreateUserRequest extends $pb.GeneratedMessage {
  factory CreateUserRequest({
    $core.int? institutionId,
    $core.int? teamId,
    $core.String? fullName,
    $core.String? email,
    $core.String? rawPassword,
    $core.String? phone,
    $core.String? bloodType,
    $core.String? role,
    $core.int? yearsExperience,
    $core.String? ci,
  }) {
    final result = create();
    if (institutionId != null) result.institutionId = institutionId;
    if (teamId != null) result.teamId = teamId;
    if (fullName != null) result.fullName = fullName;
    if (email != null) result.email = email;
    if (rawPassword != null) result.rawPassword = rawPassword;
    if (phone != null) result.phone = phone;
    if (bloodType != null) result.bloodType = bloodType;
    if (role != null) result.role = role;
    if (yearsExperience != null) result.yearsExperience = yearsExperience;
    if (ci != null) result.ci = ci;
    return result;
  }

  CreateUserRequest._();

  factory CreateUserRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateUserRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateUserRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.personnel.v1'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'institutionId')
    ..aI(2, _omitFieldNames ? '' : 'teamId')
    ..aOS(3, _omitFieldNames ? '' : 'fullName')
    ..aOS(4, _omitFieldNames ? '' : 'email')
    ..aOS(5, _omitFieldNames ? '' : 'rawPassword')
    ..aOS(6, _omitFieldNames ? '' : 'phone')
    ..aOS(7, _omitFieldNames ? '' : 'bloodType')
    ..aOS(8, _omitFieldNames ? '' : 'role')
    ..aI(9, _omitFieldNames ? '' : 'yearsExperience')
    ..aOS(10, _omitFieldNames ? '' : 'ci')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateUserRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateUserRequest copyWith(void Function(CreateUserRequest) updates) =>
      super.copyWith((message) => updates(message as CreateUserRequest))
          as CreateUserRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateUserRequest create() => CreateUserRequest._();
  @$core.override
  CreateUserRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateUserRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateUserRequest>(create);
  static CreateUserRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get institutionId => $_getIZ(0);
  @$pb.TagNumber(1)
  set institutionId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasInstitutionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearInstitutionId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get teamId => $_getIZ(1);
  @$pb.TagNumber(2)
  set teamId($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTeamId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTeamId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get fullName => $_getSZ(2);
  @$pb.TagNumber(3)
  set fullName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFullName() => $_has(2);
  @$pb.TagNumber(3)
  void clearFullName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get email => $_getSZ(3);
  @$pb.TagNumber(4)
  set email($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasEmail() => $_has(3);
  @$pb.TagNumber(4)
  void clearEmail() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get rawPassword => $_getSZ(4);
  @$pb.TagNumber(5)
  set rawPassword($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasRawPassword() => $_has(4);
  @$pb.TagNumber(5)
  void clearRawPassword() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get phone => $_getSZ(5);
  @$pb.TagNumber(6)
  set phone($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasPhone() => $_has(5);
  @$pb.TagNumber(6)
  void clearPhone() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get bloodType => $_getSZ(6);
  @$pb.TagNumber(7)
  set bloodType($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasBloodType() => $_has(6);
  @$pb.TagNumber(7)
  void clearBloodType() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get role => $_getSZ(7);
  @$pb.TagNumber(8)
  set role($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasRole() => $_has(7);
  @$pb.TagNumber(8)
  void clearRole() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.int get yearsExperience => $_getIZ(8);
  @$pb.TagNumber(9)
  set yearsExperience($core.int value) => $_setSignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasYearsExperience() => $_has(8);
  @$pb.TagNumber(9)
  void clearYearsExperience() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get ci => $_getSZ(9);
  @$pb.TagNumber(10)
  set ci($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasCi() => $_has(9);
  @$pb.TagNumber(10)
  void clearCi() => $_clearField(10);
}

class CertificationListResponse extends $pb.GeneratedMessage {
  factory CertificationListResponse({
    $core.Iterable<Certification>? certifications,
  }) {
    final result = create();
    if (certifications != null) result.certifications.addAll(certifications);
    return result;
  }

  CertificationListResponse._();

  factory CertificationListResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CertificationListResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CertificationListResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.personnel.v1'),
      createEmptyInstance: create)
    ..pPM<Certification>(1, _omitFieldNames ? '' : 'certifications',
        subBuilder: Certification.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CertificationListResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CertificationListResponse copyWith(
          void Function(CertificationListResponse) updates) =>
      super.copyWith((message) => updates(message as CertificationListResponse))
          as CertificationListResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CertificationListResponse create() => CertificationListResponse._();
  @$core.override
  CertificationListResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CertificationListResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CertificationListResponse>(create);
  static CertificationListResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Certification> get certifications => $_getList(0);
}

class UpdateUserRequest extends $pb.GeneratedMessage {
  factory UpdateUserRequest({
    User? user,
  }) {
    final result = create();
    if (user != null) result.user = user;
    return result;
  }

  UpdateUserRequest._();

  factory UpdateUserRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateUserRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateUserRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.personnel.v1'),
      createEmptyInstance: create)
    ..aOM<User>(1, _omitFieldNames ? '' : 'user', subBuilder: User.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateUserRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateUserRequest copyWith(void Function(UpdateUserRequest) updates) =>
      super.copyWith((message) => updates(message as UpdateUserRequest))
          as UpdateUserRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateUserRequest create() => UpdateUserRequest._();
  @$core.override
  UpdateUserRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UpdateUserRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateUserRequest>(create);
  static UpdateUserRequest? _defaultInstance;

  @$pb.TagNumber(1)
  User get user => $_getN(0);
  @$pb.TagNumber(1)
  set user(User value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => $_clearField(1);
  @$pb.TagNumber(1)
  User ensureUser() => $_ensure(0);
}

class GetTeamRequest extends $pb.GeneratedMessage {
  factory GetTeamRequest({
    $core.int? teamId,
  }) {
    final result = create();
    if (teamId != null) result.teamId = teamId;
    return result;
  }

  GetTeamRequest._();

  factory GetTeamRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetTeamRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetTeamRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.personnel.v1'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'teamId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetTeamRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetTeamRequest copyWith(void Function(GetTeamRequest) updates) =>
      super.copyWith((message) => updates(message as GetTeamRequest))
          as GetTeamRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTeamRequest create() => GetTeamRequest._();
  @$core.override
  GetTeamRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetTeamRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetTeamRequest>(create);
  static GetTeamRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get teamId => $_getIZ(0);
  @$pb.TagNumber(1)
  set teamId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTeamId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTeamId() => $_clearField(1);
}

class TeamResponse extends $pb.GeneratedMessage {
  factory TeamResponse({
    Team? team,
    Branch? branch,
    Institution? institution,
  }) {
    final result = create();
    if (team != null) result.team = team;
    if (branch != null) result.branch = branch;
    if (institution != null) result.institution = institution;
    return result;
  }

  TeamResponse._();

  factory TeamResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TeamResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TeamResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.personnel.v1'),
      createEmptyInstance: create)
    ..aOM<Team>(1, _omitFieldNames ? '' : 'team', subBuilder: Team.create)
    ..aOM<Branch>(2, _omitFieldNames ? '' : 'branch', subBuilder: Branch.create)
    ..aOM<Institution>(3, _omitFieldNames ? '' : 'institution',
        subBuilder: Institution.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TeamResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TeamResponse copyWith(void Function(TeamResponse) updates) =>
      super.copyWith((message) => updates(message as TeamResponse))
          as TeamResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TeamResponse create() => TeamResponse._();
  @$core.override
  TeamResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TeamResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TeamResponse>(create);
  static TeamResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Team get team => $_getN(0);
  @$pb.TagNumber(1)
  set team(Team value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTeam() => $_has(0);
  @$pb.TagNumber(1)
  void clearTeam() => $_clearField(1);
  @$pb.TagNumber(1)
  Team ensureTeam() => $_ensure(0);

  @$pb.TagNumber(2)
  Branch get branch => $_getN(1);
  @$pb.TagNumber(2)
  set branch(Branch value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasBranch() => $_has(1);
  @$pb.TagNumber(2)
  void clearBranch() => $_clearField(2);
  @$pb.TagNumber(2)
  Branch ensureBranch() => $_ensure(1);

  @$pb.TagNumber(3)
  Institution get institution => $_getN(2);
  @$pb.TagNumber(3)
  set institution(Institution value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasInstitution() => $_has(2);
  @$pb.TagNumber(3)
  void clearInstitution() => $_clearField(3);
  @$pb.TagNumber(3)
  Institution ensureInstitution() => $_ensure(2);
}

class ReportLocationResponse extends $pb.GeneratedMessage {
  factory ReportLocationResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  ReportLocationResponse._();

  factory ReportLocationResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReportLocationResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReportLocationResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.personnel.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReportLocationResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReportLocationResponse copyWith(
          void Function(ReportLocationResponse) updates) =>
      super.copyWith((message) => updates(message as ReportLocationResponse))
          as ReportLocationResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReportLocationResponse create() => ReportLocationResponse._();
  @$core.override
  ReportLocationResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ReportLocationResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReportLocationResponse>(create);
  static ReportLocationResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class UpdateStatusRequest extends $pb.GeneratedMessage {
  factory UpdateStatusRequest({
    $core.int? userId,
    $core.String? dutyStatus,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (dutyStatus != null) result.dutyStatus = dutyStatus;
    return result;
  }

  UpdateStatusRequest._();

  factory UpdateStatusRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateStatusRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateStatusRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.personnel.v1'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'dutyStatus')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateStatusRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateStatusRequest copyWith(void Function(UpdateStatusRequest) updates) =>
      super.copyWith((message) => updates(message as UpdateStatusRequest))
          as UpdateStatusRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateStatusRequest create() => UpdateStatusRequest._();
  @$core.override
  UpdateStatusRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UpdateStatusRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateStatusRequest>(create);
  static UpdateStatusRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get userId => $_getIZ(0);
  @$pb.TagNumber(1)
  set userId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get dutyStatus => $_getSZ(1);
  @$pb.TagNumber(2)
  set dutyStatus($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDutyStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearDutyStatus() => $_clearField(2);
}

class Skill extends $pb.GeneratedMessage {
  factory Skill({
    $core.int? id,
    $core.int? userId,
    $core.String? name,
    $core.String? category,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (userId != null) result.userId = userId;
    if (name != null) result.name = name;
    if (category != null) result.category = category;
    return result;
  }

  Skill._();

  factory Skill.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Skill.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Skill',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.personnel.v1'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'id')
    ..aI(2, _omitFieldNames ? '' : 'userId')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOS(4, _omitFieldNames ? '' : 'category')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Skill clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Skill copyWith(void Function(Skill) updates) =>
      super.copyWith((message) => updates(message as Skill)) as Skill;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Skill create() => Skill._();
  @$core.override
  Skill createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Skill getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Skill>(create);
  static Skill? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get userId => $_getIZ(1);
  @$pb.TagNumber(2)
  set userId($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get category => $_getSZ(3);
  @$pb.TagNumber(4)
  set category($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCategory() => $_has(3);
  @$pb.TagNumber(4)
  void clearCategory() => $_clearField(4);
}

class SkillRequest extends $pb.GeneratedMessage {
  factory SkillRequest({
    $core.int? userId,
    $core.String? name,
    $core.String? category,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (name != null) result.name = name;
    if (category != null) result.category = category;
    return result;
  }

  SkillRequest._();

  factory SkillRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SkillRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SkillRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.personnel.v1'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'category')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SkillRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SkillRequest copyWith(void Function(SkillRequest) updates) =>
      super.copyWith((message) => updates(message as SkillRequest))
          as SkillRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SkillRequest create() => SkillRequest._();
  @$core.override
  SkillRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SkillRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SkillRequest>(create);
  static SkillRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get userId => $_getIZ(0);
  @$pb.TagNumber(1)
  set userId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get category => $_getSZ(2);
  @$pb.TagNumber(3)
  set category($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCategory() => $_has(2);
  @$pb.TagNumber(3)
  void clearCategory() => $_clearField(3);
}

class SkillList extends $pb.GeneratedMessage {
  factory SkillList({
    $core.Iterable<Skill>? skills,
  }) {
    final result = create();
    if (skills != null) result.skills.addAll(skills);
    return result;
  }

  SkillList._();

  factory SkillList.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SkillList.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SkillList',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.personnel.v1'),
      createEmptyInstance: create)
    ..pPM<Skill>(1, _omitFieldNames ? '' : 'skills', subBuilder: Skill.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SkillList clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SkillList copyWith(void Function(SkillList) updates) =>
      super.copyWith((message) => updates(message as SkillList)) as SkillList;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SkillList create() => SkillList._();
  @$core.override
  SkillList createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SkillList getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SkillList>(create);
  static SkillList? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Skill> get skills => $_getList(0);
}

class AssignRequest extends $pb.GeneratedMessage {
  factory AssignRequest({
    $core.int? userId,
    $core.int? newTeamId,
    $core.String? newRole,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (newTeamId != null) result.newTeamId = newTeamId;
    if (newRole != null) result.newRole = newRole;
    return result;
  }

  AssignRequest._();

  factory AssignRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AssignRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AssignRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.personnel.v1'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'userId')
    ..aI(2, _omitFieldNames ? '' : 'newTeamId')
    ..aOS(3, _omitFieldNames ? '' : 'newRole')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AssignRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AssignRequest copyWith(void Function(AssignRequest) updates) =>
      super.copyWith((message) => updates(message as AssignRequest))
          as AssignRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AssignRequest create() => AssignRequest._();
  @$core.override
  AssignRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AssignRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AssignRequest>(create);
  static AssignRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get userId => $_getIZ(0);
  @$pb.TagNumber(1)
  set userId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get newTeamId => $_getIZ(1);
  @$pb.TagNumber(2)
  set newTeamId($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNewTeamId() => $_has(1);
  @$pb.TagNumber(2)
  void clearNewTeamId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get newRole => $_getSZ(2);
  @$pb.TagNumber(3)
  set newRole($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasNewRole() => $_has(2);
  @$pb.TagNumber(3)
  void clearNewRole() => $_clearField(3);
}

class CreateTeamRequest extends $pb.GeneratedMessage {
  factory CreateTeamRequest({
    $core.int? branchId,
    $core.String? name,
  }) {
    final result = create();
    if (branchId != null) result.branchId = branchId;
    if (name != null) result.name = name;
    return result;
  }

  CreateTeamRequest._();

  factory CreateTeamRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateTeamRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateTeamRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.personnel.v1'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'branchId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateTeamRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateTeamRequest copyWith(void Function(CreateTeamRequest) updates) =>
      super.copyWith((message) => updates(message as CreateTeamRequest))
          as CreateTeamRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateTeamRequest create() => CreateTeamRequest._();
  @$core.override
  CreateTeamRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateTeamRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateTeamRequest>(create);
  static CreateTeamRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get branchId => $_getIZ(0);
  @$pb.TagNumber(1)
  set branchId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBranchId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBranchId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);
}

class UpdateTeamRequest extends $pb.GeneratedMessage {
  factory UpdateTeamRequest({
    $core.int? teamId,
    $core.String? name,
    $core.bool? isActive,
  }) {
    final result = create();
    if (teamId != null) result.teamId = teamId;
    if (name != null) result.name = name;
    if (isActive != null) result.isActive = isActive;
    return result;
  }

  UpdateTeamRequest._();

  factory UpdateTeamRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateTeamRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateTeamRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.personnel.v1'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'teamId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOB(3, _omitFieldNames ? '' : 'isActive')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateTeamRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateTeamRequest copyWith(void Function(UpdateTeamRequest) updates) =>
      super.copyWith((message) => updates(message as UpdateTeamRequest))
          as UpdateTeamRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateTeamRequest create() => UpdateTeamRequest._();
  @$core.override
  UpdateTeamRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UpdateTeamRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateTeamRequest>(create);
  static UpdateTeamRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get teamId => $_getIZ(0);
  @$pb.TagNumber(1)
  set teamId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTeamId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTeamId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isActive => $_getBF(2);
  @$pb.TagNumber(3)
  set isActive($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIsActive() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsActive() => $_clearField(3);
}

class DeleteTeamRequest extends $pb.GeneratedMessage {
  factory DeleteTeamRequest({
    $core.int? teamId,
  }) {
    final result = create();
    if (teamId != null) result.teamId = teamId;
    return result;
  }

  DeleteTeamRequest._();

  factory DeleteTeamRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteTeamRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteTeamRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.personnel.v1'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'teamId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteTeamRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteTeamRequest copyWith(void Function(DeleteTeamRequest) updates) =>
      super.copyWith((message) => updates(message as DeleteTeamRequest))
          as DeleteTeamRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteTeamRequest create() => DeleteTeamRequest._();
  @$core.override
  DeleteTeamRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DeleteTeamRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteTeamRequest>(create);
  static DeleteTeamRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get teamId => $_getIZ(0);
  @$pb.TagNumber(1)
  set teamId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTeamId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTeamId() => $_clearField(1);
}

class GetInstitutionRequest extends $pb.GeneratedMessage {
  factory GetInstitutionRequest({
    $core.int? institutionId,
  }) {
    final result = create();
    if (institutionId != null) result.institutionId = institutionId;
    return result;
  }

  GetInstitutionRequest._();

  factory GetInstitutionRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetInstitutionRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetInstitutionRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.personnel.v1'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'institutionId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetInstitutionRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetInstitutionRequest copyWith(
          void Function(GetInstitutionRequest) updates) =>
      super.copyWith((message) => updates(message as GetInstitutionRequest))
          as GetInstitutionRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetInstitutionRequest create() => GetInstitutionRequest._();
  @$core.override
  GetInstitutionRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetInstitutionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetInstitutionRequest>(create);
  static GetInstitutionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get institutionId => $_getIZ(0);
  @$pb.TagNumber(1)
  set institutionId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasInstitutionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearInstitutionId() => $_clearField(1);
}

class InstitutionResponse extends $pb.GeneratedMessage {
  factory InstitutionResponse({
    Institution? institution,
  }) {
    final result = create();
    if (institution != null) result.institution = institution;
    return result;
  }

  InstitutionResponse._();

  factory InstitutionResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InstitutionResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InstitutionResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.personnel.v1'),
      createEmptyInstance: create)
    ..aOM<Institution>(1, _omitFieldNames ? '' : 'institution',
        subBuilder: Institution.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InstitutionResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InstitutionResponse copyWith(void Function(InstitutionResponse) updates) =>
      super.copyWith((message) => updates(message as InstitutionResponse))
          as InstitutionResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InstitutionResponse create() => InstitutionResponse._();
  @$core.override
  InstitutionResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InstitutionResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InstitutionResponse>(create);
  static InstitutionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Institution get institution => $_getN(0);
  @$pb.TagNumber(1)
  set institution(Institution value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasInstitution() => $_has(0);
  @$pb.TagNumber(1)
  void clearInstitution() => $_clearField(1);
  @$pb.TagNumber(1)
  Institution ensureInstitution() => $_ensure(0);
}

class CreateInstitutionRequest extends $pb.GeneratedMessage {
  factory CreateInstitutionRequest({
    $core.String? name,
    $core.String? region,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (region != null) result.region = region;
    return result;
  }

  CreateInstitutionRequest._();

  factory CreateInstitutionRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateInstitutionRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateInstitutionRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.personnel.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'region')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateInstitutionRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateInstitutionRequest copyWith(
          void Function(CreateInstitutionRequest) updates) =>
      super.copyWith((message) => updates(message as CreateInstitutionRequest))
          as CreateInstitutionRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateInstitutionRequest create() => CreateInstitutionRequest._();
  @$core.override
  CreateInstitutionRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateInstitutionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateInstitutionRequest>(create);
  static CreateInstitutionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get region => $_getSZ(1);
  @$pb.TagNumber(2)
  set region($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRegion() => $_has(1);
  @$pb.TagNumber(2)
  void clearRegion() => $_clearField(2);
}

class UpdateInstitutionRequest extends $pb.GeneratedMessage {
  factory UpdateInstitutionRequest({
    $core.int? institutionId,
    $core.String? name,
    $core.String? region,
    $core.bool? isActive,
  }) {
    final result = create();
    if (institutionId != null) result.institutionId = institutionId;
    if (name != null) result.name = name;
    if (region != null) result.region = region;
    if (isActive != null) result.isActive = isActive;
    return result;
  }

  UpdateInstitutionRequest._();

  factory UpdateInstitutionRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateInstitutionRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateInstitutionRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.personnel.v1'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'institutionId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'region')
    ..aOB(4, _omitFieldNames ? '' : 'isActive')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateInstitutionRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateInstitutionRequest copyWith(
          void Function(UpdateInstitutionRequest) updates) =>
      super.copyWith((message) => updates(message as UpdateInstitutionRequest))
          as UpdateInstitutionRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateInstitutionRequest create() => UpdateInstitutionRequest._();
  @$core.override
  UpdateInstitutionRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UpdateInstitutionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateInstitutionRequest>(create);
  static UpdateInstitutionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get institutionId => $_getIZ(0);
  @$pb.TagNumber(1)
  set institutionId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasInstitutionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearInstitutionId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get region => $_getSZ(2);
  @$pb.TagNumber(3)
  set region($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRegion() => $_has(2);
  @$pb.TagNumber(3)
  void clearRegion() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isActive => $_getBF(3);
  @$pb.TagNumber(4)
  set isActive($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasIsActive() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsActive() => $_clearField(4);
}

class DeleteInstitutionRequest extends $pb.GeneratedMessage {
  factory DeleteInstitutionRequest({
    $core.int? institutionId,
  }) {
    final result = create();
    if (institutionId != null) result.institutionId = institutionId;
    return result;
  }

  DeleteInstitutionRequest._();

  factory DeleteInstitutionRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteInstitutionRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteInstitutionRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.personnel.v1'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'institutionId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteInstitutionRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteInstitutionRequest copyWith(
          void Function(DeleteInstitutionRequest) updates) =>
      super.copyWith((message) => updates(message as DeleteInstitutionRequest))
          as DeleteInstitutionRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteInstitutionRequest create() => DeleteInstitutionRequest._();
  @$core.override
  DeleteInstitutionRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DeleteInstitutionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteInstitutionRequest>(create);
  static DeleteInstitutionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get institutionId => $_getIZ(0);
  @$pb.TagNumber(1)
  set institutionId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasInstitutionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearInstitutionId() => $_clearField(1);
}

class CreateBranchRequest extends $pb.GeneratedMessage {
  factory CreateBranchRequest({
    $core.int? institutionId,
    $core.String? name,
    $core.String? description,
  }) {
    final result = create();
    if (institutionId != null) result.institutionId = institutionId;
    if (name != null) result.name = name;
    if (description != null) result.description = description;
    return result;
  }

  CreateBranchRequest._();

  factory CreateBranchRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateBranchRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateBranchRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.personnel.v1'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'institutionId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateBranchRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateBranchRequest copyWith(void Function(CreateBranchRequest) updates) =>
      super.copyWith((message) => updates(message as CreateBranchRequest))
          as CreateBranchRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateBranchRequest create() => CreateBranchRequest._();
  @$core.override
  CreateBranchRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateBranchRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateBranchRequest>(create);
  static CreateBranchRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get institutionId => $_getIZ(0);
  @$pb.TagNumber(1)
  set institutionId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasInstitutionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearInstitutionId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => $_clearField(3);
}

class BranchResponse extends $pb.GeneratedMessage {
  factory BranchResponse({
    Branch? branch,
  }) {
    final result = create();
    if (branch != null) result.branch = branch;
    return result;
  }

  BranchResponse._();

  factory BranchResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BranchResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BranchResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.personnel.v1'),
      createEmptyInstance: create)
    ..aOM<Branch>(1, _omitFieldNames ? '' : 'branch', subBuilder: Branch.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BranchResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BranchResponse copyWith(void Function(BranchResponse) updates) =>
      super.copyWith((message) => updates(message as BranchResponse))
          as BranchResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BranchResponse create() => BranchResponse._();
  @$core.override
  BranchResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BranchResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BranchResponse>(create);
  static BranchResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Branch get branch => $_getN(0);
  @$pb.TagNumber(1)
  set branch(Branch value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasBranch() => $_has(0);
  @$pb.TagNumber(1)
  void clearBranch() => $_clearField(1);
  @$pb.TagNumber(1)
  Branch ensureBranch() => $_ensure(0);
}

class UpdateBranchRequest extends $pb.GeneratedMessage {
  factory UpdateBranchRequest({
    $core.int? branchId,
    $core.String? name,
    $core.String? description,
  }) {
    final result = create();
    if (branchId != null) result.branchId = branchId;
    if (name != null) result.name = name;
    if (description != null) result.description = description;
    return result;
  }

  UpdateBranchRequest._();

  factory UpdateBranchRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateBranchRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateBranchRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.personnel.v1'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'branchId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateBranchRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateBranchRequest copyWith(void Function(UpdateBranchRequest) updates) =>
      super.copyWith((message) => updates(message as UpdateBranchRequest))
          as UpdateBranchRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateBranchRequest create() => UpdateBranchRequest._();
  @$core.override
  UpdateBranchRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UpdateBranchRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateBranchRequest>(create);
  static UpdateBranchRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get branchId => $_getIZ(0);
  @$pb.TagNumber(1)
  set branchId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBranchId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBranchId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => $_clearField(3);
}

class DeleteBranchRequest extends $pb.GeneratedMessage {
  factory DeleteBranchRequest({
    $core.int? branchId,
  }) {
    final result = create();
    if (branchId != null) result.branchId = branchId;
    return result;
  }

  DeleteBranchRequest._();

  factory DeleteBranchRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteBranchRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteBranchRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.personnel.v1'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'branchId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteBranchRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteBranchRequest copyWith(void Function(DeleteBranchRequest) updates) =>
      super.copyWith((message) => updates(message as DeleteBranchRequest))
          as DeleteBranchRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteBranchRequest create() => DeleteBranchRequest._();
  @$core.override
  DeleteBranchRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DeleteBranchRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteBranchRequest>(create);
  static DeleteBranchRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get branchId => $_getIZ(0);
  @$pb.TagNumber(1)
  set branchId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBranchId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBranchId() => $_clearField(1);
}

class DeleteUserRequest extends $pb.GeneratedMessage {
  factory DeleteUserRequest({
    $core.int? userId,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    return result;
  }

  DeleteUserRequest._();

  factory DeleteUserRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteUserRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteUserRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.personnel.v1'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'userId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteUserRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteUserRequest copyWith(void Function(DeleteUserRequest) updates) =>
      super.copyWith((message) => updates(message as DeleteUserRequest))
          as DeleteUserRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteUserRequest create() => DeleteUserRequest._();
  @$core.override
  DeleteUserRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DeleteUserRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteUserRequest>(create);
  static DeleteUserRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get userId => $_getIZ(0);
  @$pb.TagNumber(1)
  set userId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);
}

class AddCertificationRequest extends $pb.GeneratedMessage {
  factory AddCertificationRequest({
    $core.int? userId,
    $core.String? name,
    $core.String? issueDate,
    $core.String? expiryDate,
    $core.String? certificateUrl,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (name != null) result.name = name;
    if (issueDate != null) result.issueDate = issueDate;
    if (expiryDate != null) result.expiryDate = expiryDate;
    if (certificateUrl != null) result.certificateUrl = certificateUrl;
    return result;
  }

  AddCertificationRequest._();

  factory AddCertificationRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AddCertificationRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AddCertificationRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.personnel.v1'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'issueDate')
    ..aOS(4, _omitFieldNames ? '' : 'expiryDate')
    ..aOS(5, _omitFieldNames ? '' : 'certificateUrl')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddCertificationRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddCertificationRequest copyWith(
          void Function(AddCertificationRequest) updates) =>
      super.copyWith((message) => updates(message as AddCertificationRequest))
          as AddCertificationRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddCertificationRequest create() => AddCertificationRequest._();
  @$core.override
  AddCertificationRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AddCertificationRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AddCertificationRequest>(create);
  static AddCertificationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get userId => $_getIZ(0);
  @$pb.TagNumber(1)
  set userId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get issueDate => $_getSZ(2);
  @$pb.TagNumber(3)
  set issueDate($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIssueDate() => $_has(2);
  @$pb.TagNumber(3)
  void clearIssueDate() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get expiryDate => $_getSZ(3);
  @$pb.TagNumber(4)
  set expiryDate($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasExpiryDate() => $_has(3);
  @$pb.TagNumber(4)
  void clearExpiryDate() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get certificateUrl => $_getSZ(4);
  @$pb.TagNumber(5)
  set certificateUrl($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCertificateUrl() => $_has(4);
  @$pb.TagNumber(5)
  void clearCertificateUrl() => $_clearField(5);
}

class ListTasksRequest extends $pb.GeneratedMessage {
  factory ListTasksRequest({
    $core.String? status,
    $core.int? teamId,
  }) {
    final result = create();
    if (status != null) result.status = status;
    if (teamId != null) result.teamId = teamId;
    return result;
  }

  ListTasksRequest._();

  factory ListTasksRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListTasksRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListTasksRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.personnel.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'status')
    ..aI(2, _omitFieldNames ? '' : 'teamId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListTasksRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListTasksRequest copyWith(void Function(ListTasksRequest) updates) =>
      super.copyWith((message) => updates(message as ListTasksRequest))
          as ListTasksRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListTasksRequest create() => ListTasksRequest._();
  @$core.override
  ListTasksRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListTasksRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListTasksRequest>(create);
  static ListTasksRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get teamId => $_getIZ(1);
  @$pb.TagNumber(2)
  set teamId($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTeamId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTeamId() => $_clearField(2);
}

class TaskListResponse extends $pb.GeneratedMessage {
  factory TaskListResponse({
    $core.Iterable<Task>? tasks,
  }) {
    final result = create();
    if (tasks != null) result.tasks.addAll(tasks);
    return result;
  }

  TaskListResponse._();

  factory TaskListResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TaskListResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TaskListResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.personnel.v1'),
      createEmptyInstance: create)
    ..pPM<Task>(1, _omitFieldNames ? '' : 'tasks', subBuilder: Task.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TaskListResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TaskListResponse copyWith(void Function(TaskListResponse) updates) =>
      super.copyWith((message) => updates(message as TaskListResponse))
          as TaskListResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TaskListResponse create() => TaskListResponse._();
  @$core.override
  TaskListResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TaskListResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TaskListResponse>(create);
  static TaskListResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Task> get tasks => $_getList(0);
}

class TaskResponse extends $pb.GeneratedMessage {
  factory TaskResponse({
    Task? task,
  }) {
    final result = create();
    if (task != null) result.task = task;
    return result;
  }

  TaskResponse._();

  factory TaskResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TaskResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TaskResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.personnel.v1'),
      createEmptyInstance: create)
    ..aOM<Task>(1, _omitFieldNames ? '' : 'task', subBuilder: Task.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TaskResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TaskResponse copyWith(void Function(TaskResponse) updates) =>
      super.copyWith((message) => updates(message as TaskResponse))
          as TaskResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TaskResponse create() => TaskResponse._();
  @$core.override
  TaskResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TaskResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TaskResponse>(create);
  static TaskResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Task get task => $_getN(0);
  @$pb.TagNumber(1)
  set task(Task value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTask() => $_has(0);
  @$pb.TagNumber(1)
  void clearTask() => $_clearField(1);
  @$pb.TagNumber(1)
  Task ensureTask() => $_ensure(0);
}

class CreateTaskRequest extends $pb.GeneratedMessage {
  factory CreateTaskRequest({
    $core.int? institutionId,
    $core.int? assignedTeamId,
    $core.int? assignedUserId,
    $core.String? title,
    $core.String? description,
    $core.String? priority,
    $core.String? status,
    $core.String? dueDate,
    $core.int? createdBy,
  }) {
    final result = create();
    if (institutionId != null) result.institutionId = institutionId;
    if (assignedTeamId != null) result.assignedTeamId = assignedTeamId;
    if (assignedUserId != null) result.assignedUserId = assignedUserId;
    if (title != null) result.title = title;
    if (description != null) result.description = description;
    if (priority != null) result.priority = priority;
    if (status != null) result.status = status;
    if (dueDate != null) result.dueDate = dueDate;
    if (createdBy != null) result.createdBy = createdBy;
    return result;
  }

  CreateTaskRequest._();

  factory CreateTaskRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateTaskRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateTaskRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.personnel.v1'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'institutionId')
    ..aI(2, _omitFieldNames ? '' : 'assignedTeamId')
    ..aI(3, _omitFieldNames ? '' : 'assignedUserId')
    ..aOS(4, _omitFieldNames ? '' : 'title')
    ..aOS(5, _omitFieldNames ? '' : 'description')
    ..aOS(6, _omitFieldNames ? '' : 'priority')
    ..aOS(7, _omitFieldNames ? '' : 'status')
    ..aOS(8, _omitFieldNames ? '' : 'dueDate')
    ..aI(9, _omitFieldNames ? '' : 'createdBy')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateTaskRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateTaskRequest copyWith(void Function(CreateTaskRequest) updates) =>
      super.copyWith((message) => updates(message as CreateTaskRequest))
          as CreateTaskRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateTaskRequest create() => CreateTaskRequest._();
  @$core.override
  CreateTaskRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateTaskRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateTaskRequest>(create);
  static CreateTaskRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get institutionId => $_getIZ(0);
  @$pb.TagNumber(1)
  set institutionId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasInstitutionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearInstitutionId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get assignedTeamId => $_getIZ(1);
  @$pb.TagNumber(2)
  set assignedTeamId($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAssignedTeamId() => $_has(1);
  @$pb.TagNumber(2)
  void clearAssignedTeamId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get assignedUserId => $_getIZ(2);
  @$pb.TagNumber(3)
  set assignedUserId($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAssignedUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearAssignedUserId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get title => $_getSZ(3);
  @$pb.TagNumber(4)
  set title($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTitle() => $_has(3);
  @$pb.TagNumber(4)
  void clearTitle() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get description => $_getSZ(4);
  @$pb.TagNumber(5)
  set description($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasDescription() => $_has(4);
  @$pb.TagNumber(5)
  void clearDescription() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get priority => $_getSZ(5);
  @$pb.TagNumber(6)
  set priority($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasPriority() => $_has(5);
  @$pb.TagNumber(6)
  void clearPriority() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get status => $_getSZ(6);
  @$pb.TagNumber(7)
  set status($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasStatus() => $_has(6);
  @$pb.TagNumber(7)
  void clearStatus() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get dueDate => $_getSZ(7);
  @$pb.TagNumber(8)
  set dueDate($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasDueDate() => $_has(7);
  @$pb.TagNumber(8)
  void clearDueDate() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.int get createdBy => $_getIZ(8);
  @$pb.TagNumber(9)
  set createdBy($core.int value) => $_setSignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasCreatedBy() => $_has(8);
  @$pb.TagNumber(9)
  void clearCreatedBy() => $_clearField(9);
}

class DashboardStatsRequest extends $pb.GeneratedMessage {
  factory DashboardStatsRequest({
    $core.int? institutionId,
  }) {
    final result = create();
    if (institutionId != null) result.institutionId = institutionId;
    return result;
  }

  DashboardStatsRequest._();

  factory DashboardStatsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DashboardStatsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DashboardStatsRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.personnel.v1'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'institutionId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DashboardStatsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DashboardStatsRequest copyWith(
          void Function(DashboardStatsRequest) updates) =>
      super.copyWith((message) => updates(message as DashboardStatsRequest))
          as DashboardStatsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DashboardStatsRequest create() => DashboardStatsRequest._();
  @$core.override
  DashboardStatsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DashboardStatsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DashboardStatsRequest>(create);
  static DashboardStatsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get institutionId => $_getIZ(0);
  @$pb.TagNumber(1)
  set institutionId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasInstitutionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearInstitutionId() => $_clearField(1);
}

class DashboardStatsResponse extends $pb.GeneratedMessage {
  factory DashboardStatsResponse({
    $core.int? activeUsers,
    $core.int? activeTeams,
    $core.int? totalBranches,
    $core.int? pendingTasks,
    $core.int? inProgressTasks,
    $core.int? criticalTasks,
  }) {
    final result = create();
    if (activeUsers != null) result.activeUsers = activeUsers;
    if (activeTeams != null) result.activeTeams = activeTeams;
    if (totalBranches != null) result.totalBranches = totalBranches;
    if (pendingTasks != null) result.pendingTasks = pendingTasks;
    if (inProgressTasks != null) result.inProgressTasks = inProgressTasks;
    if (criticalTasks != null) result.criticalTasks = criticalTasks;
    return result;
  }

  DashboardStatsResponse._();

  factory DashboardStatsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DashboardStatsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DashboardStatsResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.personnel.v1'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'activeUsers')
    ..aI(2, _omitFieldNames ? '' : 'activeTeams')
    ..aI(3, _omitFieldNames ? '' : 'totalBranches')
    ..aI(4, _omitFieldNames ? '' : 'pendingTasks')
    ..aI(5, _omitFieldNames ? '' : 'inProgressTasks')
    ..aI(6, _omitFieldNames ? '' : 'criticalTasks')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DashboardStatsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DashboardStatsResponse copyWith(
          void Function(DashboardStatsResponse) updates) =>
      super.copyWith((message) => updates(message as DashboardStatsResponse))
          as DashboardStatsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DashboardStatsResponse create() => DashboardStatsResponse._();
  @$core.override
  DashboardStatsResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DashboardStatsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DashboardStatsResponse>(create);
  static DashboardStatsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get activeUsers => $_getIZ(0);
  @$pb.TagNumber(1)
  set activeUsers($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasActiveUsers() => $_has(0);
  @$pb.TagNumber(1)
  void clearActiveUsers() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get activeTeams => $_getIZ(1);
  @$pb.TagNumber(2)
  set activeTeams($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasActiveTeams() => $_has(1);
  @$pb.TagNumber(2)
  void clearActiveTeams() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get totalBranches => $_getIZ(2);
  @$pb.TagNumber(3)
  set totalBranches($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTotalBranches() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotalBranches() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get pendingTasks => $_getIZ(3);
  @$pb.TagNumber(4)
  set pendingTasks($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPendingTasks() => $_has(3);
  @$pb.TagNumber(4)
  void clearPendingTasks() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get inProgressTasks => $_getIZ(4);
  @$pb.TagNumber(5)
  set inProgressTasks($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasInProgressTasks() => $_has(4);
  @$pb.TagNumber(5)
  void clearInProgressTasks() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get criticalTasks => $_getIZ(5);
  @$pb.TagNumber(6)
  set criticalTasks($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasCriticalTasks() => $_has(5);
  @$pb.TagNumber(6)
  void clearCriticalTasks() => $_clearField(6);
}

class UpdateTaskStatusRequest extends $pb.GeneratedMessage {
  factory UpdateTaskStatusRequest({
    $core.int? taskId,
    $core.String? status,
  }) {
    final result = create();
    if (taskId != null) result.taskId = taskId;
    if (status != null) result.status = status;
    return result;
  }

  UpdateTaskStatusRequest._();

  factory UpdateTaskStatusRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateTaskStatusRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateTaskStatusRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.personnel.v1'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'taskId')
    ..aOS(2, _omitFieldNames ? '' : 'status')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateTaskStatusRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateTaskStatusRequest copyWith(
          void Function(UpdateTaskStatusRequest) updates) =>
      super.copyWith((message) => updates(message as UpdateTaskStatusRequest))
          as UpdateTaskStatusRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateTaskStatusRequest create() => UpdateTaskStatusRequest._();
  @$core.override
  UpdateTaskStatusRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UpdateTaskStatusRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateTaskStatusRequest>(create);
  static UpdateTaskStatusRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get taskId => $_getIZ(0);
  @$pb.TagNumber(1)
  set taskId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTaskId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTaskId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get status => $_getSZ(1);
  @$pb.TagNumber(2)
  set status($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => $_clearField(2);
}

class DeleteResponse extends $pb.GeneratedMessage {
  factory DeleteResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  DeleteResponse._();

  factory DeleteResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'scarlet.operations.personnel.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteResponse copyWith(void Function(DeleteResponse) updates) =>
      super.copyWith((message) => updates(message as DeleteResponse))
          as DeleteResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteResponse create() => DeleteResponse._();
  @$core.override
  DeleteResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DeleteResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteResponse>(create);
  static DeleteResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class PersonnelServiceApi {
  final $pb.RpcClient _client;

  PersonnelServiceApi(this._client);

  /// --- Autenticación ---
  $async.Future<LoginResponse> loginUser(
          $pb.ClientContext? ctx, LoginRequest request) =>
      _client.invoke<LoginResponse>(
          ctx, 'PersonnelService', 'LoginUser', request, LoginResponse());

  /// --- Operaciones de Usuarios ---
  $async.Future<UserResponse> getUser(
          $pb.ClientContext? ctx, GetUserRequest request) =>
      _client.invoke<UserResponse>(
          ctx, 'PersonnelService', 'GetUser', request, UserResponse());
  $async.Future<ListUsersResponse> listAllUsers(
          $pb.ClientContext? ctx, ListUsersRequest request) =>
      _client.invoke<ListUsersResponse>(ctx, 'PersonnelService', 'ListAllUsers',
          request, ListUsersResponse());
  $async.Future<UserResponse> updateUser(
          $pb.ClientContext? ctx, UpdateUserRequest request) =>
      _client.invoke<UserResponse>(
          ctx, 'PersonnelService', 'UpdateUser', request, UserResponse());
  $async.Future<UserResponse> createUser(
          $pb.ClientContext? ctx, CreateUserRequest request) =>
      _client.invoke<UserResponse>(
          ctx, 'PersonnelService', 'CreateUser', request, UserResponse());
  $async.Future<DeleteResponse> deleteUser(
          $pb.ClientContext? ctx, DeleteUserRequest request) =>
      _client.invoke<DeleteResponse>(
          ctx, 'PersonnelService', 'DeleteUser', request, DeleteResponse());

  /// --- Disponibilidad y Telemetría ---
  $async.Future<UserResponse> updateDutyStatus(
          $pb.ClientContext? ctx, UpdateStatusRequest request) =>
      _client.invoke<UserResponse>(
          ctx, 'PersonnelService', 'UpdateDutyStatus', request, UserResponse());
  $async.Future<ReportLocationResponse> reportLocation(
          $pb.ClientContext? ctx, LocationUpdate request) =>
      _client.invoke<ReportLocationResponse>(ctx, 'PersonnelService',
          'ReportLocation', request, ReportLocationResponse());

  /// --- Habilidades ---
  $async.Future<SkillList> addUserSkill(
          $pb.ClientContext? ctx, SkillRequest request) =>
      _client.invoke<SkillList>(
          ctx, 'PersonnelService', 'AddUserSkill', request, SkillList());

  /// --- Estructura y Equipos ---
  $async.Future<TeamListResponse> listAllTeams(
          $pb.ClientContext? ctx, $0.Empty request) =>
      _client.invoke<TeamListResponse>(
          ctx, 'PersonnelService', 'ListAllTeams', request, TeamListResponse());
  $async.Future<UserListResponse> listUsersByTeam(
          $pb.ClientContext? ctx, ListUsersByTeamRequest request) =>
      _client.invoke<UserListResponse>(ctx, 'PersonnelService',
          'ListUsersByTeam', request, UserListResponse());
  $async.Future<TeamResponse> getTeamDetails(
          $pb.ClientContext? ctx, GetTeamRequest request) =>
      _client.invoke<TeamResponse>(
          ctx, 'PersonnelService', 'GetTeamDetails', request, TeamResponse());
  $async.Future<TeamResponse> createTeam(
          $pb.ClientContext? ctx, CreateTeamRequest request) =>
      _client.invoke<TeamResponse>(
          ctx, 'PersonnelService', 'CreateTeam', request, TeamResponse());
  $async.Future<TeamResponse> updateTeam(
          $pb.ClientContext? ctx, UpdateTeamRequest request) =>
      _client.invoke<TeamResponse>(
          ctx, 'PersonnelService', 'UpdateTeam', request, TeamResponse());
  $async.Future<DeleteResponse> deleteTeam(
          $pb.ClientContext? ctx, DeleteTeamRequest request) =>
      _client.invoke<DeleteResponse>(
          ctx, 'PersonnelService', 'DeleteTeam', request, DeleteResponse());
  $async.Future<UserResponse> assignUserToTeam(
          $pb.ClientContext? ctx, AssignRequest request) =>
      _client.invoke<UserResponse>(
          ctx, 'PersonnelService', 'AssignUserToTeam', request, UserResponse());

  /// --- Entidades e Instituciones ---
  $async.Future<InstitutionListResponse> listInstitutions(
          $pb.ClientContext? ctx, $0.Empty request) =>
      _client.invoke<InstitutionListResponse>(ctx, 'PersonnelService',
          'ListInstitutions', request, InstitutionListResponse());
  $async.Future<InstitutionResponse> getInstitution(
          $pb.ClientContext? ctx, GetInstitutionRequest request) =>
      _client.invoke<InstitutionResponse>(ctx, 'PersonnelService',
          'GetInstitution', request, InstitutionResponse());
  $async.Future<InstitutionResponse> createInstitution(
          $pb.ClientContext? ctx, CreateInstitutionRequest request) =>
      _client.invoke<InstitutionResponse>(ctx, 'PersonnelService',
          'CreateInstitution', request, InstitutionResponse());
  $async.Future<InstitutionResponse> updateInstitution(
          $pb.ClientContext? ctx, UpdateInstitutionRequest request) =>
      _client.invoke<InstitutionResponse>(ctx, 'PersonnelService',
          'UpdateInstitution', request, InstitutionResponse());
  $async.Future<DeleteResponse> deleteInstitution(
          $pb.ClientContext? ctx, DeleteInstitutionRequest request) =>
      _client.invoke<DeleteResponse>(ctx, 'PersonnelService',
          'DeleteInstitution', request, DeleteResponse());
  $async.Future<BranchListResponse> listBranches(
          $pb.ClientContext? ctx, ListBranchesRequest request) =>
      _client.invoke<BranchListResponse>(ctx, 'PersonnelService',
          'ListBranches', request, BranchListResponse());
  $async.Future<BranchResponse> createBranch(
          $pb.ClientContext? ctx, CreateBranchRequest request) =>
      _client.invoke<BranchResponse>(
          ctx, 'PersonnelService', 'CreateBranch', request, BranchResponse());
  $async.Future<BranchResponse> updateBranch(
          $pb.ClientContext? ctx, UpdateBranchRequest request) =>
      _client.invoke<BranchResponse>(
          ctx, 'PersonnelService', 'UpdateBranch', request, BranchResponse());
  $async.Future<DeleteResponse> deleteBranch(
          $pb.ClientContext? ctx, DeleteBranchRequest request) =>
      _client.invoke<DeleteResponse>(
          ctx, 'PersonnelService', 'DeleteBranch', request, DeleteResponse());

  /// --- Certificaciones y Habilidades ---
  $async.Future<CertificationListResponse> getUserCertifications(
          $pb.ClientContext? ctx, GetUserRequest request) =>
      _client.invoke<CertificationListResponse>(ctx, 'PersonnelService',
          'GetUserCertifications', request, CertificationListResponse());
  $async.Future<CertificationListResponse> addCertification(
          $pb.ClientContext? ctx, AddCertificationRequest request) =>
      _client.invoke<CertificationListResponse>(ctx, 'PersonnelService',
          'AddCertification', request, CertificationListResponse());
  $async.Future<SkillList> listUserSkills(
          $pb.ClientContext? ctx, GetUserRequest request) =>
      _client.invoke<SkillList>(
          ctx, 'PersonnelService', 'ListUserSkills', request, SkillList());

  /// --- Tareas (Tasks) ---
  $async.Future<TaskListResponse> listTasks(
          $pb.ClientContext? ctx, ListTasksRequest request) =>
      _client.invoke<TaskListResponse>(
          ctx, 'PersonnelService', 'ListTasks', request, TaskListResponse());
  $async.Future<TaskResponse> createTask(
          $pb.ClientContext? ctx, CreateTaskRequest request) =>
      _client.invoke<TaskResponse>(
          ctx, 'PersonnelService', 'CreateTask', request, TaskResponse());
  $async.Future<TaskResponse> updateTaskStatus(
          $pb.ClientContext? ctx, UpdateTaskStatusRequest request) =>
      _client.invoke<TaskResponse>(
          ctx, 'PersonnelService', 'UpdateTaskStatus', request, TaskResponse());

  /// --- Analítica / KPIs (lectura de Vista Materializada) ---
  $async.Future<DashboardStatsResponse> getDashboardStats(
          $pb.ClientContext? ctx, DashboardStatsRequest request) =>
      _client.invoke<DashboardStatsResponse>(ctx, 'PersonnelService',
          'GetDashboardStats', request, DashboardStatsResponse());
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
