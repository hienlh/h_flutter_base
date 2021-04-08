import 'package:flutter/material.dart';
import 'package:flutter_base/src/base/logger.dart';

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
                logger.e('123');
              },
              child: Text('log'),
            )
          ],
        ),
      ),
    );
  }
}
