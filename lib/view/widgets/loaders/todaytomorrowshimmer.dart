
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weatherapp_zeoptic/utils/apptextstyles.dart';
import 'package:weatherapp_zeoptic/view/widgets/froastedglassbox.dart';

class TodayTomorrw extends StatelessWidget {
  const TodayTomorrw({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 116, 174, 250),
      highlightColor: const Color.fromARGB(255, 156, 197, 250),
      child: FrostedGlassBox(
        width: size.width * 0.9,
        height: size.height * 0.12,
        child: const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Sunset', style: MyAppTextStyles.cardTitle),
                SizedBox(height: 8),
                Text('5:51PM', style: MyAppTextStyles.cardValue),
              ],
            ),
            SizedBox(width: 8),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Sunset', style: MyAppTextStyles.cardTitle),
                SizedBox(height: 8),
                Text('5:51PM', style: MyAppTextStyles.cardValue),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Sunset', style: MyAppTextStyles.cardTitle),
                SizedBox(height: 8),
                Text('5:51PM', style: MyAppTextStyles.cardValue),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
