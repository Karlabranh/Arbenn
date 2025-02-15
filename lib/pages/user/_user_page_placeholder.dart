import 'package:arbenn/components/placeholders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfilePagePlaceholder extends StatelessWidget {
  final bool backButton;
  final bool editButton;

  const ProfilePagePlaceholder({
    super.key,
    this.backButton = false,
    this.editButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return TickingBuilder(
      builder: (context, tick) => Text(AppLocalizations.of(context)!.loading),
    );
  }
}
