import 'package:flutter/material.dart' hide Action, State;

class Store<Action, State> extends ChangeNotifier {
  State _state;
  final State Function(State state, Action action) reducer;

  Store({@required State initialState, @required this.reducer})
      : _state = initialState;

  void dispatcher(Action action) {
    _state = reducer(state, action);
    notifyListeners();
  }

  State get state => _state;
}
