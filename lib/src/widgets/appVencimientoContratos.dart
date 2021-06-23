import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:intl/intl.dart';

class AppVencimientoContratos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        height: _screenSize.height * .85,
        child: vencimientoContratos(context),
      ),
    );
  }

  vencimientoContratos(context) {
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: 3, //vencimientoContratosModel.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: Column(
              children: <Widget>[
                GestureDetector(
                  child: new ListTile(
                    // subtitle: Text(
                    //   "Contrato vencerá el " +
                    //       DateFormat.MMMMd('es_MX').format(DateFormat(
                    //               'dd/MM/yyyy', 'es_MX')
                    //           .parse(vencimientoContratosModel[index].fecha)),
                    //   style: TextStyle(color: Colors.red),
                    // ),
                    title: Text(
                      'vencimientoContratosModel[index].nombre',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    leading: Icon(
                      FontAwesomeIcons.user,
                      color: Theme.of(context).dividerColor,
                    ),
                  ),
                ),
                new Divider(
                  color: Theme.of(context).dividerColor,
                ),
              ],
            ),
          );
        });
  }
}
//}
