
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp_zeoptic/blocs/weatherbloc/weather_bloc.dart';
import 'package:weatherapp_zeoptic/utils/appcolors.dart.dart';
import 'package:weatherapp_zeoptic/utils/apptextstyles.dart';

class MySearchBar extends StatefulWidget {
  const MySearchBar({
    super.key,
    required this.size,
    required this.locationText,
  });

  final Size size;
  final TextEditingController locationText;

  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
      child: Row(
        children: [
          SizedBox(
            width: widget.size.width * 0.75,
            child: TextField(
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              style: MyAppTextStyles.subtitle.copyWith(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              onTap: () {
                print('tapped');
              },
              controller: widget.locationText,
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                labelStyle: MyAppTextStyles.subtitle,
                labelText: 'Search by City',
                enabledBorder:
                    OutlineInputBorder(borderSide: BorderSide.none),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: MyAppColors.forecastText),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              if (key.currentState!.validate()) {
                print('searched');
                FocusScope.of(context).unfocus();
                BlocProvider.of<WeatherBloc>(context)
                    .add(SearchCurrentWeather(city: widget.locationText.text));
                widget.locationText.clear();
              }
            },
            icon: const Icon(Icons.search),
            color: MyAppColors.forecastText,
          ),
        ],
      ),
    );
  }
}
