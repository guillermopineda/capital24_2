import 'package:capital24_2/src/helpers/helpers.dart';
import 'package:capital24_2/src/models/informacionLaboralModel.dart';
import 'package:capital24_2/src/preferences/PreferenciasUsuario.dart';
import 'package:capital24_2/src/providers/InformacionLaboralProvider.dart';
import 'package:capital24_2/src/providers/login/Provider.dart';
import 'package:capital24_2/src/screens/home/homeEmpleado.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HamburguesaEmpleadoEspejo extends StatefulWidget {
  _HamburguesaEmpleadoEspejoState createState() =>
      _HamburguesaEmpleadoEspejoState();
  final DatoLaboralEmpleadoModel? datoLaboralEmpleadoModel;
  HamburguesaEmpleadoEspejo({this.datoLaboralEmpleadoModel});
}

class _HamburguesaEmpleadoEspejoState extends State<HamburguesaEmpleadoEspejo> {
  final _prefs = PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    final bloc = ProviderLogin.of(context);
    return FutureBuilder(
        future: datoLaboralEmpleadoProvider.getDatoLaboral(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Drawer(
              elevation: 40.0,
              child: ListView(
                children: <Widget>[
                  DrawerHeader(
                    child: Container(),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/menu_header.png'),
                            fit: BoxFit.cover)),
                  ),
                  ListTile(
                      title: Text("Inicio"),
                      leading: Icon(
                        Icons.keyboard_arrow_left,
                        color: Theme.of(context).dividerColor,
                      ),
                      trailing: Icon(
                        FontAwesomeIcons.home,
                        color: Theme.of(context).dividerColor,
                      ),
                      onTap: () {
                        Navigator.pushReplacement(context,
                            navegarMapaFadeIn(context, HomeEmpleado()));
                      }),
                  Divider(
                    height: 10.0,
                  ),
                  ListTile(
                      title: Text("Información Personal"),
                      leading: Icon(
                        Icons.keyboard_arrow_left,
                        color: Theme.of(context).dividerColor,
                      ),
                      trailing: Icon(
                        FontAwesomeIcons.addressBook,
                        color: Theme.of(context).dividerColor,
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/informacionPersonal');
                      }),
                  Divider(
                    height: 10.0,
                  ),
                  ListTile(
                      title: Text("Información Laboral"),
                      leading: Icon(
                        Icons.keyboard_arrow_left,
                        color: Theme.of(context).dividerColor,
                      ),
                      trailing: Icon(
                        FontAwesomeIcons.folderOpen,
                        color: Theme.of(context).dividerColor,
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/informacionLaboral');
                      }),
                  Divider(
                    height: 10.0,
                  ),
                  ListTile(
                      title: Text("Mis Pagos"),
                      leading: Icon(
                        Icons.keyboard_arrow_left,
                        color: Theme.of(context).dividerColor,
                      ),
                      trailing: Icon(
                        FontAwesomeIcons.donate,
                        color: Theme.of(context).dividerColor,
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/nomina');
                      }),
                  Divider(
                    height: 10.0,
                  ),
                  mostrarOtrosEspejo(context, snapshot),
                  ListTile(
                      title: Text("Kardex"),
                      leading: Icon(
                        Icons.keyboard_arrow_left,
                        color: Theme.of(context).dividerColor,
                      ),
                      trailing: Icon(
                        FontAwesomeIcons.calendarCheck,
                        color: Theme.of(context).dividerColor,
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/kardexEmpleado');
                      }),
                  Divider(
                    height: 10.0,
                  ),
                  // ListTile(
                  //     title: Text("Conexión Remota"),
                  //     leading: Icon(
                  //       Icons.keyboard_arrow_left,
                  //       color: Theme.of(context).dividerColor,
                  //     ),
                  //     trailing: Icon(
                  //       FontAwesomeIcons.mapMarkedAlt,
                  //       color: Theme.of(context).dividerColor,
                  //     ),
                  //     onTap: () {
                  //       Navigator.pushNamed(context, '/conexionRemota');
                  //     }),
                  // Divider(
                  //   height: 10.0,
                  // ),
                  ListTile(
                      title: Text("Beneficios"),
                      leading: Icon(
                        Icons.keyboard_arrow_left,
                        color: Theme.of(context).dividerColor,
                      ),
                      trailing: Icon(
                        FontAwesomeIcons.gift,
                        color: Theme.of(context).dividerColor,
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/beneficios');
                      }),
                  Divider(
                    height: 10.0,
                  ),
                  ListTile(
                      title: Text("Atención a Clientes"),
                      leading: Icon(
                        Icons.keyboard_arrow_left,
                        color: Theme.of(context).dividerColor,
                      ),
                      trailing: Icon(
                        FontAwesomeIcons.commentDots,
                        color: Theme.of(context).dividerColor,
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/atencionClientes');
                      }),
                  Divider(
                    height: 10.0,
                  ),
                  ListTile(
                      title: Text("Cerrar Sesión"),
                      leading: Icon(
                        Icons.keyboard_arrow_left,
                        color: Theme.of(context).dividerColor,
                      ),
                      trailing: Icon(
                        FontAwesomeIcons.powerOff,
                        color: Theme.of(context).dividerColor,
                      ),
                      onTap: () {
                        _prefs.deletePrefs();
                        bloc.changeUsername("                  ");
                        bloc.changePassword("                  ");
                        Navigator.pushNamedAndRemoveUntil(context,
                            '/loginInicio', (Route<dynamic> route) => false);
                      }),
                  Divider(
                    height: 10.0,
                  ),
                ],
              ),
            );
          } else {
            return Center(
                child: Image.asset(
              "images/load_2.gif",
            ));
          }
        });
  }

  mostrarOtrosEspejo(BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.data.mostrarOtros == "N") {
      return SizedBox(
        height: .1,
      );
    } else {
      return Column(children: [
        ListTile(
            title: new Text('Otros'),
            leading: new Icon(
              Icons.keyboard_arrow_left,
              color: Theme.of(context).dividerColor,
            ),
            trailing: new Icon(
              FontAwesomeIcons.calculator,
              color: Theme.of(context).dividerColor,
            ),
            onTap: () {
              Navigator.pushNamed(context, '/otros');
            }),
        Divider(
          height: 10,
        )
      ]);
    }
  }
}
