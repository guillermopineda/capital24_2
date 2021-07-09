import 'package:capital24_2/src/models/altasBajasModel.dart';
import 'package:flutter/material.dart';

class AppConteoColaboradores extends StatefulWidget {
  @override
  _AppConteoColaboradoresState createState() => _AppConteoColaboradoresState();
  final IndicadorNegocioModel? headcountModel;
  AppConteoColaboradores({this.headcountModel});
}

class _AppConteoColaboradoresState extends State<AppConteoColaboradores>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);

    animation =
        IntTween(begin: 0, end: widget.headcountModel!.numeroEmpleados ?? 0)
            .animate(CurvedAnimation(
                parent: animationController, curve: Curves.easeOut));

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      child: Container(
        height: _screenSize.height * .2,
        width: double.infinity,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: AnimatedBuilder(
              animation: animationController,
              builder: (BuildContext context, Widget? child) {
                return Center(
                  child: Container(
                      height: _screenSize.height * .2,
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: _screenSize.height * .02,
                            ),
                            Text(
                              animation.value.toString(),
                              style: TextStyle(
                                  fontSize: 70.0,
                                  color: Theme.of(context).dividerColor),
                            ),
                            Text('Colaboradores Actuales',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .color)),
                          ],
                        ),
                      )),
                );
              }),
        ),
      ),
    );
  }
}
