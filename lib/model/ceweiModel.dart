import 'package:flutter/foundation.dart';

class CeweiModel extends ChangeNotifier {
  bool _hasPerson;

  get hasPersion => _hasPerson ?? false;

  void changeHashPersion(bool hasPerson) {
    _hasPerson = hasPerson;
    notifyListeners();
  }
}
