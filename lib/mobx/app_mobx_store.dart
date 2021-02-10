import 'package:mobx/mobx.dart';

class AppMobXStore {
  Observable<int> _counter;
  Action increment;

  AppMobXStore() {
    _counter = Observable<int>(0);
    increment = Action(_increment);
  }

  void _increment() {
    _counter.value++;
  }

  Observable<int> get counter => _counter;
}
