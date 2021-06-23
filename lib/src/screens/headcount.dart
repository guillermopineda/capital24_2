import 'package:capital24_2/src/widgets/appConteoColaboradores.dart';
import 'package:capital24_2/src/widgets/appHamburguesaClienteEspejo.dart';
import 'package:capital24_2/src/widgets/appHeadcount.dart';
import 'package:flutter/material.dart';

class Headcount extends StatelessWidget {
  static const String routeName = '/headcount';
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text("Headcount"),
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
      ),
      endDrawer: HamburguesaClienteEspejo(),
      body: Center(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                        height: _screenSize.height * .2,
                        width: _screenSize.width * .8,
                        child: _conteo()),
                  ],
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: _screenSize.height * .7,
                  width: double.infinity,
                  child: _graficaHeadcount(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _conteo() {
    // return FutureBuilder(
    //     future: headcountProvider.getHeadcountNegocio(),
    //     builder: (BuildContext context, AsyncSnapshot snapshot) {
    //       if (snapshot.hasData) {
    return AppConteoColaboradores(); //headcountModel: snapshot.data);
    // } else {
    //   return Center(
    //       child: Image.asset(
    //     "images/load_2.gif",
    //   ));
  }

  //       );
  // }

  Widget _graficaHeadcount() {
    // return FutureBuilder(
    //     future: headcountProvider.getHeadcountNegocio(),
    //     builder: (BuildContext context, AsyncSnapshot snapshot) {
    //       if (snapshot.hasData) {
    return AppHeadcount(); //headcountModel: snapshot.data);
    // } else {
    //   return Center(
    //       child: Image.asset(
    //     "images/load_2.gif",
    //   ));
    // }
  }
//         );
//   }
}
