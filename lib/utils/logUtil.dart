
import 'package:xianlin_wc/utils/dioUtil.dart';

class LogUtils {
  
  final debug = false;

  DioUtils dioUtil = DioUtils();

  void log(String msg) {
    if(debug) {
      dioUtil.post(msg);
    }
  }
}