import 'dart:async';
import 'package:flutter/material.dart';
import 'package:scarlet_app/features/team_safety/domain/team_member_status.dart';

class DangerSelfCheckModal extends StatefulWidget {
  final String firefighterName;

  const DangerSelfCheckModal({super.key, required this.firefighterName});

  @override
  State<DangerSelfCheckModal> createState() => _DangerSelfCheckModalState();
}

class _DangerSelfCheckModalState extends State<DangerSelfCheckModal> {
  int _secondsLeft = 30;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;
      if (_secondsLeft > 0) {
        setState(() => _secondsLeft--);
      } else {
        _timer?.cancel();
        Navigator.pop(context, MemberStatus.danger);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: AlertDialog(
        backgroundColor: const Color(0xFF1E1E1E),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Row(
          children: [
            Icon(Icons.warning_amber, color: Color(0xFFF39C12), size: 28),
            SizedBox(width: 10),
            Text(
              '¿Estás bien?',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${widget.firefighterName}, has estado quieto por más de 5 minutos.',
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 12),
            Text(
              'Responde en $_secondsLeft s',
              style: TextStyle(
                color: _secondsLeft < 10 ? Colors.red : const Color(0xFFDF8946),
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              _timer?.cancel();
              Navigator.pop(context, MemberStatus.ok);
            },
            child: const Text('ESTOY BIEN'),
          ),
        ],
      ),
    );
  }
}
