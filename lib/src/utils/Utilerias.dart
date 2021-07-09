import 'package:flutter/material.dart';

void mostarAlerta(BuildContext context, String mensaje) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 5.0,
          backgroundColor: Theme.of(context).backgroundColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text(
            'Información Incorrecta',
            style: TextStyle(color: Theme.of(context).accentColor),
          ),
          content: Text(
            mensaje,
            style: TextStyle(color: Theme.of(context).accentColor),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Reintentar',
                style: TextStyle(color: Theme.of(context).dividerColor),
              ),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        );
      });
}
