import 'package:capital24_2/src/bloc/login/LoginBloc.dart';
import 'package:flutter/material.dart';

class ProviderLogin extends InheritedWidget {
  static ProviderLogin? _instancia;

  factory ProviderLogin({Key? key, required Widget child}) {
    if (_instancia == null) {
      _instancia = ProviderLogin._internal(key: key, child: child);
    }
    return _instancia!;
  }

  ProviderLogin._internal({Key? key, required child})
      : super(key: key, child: child);

  final loginBloc = LoginBloc();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) =>
      true; //siempre se va a actualizar los streams

  static LoginBloc of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ProviderLogin>()!
        .loginBloc;
  }
}
