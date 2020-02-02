import 'package:flutter/material.dart';
import 'package:flutter_bloc_talk/bloc_base.dart';

class BlocProvider<T extends BlocBase> extends InheritedWidget {
  final T bloc;

  BlocProvider({this.bloc, Key key, Widget child})
      : super(key: key, child: child);
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static T of<T extends BlocBase>(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<BlocProvider<T>>().bloc;
  }
}
