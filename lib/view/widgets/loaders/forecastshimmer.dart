
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weatherapp_zeoptic/utils/appcolors.dart.dart';
import 'package:weatherapp_zeoptic/utils/appdimensions.dart';
import 'package:weatherapp_zeoptic/utils/apptextstyles.dart';

class ForecastShimmer extends StatelessWidget {
  const ForecastShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Shimmer.fromColors(
                baseColor:
                    const Color.fromARGB(255, 116, 174, 250),
                highlightColor:
                    const Color.fromARGB(255, 156, 197, 250),
                child: Container(
                  height: MyAppDimensions.buttonHeight,
                  decoration: BoxDecoration(
                    color: MyAppColors.buttonSelected,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Center(
                    child: Text(
                      'Today',
                      style: MyAppTextStyles.cardTitle,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Shimmer.fromColors(
                baseColor:
                    const Color.fromARGB(255, 116, 174, 250),
                highlightColor:
                    const Color.fromARGB(255, 156, 197, 250),
                child: Container(
                  height: MyAppDimensions.buttonHeight,
                  decoration: BoxDecoration(
                    color: MyAppColors.buttonUnselected,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Center(
                    child: Text(
                      'Next Days',
                      style: MyAppTextStyles.cardTitle,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 100,
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) => Shimmer.fromColors(
              baseColor: const Color.fromARGB(255, 116, 174, 250),
              highlightColor:
                  const Color.fromARGB(255, 156, 197, 250),
              child: Container(
                decoration: BoxDecoration(
                  color: MyAppColors.backgroundBottom,
                  borderRadius: BorderRadius.circular(15),
                ),
                width: 70,
                height: 100,
                margin: const EdgeInsets.symmetric(horizontal: 8),
              ),
            ),
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}
