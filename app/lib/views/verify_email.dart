import 'dart:async';

import 'package:app/view_model/firebase_state.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({super.key});

  @override
  VerifyEmailPageState createState() => VerifyEmailPageState();
}

class VerifyEmailPageState extends State<VerifyEmailPage> {
  late Timer _verificationTimer;
  late Timer _countdownTimer;
  int _start = 30; // Timer duration in seconds
  bool _canResendEmail = false;
  String _email = '';
  late FirebaseState firebaseState;

  @override
  void initState() {
    super.initState();
    firebaseState = Provider.of<FirebaseState>(context, listen: false);
    _email = firebaseState.user!.email!;
    _sendEmailVerification();
    _startTimer();
    _checkEmailVerification();
  }

  Future<void> _sendEmailVerification() async {
    await firebaseState.user!.sendEmailVerification();
  }

  void _checkEmailVerification() {
    _verificationTimer =
        Timer.periodic(const Duration(seconds: 5), (timer) async {
      final currentUser = await firebaseState.reloadUser();

      if (currentUser!.emailVerified) {
        _verificationTimer.cancel();

        if (mounted) {
          context.go('/');
        }
      }
    });
  }

  @override
  void dispose() {
    _verificationTimer.cancel();
    _countdownTimer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start > 0) {
        setState(() {
          _start--;
        });
      } else {
        setState(() {
          _canResendEmail = true; // Enable resending email
          _countdownTimer.cancel();
        });
      }
    });
  }

  Future<void> _resendEmail() async {
    try {
      print('Resending email');
      final currentContext = context;
      await firebaseState.user!.sendEmailVerification();
      setState(() {
        _start = 30;
        _canResendEmail = false;
      });
      _startTimer(); // Restart the countdown timer
      if (currentContext.mounted) {
        ScaffoldMessenger.of(currentContext).showSnackBar(
          const SnackBar(content: Text('確認用のメールを再送信しました')),
        );
        print('Resending email from system');
      }
    } catch (e) {
      final currentContext = context;
      if (currentContext.mounted) {
        ScaffoldMessenger.of(currentContext).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Text(
              'Music Walk',
              style: ShadTheme.of(context).textTheme.h1,
            ),
          ),
          Text(_email, style: const TextStyle(fontSize: 18)),
          const SizedBox(height: 12),
          const Text('メールボックスを確認し、認証メールをご確認ください。'),
          const SizedBox(height: 12),
          if (_canResendEmail)
            SizedBox(
              width: double.infinity,
              child: ShadButton(
                onPressed: _resendEmail,
                child: const Text('メールを再送信'),
              ),
            )
          else
            Text('再送信可能まで: $_start 秒'),
        ],
      ),
    );
  }
}
