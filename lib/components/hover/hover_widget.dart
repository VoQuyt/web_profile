import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HoverScale extends StatefulWidget {
  HoverScale({super.key, required this.child, this.scale = 1.3});
  final Widget child;
  double scale;

  @override
  State<HoverScale> createState() => _HoverScaleState();
}

class _HoverScaleState extends State<HoverScale> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final hoverTransform = Matrix4.identity()..scale(widget.scale);
    final transform = isHover ? hoverTransform : Matrix4.identity();
    return MouseRegion(
      onEnter: (event) => onEntered(true),
      onExit: (event) => onEntered(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: transform,
        child: widget.child,
      ),
    );
  }

  void onEntered(bool isEnter) {
    setState(() {
      isHover = isEnter;
    });
  }
}

// ignore: must_be_immutable
class HoverTranslate extends StatefulWidget {
  const HoverTranslate({super.key, required this.child});
  final Widget child;

  @override
  State<HoverTranslate> createState() => _HoverTranslateState();
}

class _HoverTranslateState extends State<HoverTranslate> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final hoverTransform = Matrix4.identity()..translate(0, -5, 0);
    final transform = isHover ? hoverTransform : Matrix4.identity();
    return MouseRegion(
      onEnter: (event) => onEntered(true),
      onExit: (event) => onEntered(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: transform,
        child: widget.child,
      ),
    );
  }

  void onEntered(bool isEnter) {
    setState(() {
      isHover = isEnter;
    });
  }
}
