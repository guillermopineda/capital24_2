import 'package:capital24_2/src/preferences/PreferenciasUsuario.dart';
import 'package:capital24_2/src/widgets/appNoCliente.dart';
import 'package:capital24_2/src/widgets/appNoLogin.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class AccesoGPS extends StatefulWidget {
  static const String routeName = '/accesoGPS';

  @override
  _AccesoGPSState createState() => _AccesoGPSState();
}

class _AccesoGPSState extends State<AccesoGPS> with WidgetsBindingObserver {
  bool popup = false;
  @override
  void initState() {
    WidgetsBinding.instance?.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed && !popup) {
      if (await Permission.location.isGranted) {
        Navigator.pushReplacementNamed(context, '/loadingMapa');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final _prefs = PreferenciasUsuario();
    if (_prefs.tipoUsuario == '') {
      return NoLogin();
    } else {
      if (_prefs.tipoUsuario == 'cliente') {
        return NoCliente();
      } else {
        return Scaffold(
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Es necesario dar permisos para GPS al usar Registro"),
              MaterialButton(
                  child: Text('Solicitar Acceso',
                      style: TextStyle(color: Colors.white)),
                  color: Theme.of(context).primaryColor,
                  shape: StadiumBorder(),
                  elevation: 10.0,
                  splashColor: Colors.transparent,
                  onPressed: () async {
                    popup = true;
                    final status = await Permission.locationAlways.request();
                    await this.accesoGPS(status);
                    popup = false;
                  })
            ],
          )),
        );
      }
    }
  }

  Future accesoGPS(PermissionStatus status) async {
    print(status);
    switch (status) {
      case PermissionStatus.granted:
      case PermissionStatus.limited:
        await Navigator.pushReplacementNamed(context, '/loadingMapa');
        break;
      case PermissionStatus.denied:
      case PermissionStatus.restricted:
      case PermissionStatus.permanentlyDenied:
        openAppSettings();
    }
  }
}
