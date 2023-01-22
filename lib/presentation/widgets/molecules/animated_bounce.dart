import 'package:flutter/material.dart';

import '../../utils/utils.dart' show animationDuration;

class AnimatedBounce extends StatefulWidget {
  const AnimatedBounce({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  State<StatefulWidget> createState() => AnimatedBounceState();
}

class AnimatedBounceState extends State<AnimatedBounce>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: animationDuration,
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticInOut,
    );

    _controller.addListener(() {
      setState(() {});
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => ScaleTransition(
        scale: _scaleAnimation,
        child: widget.child,
      ),
    );
  }
}
