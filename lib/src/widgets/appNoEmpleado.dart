import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NoEmpleado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Capital24'),
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, '/homeEmpleado');
            },
            child: Icon(
              FontAwesomeIcons.backward,
            )),
      ),
      body: AlertDialog(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 5.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                  height: _screenSize.height * .2,
                  width: _screenSize.width * .5,
                  color: Colors.white,
                  child: Image(
                    image: AssetImage('images/logo.png'),
                    height: _screenSize.height * 1,
                  )),
            ),
            Divider(
              color: Theme.of(context).dividerColor,
            ),
            Column(
              children: <Widget>[
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Container(
                    height: _screenSize.height * .10,
                    width: _screenSize.width * .5,
                    child: Text(
                      'Esta es sección exclusiva para Clientes, por favor ingresa las credenciales correspondientes.',
                      style: TextStyle(
                          color: Theme.of(context).textTheme.bodyText1!.color,
                          fontSize: 14.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/homeEmpleado');
                    },
                    icon: Icon(
                      FontAwesomeIcons.backward,
                      color: Theme.of(context).dividerColor,
                      size: 36.0,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
