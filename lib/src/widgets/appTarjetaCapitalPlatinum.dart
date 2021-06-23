import 'package:capital24_2/src/models/capitalBenefits/capitalPlatinumModel.dart';
import 'package:flutter/material.dart';

class AppTarjetasTdu extends StatelessWidget {
  final List<DirectorioModel>? listaHotDealsModel;

  AppTarjetasTdu({this.listaHotDealsModel});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return new Container(
        width: double.infinity,
        color: Theme.of(context).backgroundColor,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: SafeArea(
            bottom: true,
            maintainBottomViewPadding: true,
            child: SizedBox(
                height: _screenSize.height * .85,
                width: double.infinity,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: listaHotDealsModel?.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          children: <Widget>[
                            new GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, '/capitalPlatinumDetalle',
                                      arguments: listaHotDealsModel![index]);
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Card(
                                    elevation: 40.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(1.0),
                                    ),
                                    child: Column(
                                      children: <Widget>[
                                        new Container(
                                          child: new Stack(
                                            children: <Widget>[
                                              FadeInImage(
                                                image: NetworkImage(
                                                    listaHotDealsModel?[index]
                                                        .beneficio
                                                        ?.hotdeal
                                                        ?.imagenes?[0]
                                                        .getImagenHotDeal()),
                                                placeholder: AssetImage(
                                                    "images/load_2.gif"),
                                                fit: BoxFit.fill,
                                                width: double.infinity,
                                                fadeInDuration: new Duration(
                                                    milliseconds: 40),
                                                height:
                                                    _screenSize.height * .30,
                                                alignment: Alignment.center,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )),
                            SizedBox(
                              height: _screenSize.height * .015,
                            ),
                            Center(
                                child: Divider(
                              color: Theme.of(context).dividerColor,
                              indent: 25.0,
                              endIndent: 25.0,
                              thickness: 1.5,
                            )),
                            SizedBox(
                              height: _screenSize.height * .015,
                            ),
                          ],
                        ),
                      );
                    })),
          ),
        ));
  }
}
