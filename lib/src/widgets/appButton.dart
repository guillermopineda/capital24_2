import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? name;
  const AppButton({this.onPressed, this.name});
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Material(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(30.0),
          elevation: 10.0,
          child: TextButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.focused))
                    return RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0));
                  if (states.contains(MaterialState.hovered))
                    return RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0));
                  if (states.contains(MaterialState.pressed))
                    return RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0));
                  return RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          30.0)); // Defer to the widget's default.
                }),
                minimumSize: MaterialStateProperty.all(
                    Size(_screenSize.width * 1, _screenSize.height * .05)),
                fixedSize: MaterialStateProperty.all(
                    Size(_screenSize.width * 1, _screenSize.height * .1)),
                overlayColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.focused))
                    return Color(0xff003C71);
                  if (states.contains(MaterialState.hovered))
                    return Color(0xff003C71);
                  if (states.contains(MaterialState.pressed))
                    return Color(0xff003C71);
                  return Colors.white; // Defer to the widget's default.
                }),
              ),
              onPressed: onPressed,
              child: Text(
                name!,
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ))),
    );
  }
}
