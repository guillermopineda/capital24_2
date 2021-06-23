import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AlertaCumpleaniosCliente extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return AlertDialog(
        backgroundColor: Theme.of(context).indicatorColor,
        elevation: 5.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        title: Text('¡Feliz Cumpleaños!',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xff0077C8))),
        content: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          SizedBox(
              height: _screenSize.height * .33,
              width: _screenSize.width * .8,
              child: diaCumpleanio(context)),
          //Image.asset('images/pastel.png'),
          Icon(
            FontAwesomeIcons.birthdayCake,
            color: Color(0xff0077C8),
            size: 70.0,
          ),
        ]));
  }

  diaCumpleanio(context) {
    //if ("cumpleanioModel.isEmpty") {
    if (1 > 2) {
      return ListTile(
        title: Text(
          "Sin cumpleaños que celebrar",
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(color: Theme.of(context).accentColor),
        ),
      );
    } else {
      return ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: 1,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                title: Text(
                  "cumpleanioModel[index].nombre",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(color: Theme.of(context).accentColor),
                ),
                contentPadding: EdgeInsets.zero,
                trailing: Text("cumpleanioModel[index].fechaNacimiento",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                        color: Color(0xff0077C8),
                        fontStyle: FontStyle.italic)));
          });
    }
  }
}
