import 'dart:async';

class Validators {
  final validarUsername = StreamTransformer<String, String>.fromHandlers(
      handleData: (username, sink) {
    if (username.length >= 18) {
      sink.add(username);
    } else {
      sink.addError("Ingresar 18 caracteres");
    }
  });

  final validarPassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length >= 11) {
      sink.add(password);
    } else {
      sink.addError("Ingresar 11 caracteres");
    }
  });

  final validarUsernameCliente = StreamTransformer<String, String>.fromHandlers(
      handleData: (usernameCliente, sink) {
    if (usernameCliente.length >= 8) {
      sink.add(usernameCliente);
    } else {
      sink.addError("Ingresar mas de 8 caracteres");
    }
  });

  final validarPasswordCliente = StreamTransformer<String, String>.fromHandlers(
      handleData: (passwordCliente, sink) {
    if (passwordCliente.length >= 9) {
      sink.add(passwordCliente);
    } else {
      sink.addError('Ingresar 8 caracteres');
    }
  });
}
