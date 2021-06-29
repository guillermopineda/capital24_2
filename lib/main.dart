import 'package:capital24_2/src/bloc/mapa/mapa_bloc.dart';
import 'package:capital24_2/src/bloc/mi_ubicacion/mi_ubicacion_bloc.dart';
import 'package:capital24_2/src/routes/routes.dart';
import 'package:capital24_2/src/screens/login/loginInicio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => MiUbicacionBloc()),
        BlocProvider(create: (_) => MapaBloc()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: LoginInicio(),
          initialRoute: LoginInicio.routeName,
          routes: getRoutes(),
          theme: ThemeData(
              dialogBackgroundColor: Colors.white,
              indicatorColor: Color.fromRGBO(229, 241, 249, 0.8),
              brightness: Brightness.light,
              buttonTheme: ButtonThemeData(minWidth: 10),
              fontFamily: 'Futura',
              primaryColor: Color(0xff0077C8),
              dividerColor: Color(0xff0077C8),
              cardColor: Color(0xffFFFFFF),
              backgroundColor: Colors.white,
              accentColor: Color(0xff003C71),
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xff0077C8),
                  elevation: 10),
              textTheme:
                  TextTheme(bodyText1: TextStyle(color: Colors.black45)))),
    );
  }
}
