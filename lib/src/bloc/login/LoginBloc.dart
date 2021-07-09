import 'dart:async';

import 'package:capital24_2/src/bloc/login/Validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators {
  final _usernameController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _usernameClienteController = BehaviorSubject<String>();
  final _passwordClienteController = BehaviorSubject<String>();

  //Recuperar los datos del Stream

  Stream<String> get usernameStream => _usernameController.stream
      .transform(validarUsername); //este rio lo que contiene son String
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(validarPassword);

  Stream<bool> get loginEmpleadoStream => Rx.combineLatest2(
      usernameStream, passwordStream, (e, p) => true); //validacion de boton

  Stream<String> get usernameClienteStream => _usernameClienteController.stream
      .transform(validarUsernameCliente); //este rio lo que contiene son String
  Stream<String> get passwordClienteStream =>
      _passwordClienteController.stream.transform(validarPasswordCliente);

  Stream<bool> get loginClienteStream => Rx.combineLatest2(
      usernameClienteStream,
      passwordClienteStream,
      (e, p) => true); //validacion de boton

  //Insertar valores al Stream
  Function(String) get changeUsername => _usernameController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;
  Function(String) get changeUsernameCliente =>
      _usernameClienteController.sink.add;
  Function(String) get changePasswordCliente =>
      _passwordClienteController.sink.add;

  //Obtener valor ingresado a las formas y streams

  String get username => _usernameController.value;
  String get password => _passwordController.value;
  String get usernameCliente => _usernameClienteController.value;
  String get passwordCliente => _passwordClienteController.value;

  //cerrar el rio

  dispose() {
    _usernameController.close();
    _passwordController.close();
    _usernameClienteController.close();
    _passwordClienteController.close();
  }
}
