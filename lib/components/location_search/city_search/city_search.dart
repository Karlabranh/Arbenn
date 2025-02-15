import 'package:arbenn/components/inputs.dart';
import 'package:arbenn/components/location_search/city_search/_city_search_results.dart';
import 'package:arbenn/components/overlay.dart';
import 'package:arbenn/components/scroller.dart';
import 'package:arbenn/data/locations_data.dart';
import 'package:flutter/material.dart' hide Autocomplete;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchCity extends StatefulWidget {
  final Function(City) onFinish;

  const SearchCity({
    required this.onFinish,
    super.key,
  });

  @override
  State<SearchCity> createState() => _SearchCityState();
}

class _SearchCityState extends State<SearchCity> {
  late Autocomplete<City> _autocomplete;

  @override
  void dispose() {
    _autocomplete.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _autocomplete = City.autocomplete;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FullPageOverlay(
      title: AppLocalizations.of(context)!.city,
      body: Stack(children: [
        Container(
            margin: const EdgeInsets.only(top: 70, bottom: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: StreamBuilder<List<City>>(
                stream: _autocomplete.stream,
                builder: (context, snapshot) {
                  return ScrollList(
                      children: snapshot.hasData
                          ? snapshot.data!
                              .map((c) => CitySearchResult(
                                    infos: c,
                                    onTap: () {
                                      widget.onFinish(c);
                                      Navigator.pop(context);
                                    },
                                  ))
                              .toList()
                          : []);
                })),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          margin: const EdgeInsets.only(top: 10),
          child: SearchInput(
            label: AppLocalizations.of(context)!.find_city,
            controller: _autocomplete.controller,
          ),
        ),
      ]),
    );
  }
}
