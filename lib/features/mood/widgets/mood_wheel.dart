import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/theme/app_colors.dart';
import '../provider/mood_provider.dart';
import 'mood_emoji.dart';

/// Interactive circular mood wheel with gradient ring, tick marks,
/// draggable thumb, and centered emoji.
class MoodWheel extends StatelessWidget {
  const MoodWheel({super.key});

  static const double _wheelSize = 300;
  static const double _strokeWidth = 38;
  static const double _thumbRadius = 20;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MoodProvider>();
    const ringRadius = (_wheelSize - _strokeWidth) / 2;

    return GestureDetector(
      onPanStart: (details) => _onDrag(context, details.localPosition),
      onPanUpdate: (details) => _onDrag(context, details.localPosition),
      child: SizedBox(
        width: _wheelSize + _thumbRadius * 2,
        height: _wheelSize + _thumbRadius * 2,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Gradient ring + tick marks
            const CustomPaint(
              size: Size(_wheelSize, _wheelSize),
              painter: _MoodWheelPainter(),
            ),

            // Draggable thumb
            Positioned(
              left: (_wheelSize + _thumbRadius * 2) / 2 +
                  provider.thumbX(ringRadius) -
                  _thumbRadius,
              top: (_wheelSize + _thumbRadius * 2) / 2 +
                  provider.thumbY(ringRadius) -
                  _thumbRadius,
              child: Container(
                width: _thumbRadius * 2,
                height: _thumbRadius * 2,
                decoration: BoxDecoration(
                  color: AppColors.textPrimary.withValues(alpha: 0.85),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ),

            // Center emoji
            MoodEmoji(mood: provider.currentMood),
          ],
        ),
      ),
    );
  }

  void _onDrag(BuildContext context, Offset localPosition) {
    const center = Offset(
      (_wheelSize + _thumbRadius * 2) / 2,
      (_wheelSize + _thumbRadius * 2) / 2,
    );
    context.read<MoodProvider>().updateAngle(localPosition, center);
  }
}

/// Paints the gradient ring and tick marks matching the Figma design.
///
/// Gradient order (clockwise from 3 o'clock):
/// Teal → Lavender → Pink → Hot Pink → Orange → Yellow-Green → Teal
///
/// Tick marks only appear in the top-left and bottom-left quadrants.
class _MoodWheelPainter extends CustomPainter {
  const _MoodWheelPainter();

  static const double _strokeWidth = 38;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - _strokeWidth) / 2;

    _drawGradientRing(canvas, center, radius, size);
    _drawTickMarks(canvas, center, radius);
  }

  void _drawGradientRing(
    Canvas canvas,
    Offset center,
    double radius,
    Size size,
  ) {
    final rect = Rect.fromCircle(center: center, radius: radius);

    // SweepGradient starts at 3 o'clock (0 rad) and goes clockwise
    const gradient = SweepGradient(
      colors: [
        AppColors.moodTealLight, // 0.0  → 3 o'clock (right)
        AppColors.moodTeal,      // 0.10 → 4 o'clock
        AppColors.moodLavender,  // 0.25 → 6 o'clock (bottom)
        AppColors.moodPink,      // 0.40 → 8 o'clock
        AppColors.moodHotPink,   // 0.50 → 9 o'clock (left)
        AppColors.moodOrange,    // 0.65 → 11 o'clock
        AppColors.moodOrange,    // 0.75 → 12 o'clock (top)
        AppColors.moodYellowGreen, // 0.85 → 1 o'clock
        AppColors.moodTealLight, // 1.0  → back to 3 o'clock
      ],
      stops: [0.0, 0.10, 0.25, 0.40, 0.50, 0.65, 0.75, 0.85, 1.0],
    );

    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = _strokeWidth;

    // Draw as arc to avoid seam artifacts
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      0,
      2 * pi,
      false,
      paint,
    );
  }

  void _drawTickMarks(Canvas canvas, Offset center, double radius) {
    final tickPaint = Paint()
      ..color = AppColors.scaffold.withValues(alpha: 0.2)
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round;

    final innerRadius = radius - _strokeWidth / 2 + 3;
    final outerRadius = radius + _strokeWidth / 2 - 3;

    // Only draw ticks in the top-left and bottom-left quadrants
    // Top-left: angles ~2.1 to ~2.8 rad (120° to 160°)
    // Bottom-left: angles ~3.5 to ~4.2 rad (200° to 240°)
    const tickRanges = [
      (start: 2.1, end: 2.8, count: 4),
      (start: 3.5, end: 4.2, count: 4),
    ];

    for (final range in tickRanges) {
      final step = (range.end - range.start) / (range.count - 1);
      for (var i = 0; i < range.count; i++) {
        final angle = range.start + step * i;
        final start = Offset(
          center.dx + innerRadius * cos(angle),
          center.dy + innerRadius * sin(angle),
        );
        final end = Offset(
          center.dx + outerRadius * cos(angle),
          center.dy + outerRadius * sin(angle),
        );
        canvas.drawLine(start, end, tickPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
