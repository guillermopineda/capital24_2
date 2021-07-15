import 'package:capital24_2/src/bloc/mapa/mapa_bloc.dart';
import 'package:capital24_2/src/bloc/mi_ubicacion/mi_ubicacion_bloc.dart';
import 'package:capital24_2/src/preferences/PreferenciasUsuario.dart';
import 'package:capital24_2/src/providers/login/Provider.dart';
import 'package:capital24_2/src/providers/services/NotificacionesProviders.dart';
import 'package:capital24_2/src/routes/routes.dart';
import 'package:capital24_2/src/screens/home/homeCliente.dart';
import 'package:capital24_2/src/screens/home/homeEmpleado.dart';
import 'package:capital24_2/src/screens/login/loginInicio.dart';
import 'package:capital24_2/src/utils/Tema.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  await NotificacionesPushProvider.initializeApp();
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> messengerKey =
      new GlobalKey<ScaffoldMessengerState>();
  @override
  void initState() {
    super.initState();

    // Context!
    NotificacionesPushProvider.messagesStream.listen((message) {
      // print('MyApp: $message');
      navigatorKey.currentState?.pushNamed('message', arguments: message);

      final snackBar = SnackBar(content: Text(message));
      messengerKey.currentState?.showSnackBar(snackBar);
    });
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAnalytics analytics = FirebaseAnalytics();
    WidgetsFlutterBinding.ensureInitialized();
    final prefs = new PreferenciasUsuario();
    if (prefs.token == 'Sin token') {
      return ProviderLogin(
        child: MultiBlocProvider(
          child: ChangeNotifierProvider<TemaSwitch>(
              create: (context) => TemaSwitch(miTema),
              child: NoLoginApp(analytics)),
          providers: [
            BlocProvider(create: (_) => MiUbicacionBloc()),
            BlocProvider(create: (_) => MapaBloc()),
          ],
        ),
      );
    } else {
      return ProviderLogin(
          child: MultiBlocProvider(
        child: ChangeNotifierProvider<TemaSwitch>(
            create: (context) => TemaSwitch(miTema),
            child: OkLoginApp(analytics)),
        providers: [
          BlocProvider(create: (_) => MiUbicacionBloc()),
          BlocProvider(create: (_) => MapaBloc()),
        ],
      ));
    }
  }
}

class NoLoginApp extends StatelessWidget {
  final FirebaseAnalytics analytics;
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> messengerKey =
      new GlobalKey<ScaffoldMessengerState>();
  NoLoginApp(this.analytics);
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<TemaSwitch>(context);
    return MaterialApp(
      home: LoginInicio(),
      debugShowCheckedModeBanner: false,
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
      theme: theme.getTema(),
      initialRoute: LoginInicio.routeName,
      routes: getRoutes(),
      navigatorKey: navigatorKey, // Navegar
      scaffoldMessengerKey: messengerKey, // Snacks
    );
  }
}

class OkLoginApp extends StatelessWidget {
  final FirebaseAnalytics analytics;
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> messengerKey =
      new GlobalKey<ScaffoldMessengerState>();
  OkLoginApp(this.analytics);
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<TemaSwitch>(context);
    // final pushProvider = new NotificacionesPushProvider();
    // pushProvider.initNotifications();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorObservers: [
          FirebaseAnalyticsObserver(analytics: analytics),
        ],
        home: tipoUsuario(),
        initialRoute: rutaUsuario(),
        routes: getRoutes(),
        navigatorKey: navigatorKey, // Navegar
        scaffoldMessengerKey: messengerKey, // Snacks
        theme: theme.getTema());
  }

  Widget tipoUsuario() {
    final prefs = new PreferenciasUsuario();
    if (prefs.tipoUsuario == "cliente") {
      return HomeCliente();
    } else
      return HomeEmpleado();
  }

  String rutaUsuario() {
    final prefs = new PreferenciasUsuario();
    if (prefs.tipoUsuario == 'cliente') {
      return HomeCliente.routeName;
    } else
      return HomeEmpleado.routeName;
  }
}
