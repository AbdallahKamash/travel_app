import 'package:flutter/material.dart';

class FadeRoute<T> extends PageRoute<T> {
  FadeRoute(this.child);
  @override
  // TODO: implement barrierColor
  Color get barrierColor => Colors.black;

  @override
  String? get barrierLabel => null;

  final Widget child;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);
}


late final Animation<Offset> _offsetAnimation = Tween<Offset>(
  begin: Offset.zero,
  end: const Offset(1.5, 0.0),
).animate(CurvedAnimation(
  parent: _controller,
  curve: Curves.elasticIn,
));