import 'package:capital24_2/src/models/plantillaColaboradoresModel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppTarjetaPlantillaColaboradores extends StatelessWidget {
  final List<PlantillaColaboradoresModel>? plantillaColaboradoresModel;
  AppTarjetaPlantillaColaboradores({this.plantillaColaboradoresModel});
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        height: _screenSize.height * .85,
        child: plantillaPersonal(context),
      ),
    );
  }

  plantillaPersonal(context) {
    final _screenSize = MediaQuery.of(context).size;
    if (plantillaColaboradoresModel!.isEmpty) {
      return Center(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "En espera de colaboradores. Vuelve mas tarde",
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
          itemCount: plantillaColaboradoresModel!.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    child: new ListTile(
                      subtitle: Text(
                          'ID: ${plantillaColaboradoresModel![index].numeroEmpleado.toString()}'),
                      title: Text(
                        plantillaColaboradoresModel![index].nombre.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        color: Theme.of(context).dividerColor,
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                          context, '/plantillaColaboradoresDetalle',
                          arguments: plantillaColaboradoresModel![index]);
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
