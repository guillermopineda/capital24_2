import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppCostoPeriodo extends StatefulWidget {
  @override
  _AppCostoPeriodoState createState() => _AppCostoPeriodoState();
}

class _AppCostoPeriodoState extends State<AppCostoPeriodo> {
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Card(
        elevation: 40.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ExpansionTile(
                    leading: Icon(
                      FontAwesomeIcons.fileInvoiceDollar,
                      color: Theme.of(context).dividerColor,
                    ),
                    title: Text(
                      "Costo por Periodo",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    trailing: Icon(
                      Icons.expand_more,
                      color: Theme.of(context).dividerColor,
                    ),
                    children: <Widget>[
                      Divider(
                        color: Theme.of(context).dividerColor,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          SizedBox(
                              height: _screenSize.height * .2,
                              child: ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  itemCount: 5,
                                  //widget.indicadorNegocioModel.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          ListTile(
                                            title: Text(
                                              "hola",
                                              // widget
                                              //     .indicadorNegocioModel[index]
                                              //     .indicadorNegocio,
                                              textAlign: TextAlign.left,
                                            ),
                                            trailing: Icon(
                                              Icons.keyboard_arrow_right,
                                              color: Theme.of(context)
                                                  .dividerColor,
                                            ),
                                            onTap: () {
                                              Navigator.pushNamed(
                                                context,
                                                '/costoPeriodo',
                                                // arguments: widget
                                                //         .indicadorNegocioModel[
                                                //     index]
                                              );
                                            },
                                          ),
                                          Divider(
                                            color:
                                                Theme.of(context).dividerColor,
                                          ),
                                        ],
                                      ),
                                    );
                                  })),
                          Divider(
                            color: Theme.of(context).dividerColor,
                          ),
                        ],
                      ),
                    ])
              ]),
        ));
  }
}
