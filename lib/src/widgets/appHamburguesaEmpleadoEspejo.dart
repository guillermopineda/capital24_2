import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HamburguesaEmpleadoEspejo extends StatefulWidget {
  _HamburguesaEmpleadoEspejoState createState() =>
      _HamburguesaEmpleadoEspejoState();
  const HamburguesaEmpleadoEspejo();
}

class _HamburguesaEmpleadoEspejoState extends State<HamburguesaEmpleadoEspejo> {
  @override
  Widget build(BuildContext context) {
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
                Navigator.pushNamed(context, '/homeEmpleado');
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
          mostrarOtrosAngus(context),
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
          ListTile(
              title: Text("Conexión Remota"),
              leading: Icon(
                Icons.keyboard_arrow_left,
                color: Theme.of(context).dividerColor,
              ),
              trailing: Icon(
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
                Navigator.pushNamedAndRemoveUntil(
                    context, '/loginInicio', (Route<dynamic> route) => false);
              }),
          Divider(
            height: 10.0,
          ),
        ],
      ),
    );
  }

  mostrarOtrosAngus(BuildContext context) {
    // if(snapshot.data.mostrarOtros == "N"){
    if (1 < 0) {
      return SizedBox(
        height: .1,
      );
    } else {
      return Column(children: [
        ListTile(
            title: Text('Otros'),
            leading: Icon(
              Icons.keyboard_arrow_left,
              color: Theme.of(context).dividerColor,
            ),
            trailing: Icon(
              FontAwesomeIcons.calculator,
              color: Theme.of(context).dividerColor,
            ),
            onTap: () {
              Navigator.pushNamed(context, '/otros');
            }),
        Divider()
      ]);
    }
  }
}
