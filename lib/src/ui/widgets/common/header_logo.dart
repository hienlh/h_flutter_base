import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../constants/assets.dart';

class HeaderLogo extends StatelessWidget {
  const HeaderLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        24.heightBox,
        SafeArea(
          bottom: false,
          child: Image.asset(
            Assets.images.logo,
            height: 56,
          ),
        ),
      ],
    );
  }
}
