import 'package:capital24_2/src/widgets/appHamburguesaEmpleadoEspejo.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Beneficios extends StatelessWidget {
  static const String routeName = '/beneficios';
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Beneficios"),
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
        child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: _screenSize.height * .03,
                  ),
                  _cardcapitalapp(context),
                  SizedBox(
                    height: _screenSize.height * .03,
                  ),
                  _cardAsismed(context),
                  SizedBox(
                    height: _screenSize.height * .03,
                  ),
                ],
              ),
            ]),
      ),
    );
  }

  usuarioHamburguesa() {
    //if (_prefs.tipoUsuario == 'empleado') {
    if (1 > 0) {
      return HamburguesaEmpleadoEspejo();
    } else {
      return; //HamburguesaClienteEspejo();
    }
  }

  Widget _cardcapitalapp(BuildContext context) {
    return Container(
        height: 80.0,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(
                  Icons.fastfood,
                  color: Theme.of(context).dividerColor,
                ),
                title: Text(
                  "Descuentos y promociones",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                ),
                trailing: new Icon(
                  Icons.arrow_forward_ios,
                  color: Theme.of(context).dividerColor,
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/capitalBenefits');
                  //_location();
                },
              )
            ],
          ),
          elevation: 40.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        ));
  }

  Widget _cardAsismed(BuildContext context) {
    return Container(
        height: 80.0,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                  leading: Icon(
                    FontAwesomeIcons.clinicMedical,
                    color: Theme.of(context).dividerColor,
                  ),
                  title: Text(
                    "Conecta con servicios médicos",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                  ),
                  trailing: new Icon(
                    Icons.arrow_forward_ios,
                    color: Theme.of(context).dividerColor,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/asismed');
                  })
            ],
          ),
          elevation: 40.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        ));
  }
}
