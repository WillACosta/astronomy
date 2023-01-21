import 'package:flutter/material.dart';

import 'package:animated_check/animated_check.dart';

class AnimatedCheckIcon extends StatefulWidget {
  const AnimatedCheckIcon({
    Key? key,
  }) : super(key: key);

  @override
  _AnimatedCheckIconState createState() => _AnimatedCheckIconState();
}

class _AnimatedCheckIconState extends State<AnimatedCheckIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  bool isVisible = true;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOutCirc,
      ),
    );

    _showCheck();

    Future.delayed(const Duration(seconds: 4)).then((_) => _resetCheck());
  }

  void _showCheck() {
    _animationController.forward();
  }

  void _resetCheck() {
    _animationController.reverse().then((value) {
      setState(() {
        isVisible = false;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      replacement: Row(),
      visible: isVisible,
      child: AnimatedCheck(
        progress: _animation,
        size: 30,
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
