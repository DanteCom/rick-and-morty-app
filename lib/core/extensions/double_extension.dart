extension DoubleExtension on double {
  double range(double start, double end) {
    return ((this - start) / (end - start)).clamp(0.0, 1.0);
  }

  double lerp(double start, double end) {
    return start + (end - start) * this;
  }
}
