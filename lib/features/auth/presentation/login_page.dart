import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:scarlet_app/features/auth/presentation/providers/auth_controller.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _emailController = TextEditingController();
  bool _checking = false;
  String? _error;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    final email = _emailController.text.trim();
    if (email.isEmpty) {
      setState(() => _error = 'Ingrese su correo electrónico');
      return;
    }

    setState(() {
      _checking = true;
      _error = null;
    });

    try {
      await ref.read(authControllerProvider.notifier).loginWithEmail(email);
    } catch (e) {
      // C3: dispositivo nuevo — hace falta el código del authenticator (TOTP)
      // para registrar la clave de este dispositivo en el servidor.
      if (isNeedsTotpError(e)) {
        final code = await _promptTotp();
        if (code != null && code.isNotEmpty) {
          try {
            await ref.read(authControllerProvider.notifier)
                .loginWithEmail(email, totpCode: code);
          } catch (e2) {
            if (mounted) {
              setState(() {
                _checking = false;
                _error = e2.toString().replaceAll('Exception: ', '');
              });
            }
          }
        } else if (mounted) {
          setState(() {
            _checking = false;
            _error = 'Se requiere el código del authenticator para un dispositivo nuevo';
          });
        }
        return;
      }
      if (mounted) {
        setState(() {
          _checking = false;
          _error = e.toString().replaceAll('Exception: ', '');
        });
      }
    } finally {
      if (mounted) {
        setState(() => _checking = false);
      }
    }
  }

  /// Pide el código de 6 dígitos del authenticator (usado al registrar un
  /// dispositivo nuevo). Devuelve el código o null si se cancela.
  Future<String?> _promptTotp() {
    final ctrl = TextEditingController();
    return showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Dispositivo nuevo'),
        content: TextField(
          controller: ctrl,
          keyboardType: TextInputType.number,
          maxLength: 6,
          autofocus: true,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: const InputDecoration(
            labelText: 'Código del authenticator',
            hintText: '123456',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(ctx).pop(ctrl.text.trim()),
            child: const Text('Continuar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);
    final isLoading = _checking || authState.isLoading;

    // Show error from auth state
    if (authState.hasError && _error == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() {
            _error = authState.error.toString().replaceAll('Exception: ', '');
          });
        }
      });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Iniciar sesión',
          style: TextStyle(
            color: Color(0xFF656565),
            fontSize: 19,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w600,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4),
          child: Container(
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(width: 1, color: Colors.grey)),
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(50, 40, 50, 0),
        children: [
          const Image(
            height: 120,
            width: 120,
            image: AssetImage('assets/img/logos/cemento-base.png'),
          ),
          const SizedBox(height: 32),
          const Text(
            'Ingrese su correo electrónico',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF656565),
              fontFamily: 'DM Sans',
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: 295,
            child: TextField(
              controller: _emailController,
              cursorColor: Colors.black45,
              keyboardType: TextInputType.emailAddress,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[0-9a-zA-Z@.]')),
              ],
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'DM Sans',
              ),
              decoration: const InputDecoration(
                labelText: 'Correo electrónico',
              ),
              onSubmitted: (_) => _login(),
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 48,
            width: 290,
            child: ElevatedButton.icon(
              onPressed: isLoading ? null : _login,
              icon: const Icon(Icons.security, color: Colors.white, size: 22),
              label: isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Text(
                      'Ingresar con Identidad Digital',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'DM Sans',
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFA20E0E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          TextButton(
            onPressed: isLoading ? null : () => context.go('/register'),
            child: const Text(
              '¿No tiene identidad? Crear una',
              style: TextStyle(
                color: Color(0xFFDF8946),
                fontFamily: 'DM Sans',
                fontSize: 14,
              ),
            ),
          ),
          if (_error != null) ...[
            const SizedBox(height: 16),
            Text(
              _error!,
              style: const TextStyle(color: Color(0xFFA20E0E), fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ],
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
