import 'package:flustars/flustars.dart';
import 'package:flutter/foundation.dart';

class UsingModel extends ChangeNotifier {
  int _femaleUsing;
  int _manUsing;
  int _canjiUsing;

  int _todayFemale;
  int _todayMan;

  String _currentDate = DateUtil.formatDate(DateTime.now(), format: DataFormats.y_mo_d);

  get currentDate => _currentDate;

  get femaleUsing => _femaleUsing ?? 0;
  get manUsing => _manUsing ?? 0;
  get canjiUsing => _canjiUsing ?? 0;

  get todayFemale => SpUtil.getInt("todayFemale", defValue: 0);
  get todayMan => SpUtil.getInt("todayMan", defValue: 0);

  void changeFemaleUsing(String flag) {
    if ("1" == flag) {
      _femaleUsing = femaleUsing + 1;
      changeTodayFemale();
    } else if ("-1" == flag) {
      _femaleUsing = femaleUsing - 1;
    }
    notifyListeners();
  }

  void changeManUsing(String flag) {
    if ("1" == flag) {
      _manUsing = manUsing + 1;
      changeTodayMan();
    } else if ("-1" == flag) {
      _manUsing = manUsing - 1;
    }
    notifyListeners();
  }

  void clearTodayUse() {
    String time = DateUtil.formatDate(DateTime.now().toUtc().add(Duration(hours: 8)), format: DataFormats.y_mo_d);
    //不是同一天，清空今日总人数
    if (time != currentDate) {
      _todayFemale = 0;
      _todayMan = 0;
      SpUtil.putInt("todayFemale", 0);
      SpUtil.putInt("todayMan", 0);
      _currentDate = time;
      notifyListeners();
    }
  }

  void changeCanjiUsing(String flag) {
    if ("1" == flag) {
      _canjiUsing = canjiUsing + 1;
    } else if ("-1" == flag) {
      _canjiUsing = canjiUsing - 1;
    }
    notifyListeners();
  }

  void changeTodayFemale() {
      _todayFemale = todayFemale + 1;
      SpUtil.putInt("todayFemale", _todayFemale);
  }

  void testToday() {
    _todayFemale = todayFemale + 1;
    SpUtil.putInt("todayFemale", _todayFemale);
    notifyListeners();
  }

  void changeTodayMan() {
      _todayMan = todayMan + 1;
      SpUtil.putInt("todayMan", _todayMan);
  }
}
