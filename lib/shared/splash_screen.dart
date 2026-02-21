import 'package:flutter/material.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/shared/widgets/waveform.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Image.asset(appIcon, width: 150, height: 150),
            const SizedBox(height: 8),
            const RandomWaveform(
              barCount: 24,
              barMaxHeight: 48,
              barSpacing: 3,
              barWidth: 3,
            ),
          ],
        ),
      ),
    );
  }
}
