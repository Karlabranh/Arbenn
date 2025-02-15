import 'package:arbenn/pages/calendar/components/_calendar_segmented_button.dart';
import 'package:arbenn/pages/calendar/components/_calendar_title.dart';
import 'package:flutter/material.dart';
import 'package:arbenn/data/event/event_data.dart';
import 'package:arbenn/components/event_summary.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  bool _showPastEvent = false;

  onSelectionChange(Set<bool> newSelection) {
    setState(() {
      _showPastEvent = newSelection.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AttendeEventsNotifier>(builder: (context, events, _) {
      final e = _showPastEvent
          ? events.value.then(
              (e) => e?.where((e) => e.date.isBefore(DateTime.now())).toList())
          : events.value.then(
              (e) => e?.where((e) => e.date.isAfter(DateTime.now())).toList());
      return FutureOptionEventSummaryView(
        events: e,
        numPlaceholders: 1,
        emptyText: _showPastEvent
            ? null
            : AppLocalizations.of(context)!.warning_message_no_attended_events,
        header: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const CalendarTitle(),
          CalendarSegmentedButton(
            onChange: onSelectionChange,
            showPastEvent: _showPastEvent,
          ),
          const SizedBox(height: 20),
        ]),
      );
    });
  }
}
