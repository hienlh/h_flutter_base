import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

enum _AniProps { opacity, translateY }

class FadeInTranslate extends StatelessWidget {
  final double delay;
  final int delayDuration;
  final int duration;
  final Widget child;
  final bool enabled;
  final double startY;

  FadeInTranslate({
    Key? key,
    this.delay = 0,
    required this.child,
    this.enabled = true,
    this.delayDuration = 300,
    this.duration = 500,
    this.startY = 130,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<_AniProps>()
      ..add(_AniProps.opacity, 0.0.tweenTo(1.0), duration.milliseconds)
      ..add(_AniProps.translateY, startY.tweenTo(0.0), duration.milliseconds);

    return PlayAnimation<MultiTweenValues<_AniProps>>(
      delay: Duration(milliseconds: (delayDuration * delay).round()),
      duration: tween.duration,
      tween: tween,
      builder: (context, child, value) => !enabled
          ? child!
          : Opacity(
              opacity: value.get(_AniProps.opacity),
              child: Transform.translate(
                offset: Offset(0, value.get(_AniProps.translateY)),
                child: child,
              ),
            ),
      child: child,
    );
  }
}

class FadeIn extends StatelessWidget {
  final Duration delay;
  final Widget child;
  final int duration;

  FadeIn(
      {this.delay = Duration.zero, required this.child, this.duration = 500});

  @override
  Widget build(BuildContext context) {
    return PlayAnimation<double>(
      delay: delay,
      duration: duration.milliseconds,
      tween: 0.0.tweenTo(1.0),
      builder: (context, child, value) => Opacity(
        opacity: value,
        child: child,
      ),
      child: child,
    );
  }
}
