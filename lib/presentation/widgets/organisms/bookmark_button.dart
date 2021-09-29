import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class AnimatedBookmarkButton extends StatefulWidget {
  const AnimatedBookmarkButton({
    Key? key,
    required this.onPressed,
    required this.isLiked,
  }) : super(key: key);

  final void Function() onPressed;
  final bool isLiked;

  @override
  _AnimatedBookmarkButtonState createState() => _AnimatedBookmarkButtonState();
}

class _AnimatedBookmarkButtonState extends State<AnimatedBookmarkButton>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  bool _isLiked = false;

  @override
  void initState() {
    super.initState();

    _isLiked = widget.isLiked;

    controller = AnimationController(
      duration: animationDuration,
      vsync: this,
    );

    scaleAnimation = Tween<double>(
      begin: 0.2,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0.35,
          0.7,
          curve: Curves.bounceOut,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void onTap() {
    if (controller.isAnimating) {
      return;
    }

    widget.onPressed();

    _handleIsLikeChanged();
  }

  void _handleIsLikeChanged() {
    setState(() {
      _isLiked = !_isLiked;

      controller.reset();
      controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                child: Transform.scale(
                  scale: ((_isLiked) && controller.isAnimating)
                      ? scaleAnimation.value
                      : 1.0,
                  child: SizedBox(
                    child: Icon(
                      _isLiked ? Icons.bookmark : Icons.bookmark_add_outlined,
                      size: 30,
                    ),
                    height: 30,
                    width: 30,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
