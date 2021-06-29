import 'package:capital24_2/src/bloc/mapa/mapa_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BtnMiRuta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mapaBloc = context.read<MapaBloc>();
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        maxRadius: 25,
        child: IconButton(
          icon: Icon(FontAwesomeIcons.ellipsisH),
          onPressed: () {
            mapaBloc.add(OnMarcarRecorrido());
          },
        ),
      ),
    );
  }
}
