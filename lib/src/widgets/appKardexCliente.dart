import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppKardexCliente extends StatelessWidget {
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
                      FontAwesomeIcons.calendarCheck,
                      color: Theme.of(context).dividerColor,
                    ),
                    title: Text(
                      "Consulta un mes",
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
                            height: _screenSize.height * .3,
                            child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                itemCount: 5, //kardexClienteModel.datos.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ListTile(
                                          title: Text(
                                            'kardexClienteModel.datos[index].mes',
                                            textAlign: TextAlign.left,
                                          ),
                                          trailing: Icon(
                                            Icons.keyboard_arrow_right,
                                            color:
                                                Theme.of(context).dividerColor,
                                          ),
                                          onTap: () {
                                            Navigator.pushNamed(context,
                                                '/kardexClienteDetalle');
                                            // ,
                                            // arguments: kardexClienteModel
                                            //     .datos[index]);
                                          },
                                        ),
                                        Divider(
                                          color: Theme.of(context).dividerColor,
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),
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
