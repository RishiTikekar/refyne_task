import 'package:flutter/material.dart';
import 'package:testassign/constants/enums.dart';

mixin StateNotifier on ChangeNotifier {
  States _currentState = States.none;

  States get currentState => _currentState;

  set currentState(States state) {
    _currentState = state;
    notifyListeners();
  }

  bool get isLoading => _currentState == States.loading;
}
