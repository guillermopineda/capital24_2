import 'package:capital24_2/src/widgets/appHamburguesaClienteEspejo.dart';
import 'package:capital24_2/src/widgets/appPlantillaColaboradores.dart';
import 'package:flutter/material.dart';

class PlantillaColaboradores extends StatelessWidget {
  static const String routeName = '/colaboradores';
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text("Colaboradores"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: null,
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
      endDrawer: HamburguesaClienteEspejo(),
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
                      Container(child: AppTarjetaPlantillaColaboradores()),
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
