import 'package:flutter/foundation.dart';

class TempModel extends ChangeNotifier {

  double _tempData;
  double _humData;
  double _nhData;
  int _pmData;

  get tempData => _tempData ?? 0.0;
  get humData => _humData ?? 0.0;
  get nhData => _nhData ?? 0.0;
  get pmData => _pmData ?? 0;

  void changeTempData(double tempData) {
    _tempData = tempData;
    notifyListeners();
  }

  void changeHumData(double humData) {
    _humData = humData;
    notifyListeners();
  }

  void changeNhData(double nhData) {
    _nhData = nhData;
    notifyListeners();
  }

  void changePmData(int pmData) {
    _pmData = pmData;
    notifyListeners();
  }
}