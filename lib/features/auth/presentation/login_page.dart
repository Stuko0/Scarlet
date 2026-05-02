import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'auth_controller.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _showPassword = false;
  bool _emailVerified = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onContinue() async {
    final email = _emailController.text.trim();
    if (email.isEmpty) {
      _showError('Ingrese su correo electrónico');
      return;
    }

    if (!_emailVerified) {
      // For now, go straight to password since our backend only has login
      setState(() {
        _emailVerified = true;
        _showPassword = true;
      });
      return;
    }

    // Login
    final password = _passwordController.text;
    if (password.isEmpty) {
      _showError('Ingrese su contraseña');
      return;
    }

    await ref.read(authControllerProvider.notifier).login(email, password);
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFFA20E0E)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withAlpha(50),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              const Icon(Icons.warning_amber_outlined,
                  color: Color(0xFFA20E0E), size: 32),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  message,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFA20E0E),
                  ),
                ),
              ),
            ],
          ),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);

    // Listen for errors
    ref.listen(authControllerProvider, (prev, next) {
      if (next.hasError) {
        _showError(next.error.toString().replaceAll('Exception: ', ''));
      }
      // Navigation is handled by GoRouter redirect — no manual push needed
    });

    final isLoading = authState.isLoading;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Iniciar sesión o registrarse',
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
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
            children: [
              Column(
                children: [
                  Image.asset(
                    'assets/img/logos/app-logo.png',
                    width: 313,
                    height: 350,
                  ),

                  // Email field
                  SizedBox(
                    width: 295,
                    child: TextField(
                      controller: _emailController,
                      cursorColor: Colors.black45,
                      keyboardType: TextInputType.emailAddress,
                      enabled: !_emailVerified,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp('[0-9a-zA-Z@.]')),
                      ],
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'DM Sans',
                      ),
                      decoration: const InputDecoration(
                        labelText: 'Correo electrónico',
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Password field (visible after email verified)
                  if (_showPassword)
                    SizedBox(
                      width: 295,
                      child: TextField(
                        controller: _passwordController,
                        cursorColor: Colors.black45,
                        obscureText: true,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp('[0-9a-zA-Z@.!#\$%^&*_]')),
                        ],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'DM Sans',
                        ),
                        decoration: const InputDecoration(
                          labelText: 'Contraseña',
                        ),
                        onSubmitted: (_) => _onContinue(),
                      ),
                    ),

                  const SizedBox(height: 16),

                  // Continue / Login button
                  SizedBox(
                    height: 44,
                    width: 290,
                    child: ElevatedButton(
                      onPressed: isLoading ? null : _onContinue,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFDF8946),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11),
                        ),
                      ),
                      child: isLoading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : Text(
                              _showPassword ? 'Iniciar sesión' : 'Continúa',
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'DM Sans',
                              ),
                            ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Branding footer
                  const Image(
                    height: 50,
                    width: 50,
                    image: AssetImage('assets/img/logos/cemento-base.png'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
