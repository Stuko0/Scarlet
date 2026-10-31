import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:scarlet_app/features/auth/data/totp_service.dart';

class TOTPVerifyPage extends ConsumerStatefulWidget {
  final String email;
  final VoidCallback onVerified;

  const TOTPVerifyPage({
    super.key,
    required this.email,
    required this.onVerified,
  });

  @override
  ConsumerState<TOTPVerifyPage> createState() => _TOTPVerifyPageState();
}

class _TOTPVerifyPageState extends ConsumerState<TOTPVerifyPage> {
  final _codeController = TextEditingController();
  bool _loading = false;
  String? _error;

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  Future<void> _verifyCode() async {
    final code = _codeController.text.trim();
    if (code.length != 6) {
      setState(() => _error = 'Ingrese un código de 6 dígitos');
      return;
    }

    setState(() {
      _loading = true;
      _error = null;
    });

    final totpService = ref.read(totpServiceProvider);
    final secret = await totpService.getSecret();

    if (secret == null) {
      setState(() {
        _loading = false;
        _error = 'No hay secreto TOTP configurado';
      });
      return;
    }

    final valid = await totpService.verifyCode(secret, code);

    setState(() {
      _loading = false;
      if (valid) {
        widget.onVerified();
        if (mounted) {
          GoRouter.of(context).go('/dashboard');
        }
      } else {
        _error = 'Código inválido. Intente nuevamente.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'Verificación 2FA',
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
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.security,
              size: 64,
              color: Color(0xFFA20E0E),
            ),
            const SizedBox(height: 24),
            const Text(
              'Ingrese el código de su app autenticador',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF656565),
                fontFamily: 'DM Sans',
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: 200,
              child: TextField(
                controller: _codeController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                maxLength: 6,
                autofocus: true,
                style: const TextStyle(
                  fontSize: 24,
                  letterSpacing: 8,
                  fontFamily: 'DM Sans',
                ),
                decoration: const InputDecoration(
                  counterText: '',
                  hintText: '000000',
                  hintStyle: TextStyle(letterSpacing: 8),
                ),
                onSubmitted: (_) => _verifyCode(),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _loading ? null : _verifyCode,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFA20E0E),
                minimumSize: const Size(200, 44),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11),
                ),
              ),
              child: _loading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Text(
                      'Verificar',
                      style: TextStyle(color: Colors.white, fontFamily: 'DM Sans'),
                    ),
            ),
            if (_error != null) ...[
              const SizedBox(height: 16),
              Text(
                _error!,
                style: const TextStyle(color: Color(0xFFA20E0E), fontSize: 14),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
