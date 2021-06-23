import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppTarjetaSucursales extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        height: _screenSize.height * .85,
        child: listaSucursales(context),
      ),
    );
  }

  listaSucursales(context) {
    final _screenSize = MediaQuery.of(context).size;
    // if (plantillaColaboradoresModel.isEmpty) {
    if (1 < 0) {
      return Center(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "No se han registrado sucursales.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText1!.color),
              ),
              SizedBox(
                height: _screenSize.height * .05,
              ),
              Icon(FontAwesomeIcons.users,
                  color: Theme.of(context).dividerColor, size: 45)
            ],
          ),
        ),
      );
    } else {
      return ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    child: new ListTile(
                      subtitle: Text(
                          '"ID: " + plantillaColaboradoresModel[index].numeroEmpleado.toString()'),
                      title: Text(
                        'plantillaColaboradoresModel[index].nombre',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        color: Theme.of(context).dividerColor,
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/sucursalesMapa');
                      // arguments: plantillaColaboradoresModel[index]);
                    },
                  ),
                  new Divider(
                    color: Theme.of(context).dividerColor,
                  ),
                  SizedBox(
                    height: _screenSize.height * .015,
                  ),
                ],
              ),
            );
          });
    }
  }
}
