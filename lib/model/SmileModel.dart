import 'package:flustars/flustars.dart';
import 'package:flutter/foundation.dart';

class SmileModel extends ChangeNotifier {
  int _smileNum;
  int _normalNum;
  int _sadNum;

  //SmileModel(this._smileNum, this._normalNum, this._sadNum);

  get smileNum => _smileNum ?? SpUtil.getInt("smileNum", defValue: 0);
  get normalNum => _normalNum ?? SpUtil.getInt("normalNum", defValue: 0);
  get sadNum => _sadNum ?? SpUtil.getInt("sadNum", defValue: 0);

  get totalSatisNum => smileNum + normalNum + sadNum;

  void changeSmileNum() {
    int sm = smileNum;
    SpUtil.putInt("smileNum", sm+1);

    notifyListeners();
  }

  void changeNormalNum() {
    int n = normalNum;
    SpUtil.putInt("normalNum", n+1);

    notifyListeners();
  }

  void changeSadNum() {
    int s = sadNum;
    SpUtil.putInt("sadNum", s+1);

    notifyListeners();
  }
}