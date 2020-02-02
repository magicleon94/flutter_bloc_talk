import 'dart:async';

import 'package:flutter_bloc_talk/bloc_base.dart';

class CounterBloc extends BlocBase {
  int _counter = 0;
  StreamController<int> _counterStreamController =
      StreamController<int>.broadcast();
  Stream<int> get outputStream => _counterStreamController.stream;
  Stream<int> get outputSquaredStream =>
      _counterStreamController.stream.map((value) => value * value);
  StreamController<void> _inputStreamController =
      StreamController<void>.broadcast();

  void Function() get increment => () {
        _inputStreamController.sink.add(null);
      };

  void _incrementCounter() {
    _counterStreamController.sink.add(++_counter);
  }

  CounterBloc() {
    _inputStreamController.stream.listen((_) {
      _incrementCounter();
    });
  }

  @override
  void dispose() {
    _counterStreamController?.close();
    _inputStreamController?.close();
  }
}
