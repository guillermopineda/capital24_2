import 'package:capital24_2/src/preferences/PreferenciasUsuario.dart';
import 'package:capital24_2/src/providers/login/Provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HamburguesaCliente extends StatefulWidget {
  _HamburguesaClienteState createState() => _HamburguesaClienteState();
}

final _prefs = PreferenciasUsuario();

class _HamburguesaClienteState extends State<HamburguesaCliente> {
  @override
  Widget build(BuildContext context) {
    final bloc = ProviderLogin.of(context);
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
              title: Text("Plantilla de Colaboradores"),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: Theme.of(context).dividerColor,
              ),
              leading: Icon(
                FontAwesomeIcons.users,
                color: Theme.of(context).dividerColor,
              ),
              onTap: () {
                Navigator.pushNamed(context, '/colaboradores');
              }),
          Divider(
            height: 10.0,
          ),
          ListTile(
              title: Text("Indicadores de Negocio"),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: Theme.of(context).dividerColor,
              ),
              leading: Icon(
                Icons.equalizer,
                color: Theme.of(context).dividerColor,
              ),
              onTap: () {
                Navigator.pushNamed(context, '/indicadoresNegocio');
              }),
          Divider(
            height: 10.0,
          ),
          ListTile(
              title: Text("Kardex"),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: Theme.of(context).dividerColor,
              ),
              leading: Icon(
                FontAwesomeIcons.chartPie,
                color: Theme.of(context).dividerColor,
              ),
              onTap: () {
                Navigator.pushNamed(context, '/kardexCliente');
              }),
          Divider(
            height: 10.0,
          ),
          ListTile(
              title: Text("Vencimiento de Contratos"),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: Theme.of(context).dividerColor,
              ),
              leading: Icon(
                Icons.description,
                color: Theme.of(context).dividerColor,
              ),
              onTap: () {
                Navigator.pushNamed(context, '/vencimientoContrato');
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
                _prefs.deletePrefs();
                bloc.changeUsernameCliente("                  ");
                bloc.changePasswordCliente("                  ");
                Navigator.pushNamedAndRemoveUntil(
                    context, '/loginInicio', (Route<dynamic> route) => false);
              }),
          Divider(
            height: 10.0,
          ),
        ]));
  }
}
