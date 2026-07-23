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

import 'inventory.pb.dart' as $1;
import 'inventory.pbjson.dart';

export 'inventory.pb.dart';

abstract class InventoryServiceBase extends $pb.GeneratedService {
  $async.Future<$1.Asset> createAsset(
      $pb.ServerContext ctx, $1.CreateAssetRequest request);
  $async.Future<$1.Asset> getAsset(
      $pb.ServerContext ctx, $1.GetAssetRequest request);
  $async.Future<$1.Asset> updateAssetStatus(
      $pb.ServerContext ctx, $1.UpdateAssetStatusRequest request);
  $async.Future<$1.ListAssetsResponse> listAssets(
      $pb.ServerContext ctx, $1.ListAssetsRequest request);
  $async.Future<$1.FleetAnalyticsResponse> getFleetAnalytics(
      $pb.ServerContext ctx, $0.Empty request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'CreateAsset':
        return $1.CreateAssetRequest();
      case 'GetAsset':
        return $1.GetAssetRequest();
      case 'UpdateAssetStatus':
        return $1.UpdateAssetStatusRequest();
      case 'ListAssets':
        return $1.ListAssetsRequest();
      case 'GetFleetAnalytics':
        return $0.Empty();
      default:
        throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx,
      $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'CreateAsset':
        return createAsset(ctx, request as $1.CreateAssetRequest);
      case 'GetAsset':
        return getAsset(ctx, request as $1.GetAssetRequest);
      case 'UpdateAssetStatus':
        return updateAssetStatus(ctx, request as $1.UpdateAssetStatusRequest);
      case 'ListAssets':
        return listAssets(ctx, request as $1.ListAssetsRequest);
      case 'GetFleetAnalytics':
        return getFleetAnalytics(ctx, request as $0.Empty);
      default:
        throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => InventoryServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
      get $messageJson => InventoryServiceBase$messageJson;
}
