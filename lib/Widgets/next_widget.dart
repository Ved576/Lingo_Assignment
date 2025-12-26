import 'package:flutter/material.dart';

class ArrowButton extends StatefulWidget {
  final VoidCallback onTap;
  final Color iconColor;
  final Color buttonBgColor;

  const ArrowButton({
    super.key,
    required this.onTap,
    required this.iconColor,
    required this.buttonBgColor,
  });

  @override
  State<ArrowButton> createState() => _ArrowButtonState();
}

class _ArrowButtonState extends State<ArrowButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.9).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    _controller.forward().then((_) => _controller.reverse());
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          width: 78,
          height: 78,
          decoration: BoxDecoration(
            color: widget.buttonBgColor,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Icon(
            Icons.arrow_forward_rounded,
            color: widget.iconColor,
            size: 35,
          ),
        ),
      ),
    );
  }
}