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
    super.key,
    this.delay = 0,
    required this.child,
    this.enabled = true,
    this.delayDuration = 300,
    this.duration = 500,
    this.startY = 130,
  });

  @override
  Widget build(BuildContext context) {
    final tween = MovieTween()
      ..tween(_AniProps.opacity, 0.0.tweenTo(1.0),
          duration: duration.milliseconds)
      ..tween(_AniProps.translateY, startY.tweenTo(0.0),
          duration: duration.milliseconds);

    return PlayAnimationBuilder<Movie>(
      delay: Duration(milliseconds: (delayDuration * delay).round()),
      duration: tween.duration,
      tween: tween,
      builder: (context, value, child) => !enabled
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
    return PlayAnimationBuilder<double>(
      delay: delay,
      duration: duration.milliseconds,
      tween: 0.0.tweenTo(1.0),
      builder: (context, value, child) => Opacity(
        opacity: value,
        child: child,
      ),
      child: child,
    );
  }
}
