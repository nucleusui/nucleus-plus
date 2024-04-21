import 'dart:math';
import 'dart:ui';

Color generateSoftColor(Random random) {
  int r = 150 + random.nextInt(56); // Red value between 150 and 205
  int g = 150 + random.nextInt(56); // Green value between 150 and 205
  int b = 150 + random.nextInt(56); // Blue value between 150 and 205
  return Color.fromRGBO(r, g, b, 1.0);
}
