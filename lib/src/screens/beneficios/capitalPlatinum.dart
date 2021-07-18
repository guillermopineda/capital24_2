import 'package:capital24_2/src/models/capitalBenefits/descuentosCapitalModel.dart';
import 'package:capital24_2/src/preferences/PreferenciasUsuario.dart';
import 'package:capital24_2/src/providers/capitalBenefits/DescuentosProvider.dart';
import 'package:capital24_2/src/widgets/appHamburguesaClienteEspejo.dart';
import 'package:capital24_2/src/widgets/appHamburguesaEmpleadoEspejo.dart';
import 'package:capital24_2/src/widgets/appNoLogin.dart';
import 'package:capital24_2/src/widgets/appTarjetaCapitalPlatinum.dart';
import 'package:flutter/material.dart';

class CapitalPlatinum extends StatefulWidget {
  static const String routeName = '/capitalPlatinum';

  _CapitalPlatinumState createState() => _CapitalPlatinumState();
}

class _CapitalPlatinumState extends State<CapitalPlatinum> {
  final _prefs = PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    if (_prefs.tipoUsuario == '') {
      return NoLogin();
    } else {
      return Scaffold(
          appBar: AppBar(
            title: Text("Muro Beneficios"),
            centerTitle: true,
            leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back)),
          ),
          endDrawer: usuarioHamburguesa(),
          backgroundColor: Theme.of(context).backgroundColor,
          body: SafeArea(
            bottom: true,
            maintainBottomViewPadding: true,
            child: Container(
              height: _screenSize.height * .85,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: _screenSize.height * .02,
                    ),
                    _beneficioEspecial(),
                  ],
                ),
              ),
            ),
          ));
    }
  }

  usuarioHamburguesa() {
    if (_prefs.tipoUsuario == 'empleado') {
      return HamburguesaEmpleadoEspejo();
    } else {
      return HamburguesaClienteEspejo();
    }
  }

  Widget _beneficioEspecial() {
    final _screenSize = MediaQuery.of(context).size;
    final descuentoProvider = DescuentosCapitalProvider();
    return FutureBuilder(
      future: descuentoProvider.getDescuentoPlatinum(),
      builder: (BuildContext context,
          AsyncSnapshot<List<DescuentoCapitalModel>> snapshot) {
        if (snapshot.hasData) {
          return AppTarjetasTdu(listaDescuentoModel: snapshot.data);
        } else {
          return Container(
            height: _screenSize.height * .85,
            child: Center(
                child: Image.asset(
              "images/load_2.gif",
            )),
          );
        }
      },
    );
  }
}
