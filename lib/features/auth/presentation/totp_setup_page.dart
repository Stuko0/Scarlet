import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:scarlet_app/features/auth/data/totp_service.dart';
import 'package:scarlet_app/features/auth/presentation/providers/auth_controller.dart';

class TOTPSetupPage extends ConsumerStatefulWidget {
  final String email;
  final String? initialSecret;

  const TOTPSetupPage({
    super.key,
    required this.email,
    this.initialSecret,
  });

  @override
  ConsumerState<TOTPSetupPage> createState() => _TOTPSetupPageState();
}

class _TOTPSetupPageState extends ConsumerState<TOTPSetupPage> {
  late String _secret;
  final _codeController = TextEditingController();
  final _manualSecretController = TextEditingController();
  bool _verified = false;
  bool _loading = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _secret = widget.initialSecret ?? '';
  }

  @override
  void dispose() {
    _codeController.dispose();
    _manualSecretController.dispose();
    super.dispose();
  }

  Future<void> _generateNewSecret() async {
    final totpService = ref.read(totpServiceProvider);
    setState(() {
      _secret = totpService.generateSecret();
      _verified = false;
      _error = null;
    });
  }

  Future<void> _submitManualSecret() async {
    final secret = _manualSecretController.text.trim().toUpperCase().replaceAll(' ', '');
    if (secret.isEmpty) {
      setState(() => _error = 'Ingrese su secreto TOTP');
      return;
    }
    if (!RegExp(r'^[A-Z2-7]+$').hasMatch(secret)) {
      setState(() => _error = 'Secreto inválido. Use solo letras A-Z y números 2-7');
      return;
    }
    setState(() {
      _secret = secret;
      _verified = false;
      _error = null;
    });
  }

  Future<void> _verifyCode() async {
    if (_secret.isEmpty) {
      setState(() => _error = 'Genere un secreto primero');
      return;
    }

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
    final valid = await totpService.verifyCode(_secret, code);

    setState(() {
      _loading = false;
      if (valid) {
        _verified = true;
      } else {
        _error = 'Código inválido. Verifique la hora de su dispositivo.';
      }
    });
  }

  Future<void> _completeSetup() async {
    if (!_verified) return;

    final totpService = ref.read(totpServiceProvider);
    await totpService.saveSecret(_secret);
    await totpService.setEnabled(true);

    if (mounted) {
      // After TOTP setup, complete SSI login (hidrata el perfil real).
      try {
        final authController = ref.read(authControllerProvider.notifier);
        await authController.loginSSI();
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('No se pudo iniciar sesión: $e')),
          );
        }
        return;
      }
      if (mounted) {
        context.go('/dashboard');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final totpService = ref.watch(totpServiceProvider);
    final uri = _secret.isNotEmpty
        ? totpService.getOtpAuthUri(_secret, widget.email)
        : '';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF656565)),
          onPressed: () => Navigator.of(context).pop(false),
        ),
        title: const Text(
          'Configurar Autenticador',
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // Option tabs
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => setState(() => _secret = ''),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _secret.isEmpty ? const Color(0xFFDF8946) : Colors.grey.shade300,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text(
                      'Nuevo',
                      style: TextStyle(
                        color: _secret.isEmpty ? Colors.white : Colors.grey.shade600,
                        fontFamily: 'DM Sans',
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => setState(() => _secret = ''),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _secret.isNotEmpty ? const Color(0xFFDF8946) : Colors.grey.shade300,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text(
                      'Tengo secreto',
                      style: TextStyle(
                        color: _secret.isNotEmpty ? Colors.white : Colors.grey.shade600,
                        fontFamily: 'DM Sans',
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Manual secret input (always available)
            if (_secret.isEmpty) ...[
              const Icon(Icons.key, size: 48, color: Color(0xFFDF8946)),
              const SizedBox(height: 16),
              const Text(
                'Ingrese su secreto TOTP',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF656565),
                  fontFamily: 'DM Sans',
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Encuéntrelo en su app autenticador o use el código de respaldo',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFF999999),
                  fontFamily: 'DM Sans',
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: 280,
                child: TextField(
                  controller: _manualSecretController,
                  cursorColor: Colors.black45,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'monospace',
                    letterSpacing: 2,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Secreto (base32)',
                    hintText: 'JBSWY3DPEHPK3PXP',
                    hintStyle: TextStyle(letterSpacing: 2),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submitManualSecret,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFDF8946),
                  minimumSize: const Size(200, 44),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11),
                  ),
                ),
                child: const Text(
                  'Usar este secreto',
                  style: TextStyle(color: Colors.white, fontFamily: 'DM Sans'),
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: _generateNewSecret,
                child: const Text(
                  'O generar uno nuevo',
                  style: TextStyle(
                    color: Color(0xFFDF8946),
                    fontFamily: 'DM Sans',
                    fontSize: 13,
                  ),
                ),
              ),
            ],

            // QR Code (when secret is set)
            if (_secret.isNotEmpty) ...[
              const Text(
                'Escaneé el código QR con su app autenticador\n(Google Authenticator, Authy, etc.)',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF656565),
                  fontFamily: 'DM Sans',
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withAlpha(30),
                      spreadRadius: 2,
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: QrImageView(
                  data: uri,
                  version: QrVersions.auto,
                  size: 200,
                  backgroundColor: Colors.white,
                ),
              ),
            ],

            if (_secret.isNotEmpty && !_verified) ...[
              const SizedBox(height: 16),
              const Text(
                'Ingrese el código de 6 dígitos de su app autenticador:',
                style: TextStyle(fontSize: 14, color: Color(0xFF656565)),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: 200,
                child: TextField(
                  controller: _codeController,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  maxLength: 6,
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
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _loading ? null : _verifyCode,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFDF8946),
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
                        style: TextStyle(color: Colors.white),
                      ),
              ),
            ],

            if (_verified) ...[
              const SizedBox(height: 16),
              const Icon(Icons.check_circle, color: Colors.green, size: 48),
              const SizedBox(height: 8),
              const Text(
                'Verificado correctamente',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _completeSetup,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFA20E0E),
                  minimumSize: const Size(200, 44),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11),
                  ),
                ),
                child: const Text(
                  'Completar Configuración',
                  style: TextStyle(color: Colors.white, fontFamily: 'DM Sans'),
                ),
              ),
            ],

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
