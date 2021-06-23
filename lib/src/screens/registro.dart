import 'package:capital24_2/src/widgets/appHamburguesaEmpleadoEspejo.dart';
import 'package:capital24_2/src/widgets/appSucursales.dart';
import 'package:flutter/material.dart';

class Sucursales extends StatelessWidget {
  static const String routeName = '/sucursales';

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text("Sucursales"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => Navigator.pushNamed(context, '/sucursales'),
            // onPressed: () {
            //   showSearch(
            //     context: context,
            //     delegate: ColaboradoresSearch(
            //         plantillaColaboradoresModel: snapshot.data),
            //   );
            // }
          )
        ],
      ),
      endDrawer: HamburguesaEmpleadoEspejo(),
      body: SafeArea(
        bottom: true,
        maintainBottomViewPadding: true,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: _screenSize.height * .85,
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    children: <Widget>[
                      Container(child: AppTarjetaSucursales()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
