import 'package:capital24_2/src/preferences/PreferenciasUsuario.dart';
import 'package:capital24_2/src/providers/login/Provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HamburguesaClienteEspejo extends StatefulWidget {
  _HamburguesaClienteEspejoState createState() =>
      _HamburguesaClienteEspejoState();
  const HamburguesaClienteEspejo();
}

class _HamburguesaClienteEspejoState extends State<HamburguesaClienteEspejo> {
  final _prefs = PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    final bloc = ProviderLogin.of(context);
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
                Navigator.pushNamed(context, '/homeCliente');
              }),
          Divider(
            height: 10.0,
          ),
          ListTile(
              title: Text("Plantilla de Colaboradores"),
              leading: Icon(
                Icons.keyboard_arrow_left,
                color: Theme.of(context).dividerColor,
              ),
              trailing: Icon(
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
              leading: Icon(
                Icons.keyboard_arrow_left,
                color: Theme.of(context).dividerColor,
              ),
              trailing: Icon(
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
              leading: Icon(
                Icons.keyboard_arrow_left,
                color: Theme.of(context).dividerColor,
              ),
              trailing: Icon(
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
              leading: Icon(
                Icons.keyboard_arrow_left,
                color: Theme.of(context).dividerColor,
              ),
              trailing: Icon(
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
                bloc.changeUsernameCliente("                  ");
                bloc.changePasswordCliente("                  ");
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
}
