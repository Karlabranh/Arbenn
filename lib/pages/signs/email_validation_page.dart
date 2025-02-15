import 'package:akar_icons_flutter/akar_icons_flutter.dart';
import 'package:arbenn/data/user/authentication.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EmailValidationPage extends StatefulWidget {
  final int userId;

  const EmailValidationPage({
    super.key,
    required this.userId,
  });

  @override
  State<EmailValidationPage> createState() => _EmailValidationPageState();
}

class _EmailValidationPageState extends State<EmailValidationPage> {
  late bool _emailSent;

  @override
  void initState() {
    super.initState();
    _emailSent = false;
  }

  void _checkUserEmail(Timer _) async {
    await Provider.of<CredentialsNotifier>(context, listen: false)
        .value!
        .emailIsVerified()
        .then(
      (emailVerified) {
        if (emailVerified) {
          if (context.mounted) {
            final oldCreds =
                Provider.of<CredentialsNotifier>(context, listen: false).value!;
            Provider.of<CredentialsNotifier>(context, listen: false).value =
                Credentials(
                    userId: oldCreds.userId,
                    token: oldCreds.token,
                    verified: emailVerified);
          }
        }
      },
    );
  }

  void sendAgain() {
    Credentials? user =
        Provider.of<CredentialsNotifier>(context, listen: false).value;
    if (user != null) {
      user.sendEmailVerification();
      setState(() => _emailSent = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        color: Colors.blue,
        padding: const EdgeInsets.all(20),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                AkarIcons.envelope,
                size: 150,
                color: Colors.white,
              ),
              Text(
                AppLocalizations.of(context)!.account_verification_message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  decoration: null,
                ),
              ),
              const SizedBox(height: 80),
              if (!_emailSent)
                ElevatedButton(
                  onPressed: () => sendAgain(),
                  child: Text(AppLocalizations.of(context)!.send_again),
                )
            ],
          ),
        ),
      ),
    );
  }
}
