import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnimationRoute extends PageRouteBuilder {
  final Widget child;
  AnimationRoute(this.child)
      : super(
            pageBuilder: (context, animation, secondaryAnimation) => child,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(
                      opacity: animation,
                      child: child,
                    ));
}
