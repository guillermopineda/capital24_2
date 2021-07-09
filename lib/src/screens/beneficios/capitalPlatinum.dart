import 'package:capital24_2/src/models/capitalBenefits/capitalPlatinumModel.dart';
import 'package:capital24_2/src/preferences/PreferenciasUsuario.dart';
import 'package:capital24_2/src/providers/capitalBenefits/CapitalPlatinumProvider.dart';
import 'package:capital24_2/src/widgets/appHamburguesaClienteEspejo.dart';
import 'package:capital24_2/src/widgets/appHamburguesaEmpleadoEspejo.dart';
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

    return Scaffold(
        appBar: AppBar(
          title: Text("Capital Platinum"),
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

  usuarioHamburguesa() {
    if (_prefs.tipoUsuario == 'empleado') {
      return HamburguesaEmpleadoEspejo();
    } else {
      return HamburguesaClienteEspejo();
    }
  }

  Widget _beneficioEspecial() {
    final _screenSize = MediaQuery.of(context).size;
    final hotDealProvider = ListaHotDealsProvider();
    return FutureBuilder(
      future: hotDealProvider.getHotDeal(),
      builder: (BuildContext context,
          AsyncSnapshot<List<DirectorioModel>> snapshot) {
        if (snapshot.hasData) {
          return AppTarjetasTdu(listaHotDealsModel: snapshot.data);
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
