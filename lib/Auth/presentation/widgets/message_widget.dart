import 'package:flutter/material.dart';
import 'package:solvers/core/global/fonts/app_fonts.dart';

import 'package:solvers/core/global/resources/color_manager.dart';

class MessageWidget extends StatelessWidget {
  final String message;
  final Color color;
  final bool isOwn;

  const MessageWidget({
    super.key,
    required this.message,
    required this.color,
    required this.isOwn,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: CustomPaint(
        painter: CustomChatBubble(
          color: color,
          isOwn: isOwn,
        ),
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Text(
            message,
            style: TextStyle(
              color: ColorManager.black,
              fontSize: FontSize.s18,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class CustomChatBubble extends CustomPainter {
  final Color color;
  final bool isOwn;

  CustomChatBubble({required this.color, required this.isOwn});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    Path paintBubbleTail() {
      Path? path;
      if (!isOwn) {
        path = Path()
          ..moveTo(5, size.height - 5)
          ..quadraticBezierTo(-5, size.height, -16, size.height - 4)
          ..quadraticBezierTo(-5, size.height - 5, 0, size.height - 17);
      }
      if (isOwn) {
        path = Path()
          ..moveTo(size.width - 6, size.height - 4)
          ..quadraticBezierTo(
              size.width + 5, size.height, size.width + 16, size.height - 4)
          ..quadraticBezierTo(
              size.width + 5, size.height - 5, size.width, size.height - 17);
      }
      return path!;
    }

    final RRect bubbleBody = RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        const Radius.circular(16));
    final Path bubbleTail = paintBubbleTail();

    canvas.drawRRect(bubbleBody, paint);
    canvas.drawPath(bubbleTail, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
