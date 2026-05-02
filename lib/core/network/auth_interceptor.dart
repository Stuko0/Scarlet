import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../storage/secure_storage.dart';

final authInterceptorProvider = Provider<AuthInterceptor>((ref) {
  return AuthInterceptor(ref);
});

class AuthInterceptor extends Interceptor {
  final Ref _ref;

  AuthInterceptor(this._ref);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final publicPaths = ['/api/v1/auth/login', '/api/v1/users'];
    final isPublic = publicPaths
        .any((path) => options.path == path && options.method == 'POST');

    if (!isPublic) {
      final storage = _ref.read(secureStorageProvider);
      final token = await storage.getToken();
      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final storage = _ref.read(secureStorageProvider);
      await storage.deleteToken();
    }
    handler.next(err);
  }
}
