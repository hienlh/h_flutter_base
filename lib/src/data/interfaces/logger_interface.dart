abstract class ILogger {
  void v(dynamic message);
  void d(dynamic message);
  void i(dynamic message);
  void w(dynamic message);
  void e(dynamic message);
  void long(dynamic message, [String tag = '']);
}
