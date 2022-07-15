import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class BuildCircularPercentageIndicator extends StatelessWidget {
  final String? _centerText;
  final String? _bottomLabel;
  final double? _percentage;
  const BuildCircularPercentageIndicator({
    Key? key,
    String? centerText,
    String? bottomLabel,
    double? percentage,
  })  : _centerText = centerText,
        _bottomLabel = bottomLabel,
        _percentage = percentage,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CircularPercentIndicator(
        radius: 60.0,
        lineWidth: 10.0,
        animation: true,
        animationDuration: 500,
        percent: _percentage!,
        circularStrokeCap: CircularStrokeCap.round,
        progressColor: Theme.of(context).primaryColor,
        center: Text(
          _centerText!,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        footer: Text(
          _bottomLabel!,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
        ),
      ),
    );
  }
}
