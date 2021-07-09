import 'package:capital24_2/src/providers/capitalBenefits/LocalizacionCapitalBenefitsProvider.dart';
import 'package:capital24_2/src/providers/capitalBenefits/ServiciosCapitalBenefitsProvider.dart';
import 'package:capital24_2/src/screens/beneficios/capitalPartnersCercanos.dart';
import 'package:capital24_2/src/screens/beneficios/capitalPartnersDirectorio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CapitalPartners extends StatelessWidget {
  static const String routeName = '/capitalPartners';
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ServiciosTduProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => LocalizacionTduProvider(),
        ),
      ],
      child: ChangeNotifierProvider(
        create: (_) => new _NavegacionTduPermanentesModel(),
        child: Scaffold(
          body: _PaginasTdu(),
          bottomNavigationBar: _Categorias(),
        ),
      ),
    );
  }
}

class _PaginasTdu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionTduPermanentesModel =
        Provider.of<_NavegacionTduPermanentesModel>(context);

    return PageView(
        controller: navegacionTduPermanentesModel.pagController,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          TduPermanentes1(),
          TduPermanentes2(),
        ]);
  }
}

class _Categorias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionTduPermanentesModel =
        Provider.of<_NavegacionTduPermanentesModel>(context);

    return BottomNavigationBar(
        currentIndex: navegacionTduPermanentesModel.paginaActual,
        onTap: (i) {
          navegacionTduPermanentesModel.paginaActual =
              i; //esta es una forma de recorrer una lista
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.store_mall_directory,
              ),
              label: "Directorio"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.location_on,
              ),
              label: "Cercános"),
        ]);
  }
}

class _NavegacionTduPermanentesModel with ChangeNotifier {
  //Provider
  int _paginaActual = 0;
  PageController _pageController = new PageController(initialPage: 0);

  int get paginaActual => this._paginaActual;
  PageController get pagController => this._pageController;

  set paginaActual(int valor) {
    this._paginaActual = valor;
    _pageController.animateToPage(valor,
        duration: Duration(milliseconds: 250), curve: Curves.easeOut);
    notifyListeners(); //notificar a los hijos en concreto aqui es a este widget en particular el valor _PaginaActual
  }
}
