import 'package:capital24_2/src/bloc/mapa/mapa_bloc.dart';
import 'package:capital24_2/src/bloc/mi_ubicacion/mi_ubicacion_bloc.dart';
import 'package:capital24_2/src/services/traffic_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:polyline/polyline.dart' as Poly;

class AppTarjetaSucursales extends StatefulWidget {
  @override
  _AppTarjetaSucursalesState createState() => _AppTarjetaSucursalesState();
}

class _AppTarjetaSucursalesState extends State<AppTarjetaSucursales> {
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
                  BlocBuilder<MapaBloc, MapaState>(
                    builder: (context, state) {
                      return GestureDetector(
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
                        onTap: () async {
                          Navigator.pushNamed(
                            context,
                            '/mapa',
                          );
                          this.calcularDestino(context);

                          // arguments: plantillaColaboradoresModel[index]);
                        },
                      );
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

  Future calcularDestino(BuildContext context) async {
    final trafficService = new TrafficService();
    final mapaBloc = context.read<MapaBloc>();
    final inicio = context.read<MiUbicacionBloc>().state.ubicacion;
    final destino = mapaBloc.state.ubicacionCentral;
    final trafficResponse =
        await trafficService.getCoordsInicioYDestino(inicio, destino);
    final geometry = trafficResponse.routes[0].geometry;
    final duracion = trafficResponse.routes[0].duration;
    final distancia = trafficResponse.routes[0].distance;
    final points = Poly.Polyline.Decode(encodedString: geometry, precision: 6)
        .decodedCoords;
    final List<LatLng> rutaCoordenadas =
        points.map((point) => LatLng(point[0], point[1])).toList();
    mapaBloc
        .add(OnCrearRutaInicioDestino(rutaCoordenadas, distancia, duracion));
    print("---------------SHALA--------------------");
    print(rutaCoordenadas);
  }
}
