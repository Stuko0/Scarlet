import 'dart:async';
import 'package:grpc/grpc.dart';
import 'package:grpc/grpc_web.dart';
import 'package:scarlet_app/generated/grpc/protos/personnel.pb.dart';

/// gRPC-web client channel connected to Envoy Gateway.
class GrpcClient {
  final GrpcWebClientChannel channel;

  GrpcClient({String host = 'api.stuko.dev', int port = 443})
      : channel = GrpcWebClientChannel.xhr(Uri.parse('https://$host:$port'));

  PersonnelServiceGrpc get personnel => PersonnelServiceGrpc(channel);
  void dispose() => channel.shutdown();
}

/// Client stubs for PersonnelService.
/// Each method maps to a gRPC call via Envoy gRPC-web filter.
class PersonnelServiceGrpc {
  final GrpcWebClientChannel _channel;
  PersonnelServiceGrpc(this._channel);

  static final _login = ClientMethod<LoginRequest, LoginResponse>(
    '/scarlet.operations.personnel.v1.PersonnelService/LoginUser',
    (req) => req.writeToBuffer(),
    (data) => LoginResponse.fromBuffer(data),
  );

  static final _getUser = ClientMethod<GetUserRequest, UserResponse>(
    '/scarlet.operations.personnel.v1.PersonnelService/GetUser',
    (req) => req.writeToBuffer(),
    (data) => UserResponse.fromBuffer(data),
  );

  Future<LoginResponse> login(String email, String password) async {
    final call = _channel.createCall(
      _login,
      Stream.value(LoginRequest()..email = email..password = password),
      WebCallOptions(),
    );
    return await call.response.first;
  }

  Future<UserResponse> getUser(int userId) async {
    final call = _channel.createCall(
      _getUser,
      Stream.value(GetUserRequest()..userId = userId),
      WebCallOptions(),
    );
    return await call.response.first;
  }
}
