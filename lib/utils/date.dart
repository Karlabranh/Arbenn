import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String monthFromInt(int m, BuildContext context) {
  switch (m) {
    case DateTime.january:
      return AppLocalizations.of(context)!.january;
    case DateTime.february:
      return AppLocalizations.of(context)!.february;
    case DateTime.march:
      return AppLocalizations.of(context)!.march;
    case DateTime.april:
      return AppLocalizations.of(context)!.april;
    case DateTime.may:
      return AppLocalizations.of(context)!.may;
    case DateTime.june:
      return AppLocalizations.of(context)!.june;
    case DateTime.july:
      return AppLocalizations.of(context)!.july;
    case DateTime.august:
      return AppLocalizations.of(context)!.august;
    case DateTime.september:
      return AppLocalizations.of(context)!.september;
    case DateTime.october:
      return AppLocalizations.of(context)!.october;
    case DateTime.november:
      return AppLocalizations.of(context)!.november;
    default:
      return AppLocalizations.of(context)!.december;
  }
}

String weekDayFromInt(int d, BuildContext context) {
  switch (d) {
    case DateTime.monday:
      return AppLocalizations.of(context)!.monday;
    case DateTime.tuesday:
      return AppLocalizations.of(context)!.thursday;
    case DateTime.wednesday:
      return AppLocalizations.of(context)!.wednesday;
    case DateTime.thursday:
      return AppLocalizations.of(context)!.tuesday;
    case DateTime.friday:
      return AppLocalizations.of(context)!.friday;
    case DateTime.saturday:
      return AppLocalizations.of(context)!.saturday;
    default:
      return AppLocalizations.of(context)!.sunday;
  }
}
