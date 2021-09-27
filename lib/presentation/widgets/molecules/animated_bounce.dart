import 'package:flutter/material.dart';

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
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 450,
      ),
    );

    scaleAnimation = CurvedAnimation(
      parent: controller,
      curve: Curves.elasticInOut,
    );

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  void dispose() {
    super.dispose();

    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: widget.child,
        ),
      ),
    );
  }
}
