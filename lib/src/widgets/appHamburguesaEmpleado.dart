import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HamburguesaEmpleado extends StatefulWidget {
  _HamburguesaEmpleadoState createState() => _HamburguesaEmpleadoState();
}

class _HamburguesaEmpleadoState extends State<HamburguesaEmpleado> {
  @override
  Widget build(BuildContext context) {
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
          // mostrarOtros(context,snapshot),

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
          ListTile(
              title: Text("Conexión Remota"),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: Theme.of(context).dividerColor,
              ),
              leading: Icon(
                FontAwesomeIcons.mapMarkedAlt,
                color: Theme.of(context).dividerColor,
              ),
              onTap: () {
                Navigator.pushNamed(context, '/conexionRemota');
              }),
          Divider(
            height: 10.0,
          ),
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
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/loginInicio', (Route<dynamic> route) => false);
              }),
          Divider(
            height: 10.0,
          ),
        ]));
  }
}
