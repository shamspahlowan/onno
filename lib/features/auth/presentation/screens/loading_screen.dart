import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  /// If [loop] is true, animation repeats forever.
  /// If false, provide a [progress] value (0.0 to 1.0).
  final bool loop;
  final double? progress;
  final double strokeWidth;
  final Color strokeColor;
  final Size size;

  const LoadingScreen({
    super.key,
    this.loop = true,
    this.progress,
    this.strokeWidth = 2.0,
    this.strokeColor = Colors.blueAccent,
    this.size = const Size(100, 100),
  });

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    if (widget.loop) {
      _controller.repeat();
    } else {
      _controller.value = widget.progress ?? 0.0;
    }
  }

  @override
  void didUpdateWidget(covariant LoadingScreen oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (!widget.loop && widget.progress != null) {
      _controller.value = widget.progress!.clamp(0.0, 1.0);
    }

    if (widget.loop && !_controller.isAnimating) {
      _controller.repeat();
    } else if (!widget.loop && _controller.isAnimating) {
      _controller.stop();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: widget.size,
      painter: _StrokePathPainter(
        _controller,
        strokeColor: widget.strokeColor,
        strokeWidth: widget.strokeWidth,
      ),
    );
  }
}

class _StrokePathPainter extends CustomPainter {
  final Animation<double> progress;
  final double strokeWidth;
  final Color strokeColor;

  _StrokePathPainter(
    this.progress, {
    required this.strokeColor,
    required this.strokeWidth,
  }) : super(repaint: progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = strokeColor
          ..strokeWidth = strokeWidth
          ..style = PaintingStyle.stroke;

    final path = _createPath();

    for (final metric in path.computeMetrics()) {
      final extractPath = metric.extractPath(0, metric.length * progress.value);
      canvas.drawPath(extractPath, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

Path _createPath() {
  final path = Path();
  path.moveTo(3.56238, 3.5545);
  path.cubicTo(5.06238, 2.5545, 10.1624, 0.654496, 18.5624, 1.0545);
  path.cubicTo(29.0624, 1.5545, 37.5624, 8.55449, 39.0624, 9.05449);
  path.cubicTo(40.5624, 9.55449, 44.0624, 4.05449, 54.5624, 2.05449);
  path.cubicTo(62.6372, 0.516424, 70.7429, 2.24345, 74.1713, 3.41582);
  path.cubicTo(74.4241, 3.50228, 74.6264, 3.69065, 74.7259, 3.93865);
  path.cubicTo(75.5831, 6.07514, 76.9375, 11.3027, 76.5624, 18.0545);
  path.cubicTo(76.1819, 24.9033, 71.8503, 34.1046, 69.4204, 38.4287);
  path.cubicTo(69.2085, 38.8058, 69.2572, 39.2707, 69.5221, 39.6126);
  path.cubicTo(71.0268, 41.554, 73.7655, 46.0856, 75.5624, 52.5545);
  path.cubicTo(78.0624, 61.5545, 75.5624, 72.0545, 74.5624, 74.5545);
  path.cubicTo(73.5624, 77.0545, 54.0624, 77.5545, 48.0624, 74.5545);
  path.cubicTo(42.0624, 71.5545, 39.0624, 69.5545, 39.0624, 69.0545);
  path.cubicTo(39.0624, 68.5545, 32.0624, 74.5545, 23.5624, 76.0545);
  path.cubicTo(15.0624, 77.5545, 5.06238, 75.5545, 3.56238, 74.5545);
  path.cubicTo(2.06238, 73.5545, -0.437624, 61.5545, 2.06238, 53.0545);
  path.cubicTo(4.56238, 44.5545, 8.56238, 40.0545, 9.06238, 39.0545);
  path.cubicTo(9.56238, 38.0545, 2.06238, 31.5545, 1.56238, 18.5545);
  path.cubicTo(1.16238, 8.15449, 2.72904, 4.22116, 3.56238, 3.5545);
  return path;
}
