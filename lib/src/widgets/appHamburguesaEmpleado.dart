import 'package:capital24_2/src/models/informacionLaboralModel.dart';
import 'package:capital24_2/src/preferences/PreferenciasUsuario.dart';
import 'package:capital24_2/src/providers/InformacionLaboralProvider.dart';
import 'package:capital24_2/src/providers/login/Provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HamburguesaEmpleado extends StatefulWidget {
  _HamburguesaEmpleadoState createState() => _HamburguesaEmpleadoState();
  final DatoLaboralEmpleadoModel? datoLaboralEmpleadoModel;
  HamburguesaEmpleado({this.datoLaboralEmpleadoModel});
}

class _HamburguesaEmpleadoState extends State<HamburguesaEmpleado> {
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
                child: ListView(children: <Widget>[
                  DrawerHeader(
                    child: Container(),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/menu_header.png'),
                            fit: BoxFit.cover)),
                  ),
                  ListTile(
                      title: Text("Inicio"),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        color: Theme.of(context).dividerColor,
                      ),
                      leading: Icon(
                        FontAwesomeIcons.home,
                        color: Theme.of(context).dividerColor,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      }),
                  Divider(
                    height: 10.0,
                  ),
                  ListTile(
                      title: Text("Información Personal"),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        color: Theme.of(context).dividerColor,
                      ),
                      leading: Icon(
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
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        color: Theme.of(context).dividerColor,
                      ),
                      leading: Icon(
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
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        color: Theme.of(context).dividerColor,
                      ),
                      leading: Icon(
                        FontAwesomeIcons.donate,
                        color: Theme.of(context).dividerColor,
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/nomina');
                      }),
                  Divider(
                    height: 10.0,
                  ),
                  mostrarOtros(context, snapshot),
                  ListTile(
                      title: Text("Kardex"),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        color: Theme.of(context).dividerColor,
                      ),
                      leading: Icon(
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
                  //     trailing: Icon(
                  //       Icons.keyboard_arrow_right,
                  //       color: Theme.of(context).dividerColor,
                  //     ),
                  //     leading: Icon(
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
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        color: Theme.of(context).dividerColor,
                      ),
                      leading: Icon(
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
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        color: Theme.of(context).dividerColor,
                      ),
                      leading: Icon(
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
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        color: Theme.of(context).dividerColor,
                      ),
                      leading: Icon(
                        FontAwesomeIcons.powerOff,
                        color: Theme.of(context).dividerColor,
                      ),
                      onTap: () async {
                        _prefs.deletePrefs();
                        bloc.changeUsername("                  ");
                        bloc.changePassword("                  ");
                        await Navigator.pushNamedAndRemoveUntil(context,
                            '/loginInicio', (Route<dynamic> route) => false);
                      }),
                  Divider(
                    height: 10.0,
                  ),
                ]));
          } else {
            return Center(
                child: Image.asset(
              "images/load_2.gif",
            ));
          }
        });
  }

  mostrarOtros(BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.data.mostrarOtros == "N") {
      return SizedBox(
        height: .1,
      );
    } else {
      return Column(children: [
        ListTile(
            title: new Text('Otros'),
            trailing: new Icon(
              Icons.keyboard_arrow_right,
              color: Theme.of(context).dividerColor,
            ),
            leading: new Icon(
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
