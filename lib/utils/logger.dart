// ignore_for_file: avoid_print

const isDebug = true;

class Log {
  static d(String tag, String? log) {
    if (isDebug) {
      print("D: $tag\t\t$log");
    }
  }
}
