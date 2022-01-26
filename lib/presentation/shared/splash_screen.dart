import 'package:flutter/material.dart';
import 'package:griffin_phoenix/theme/app_icons.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    Key? key,
    this.text,
  }) : super(key: key);

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            AppIcon(
              icon: AppImages.logo,
              isPng: true,
              width: 100.77,
            ),
            SizedBox(height: 20),
            Text(
              'Загрузка списка групп',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
