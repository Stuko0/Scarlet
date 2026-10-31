import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:scarlet_app/features/auth/presentation/providers/auth_controller.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _ciController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _ciController.dispose();
    super.dispose();
  }

  void _onRegister() async {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final ci = _ciController.text.trim();

    if (name.isEmpty) {
      _showError('Ingrese su nombre completo');
      return;
    }
    if (email.isEmpty) {
      _showError('Ingrese su correo electrónico');
      return;
    }
    if (ci.isEmpty) {
      _showError('Ingrese su cédula de identidad');
      return;
    }

    await ref
        .read(authControllerProvider.notifier)
        .registerSSI(fullName: name, email: email, ci: ci);
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

    ref.listen(authControllerProvider, (prev, next) {
      if (next.hasError) {
        _showError(next.error.toString().replaceAll('Exception: ', ''));
      }
      // After successful registration, navigate to TOTP setup
      if (!next.hasError && next.valueOrNull != null && prev?.valueOrNull == null) {
        // Registration successful - go to TOTP setup
        final email = _emailController.text.trim();
        context.go('/totp-setup', extra: email);
      }
    });

    final isLoading = authState.isLoading;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF656565)),
          onPressed: () => context.go('/login'),
        ),
        title: const Text(
          'Crear Identidad Digital',
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
            padding: const EdgeInsets.fromLTRB(50, 20, 50, 0),
            children: [
              Column(
                children: [
                  const Image(
                    height: 120,
                    width: 120,
                    image: AssetImage('assets/img/logos/cemento-base.png'),
                  ),
                  const SizedBox(height: 24),

                  const Text(
                    'Se generará una identidad digital única (DID) para usted. '
                    'Esta identidad le permitirá autenticarse de forma segura.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF656565),
                      fontFamily: 'DM Sans',
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Name field
                  SizedBox(
                    width: 295,
                    child: TextField(
                      controller: _nameController,
                      cursorColor: Colors.black45,
                      keyboardType: TextInputType.name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'DM Sans',
                      ),
                      decoration: const InputDecoration(
                        labelText: 'Nombre completo',
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Email field
                  SizedBox(
                    width: 295,
                    child: TextField(
                      controller: _emailController,
                      cursorColor: Colors.black45,
                      keyboardType: TextInputType.emailAddress,
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
                  const SizedBox(height: 16),

                  // CI field
                  SizedBox(
                    width: 295,
                    child: TextField(
                      controller: _ciController,
                      cursorColor: Colors.black45,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                      ],
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'DM Sans',
                      ),
                      decoration: const InputDecoration(
                        labelText: 'Cédula de identidad',
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Register button
                  SizedBox(
                    height: 44,
                    width: 290,
                    child: ElevatedButton(
                      onPressed: isLoading ? null : _onRegister,
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
                          : const Text(
                              'Crear Identidad',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'DM Sans',
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
