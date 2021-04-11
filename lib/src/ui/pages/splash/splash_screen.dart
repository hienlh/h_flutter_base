import 'package:flutter/material.dart';
import '../../../base/logger.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Loading...'),
            TextButton(
              onPressed: () {
                logger.long('123');
              },
              child: Text('log'),
            )
          ],
        ),
      ),
    );
  }
}
