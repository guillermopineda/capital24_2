import 'package:capital24_2/src/models/capitalBenefits/categoriaCapitalBenefitsModel.dart';
import 'package:capital24_2/src/preferences/PreferenciasUsuario.dart';
import 'package:capital24_2/src/providers/capitalBenefits/ServiciosCapitalBenefitsProvider.dart';
import 'package:capital24_2/src/widgets/appHamburguesaClienteEspejo.dart';
import 'package:capital24_2/src/widgets/appHamburguesaEmpleadoEspejo.dart';
import 'package:capital24_2/src/widgets/appTarjetaCapitalPartnersPermanentes.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class TduPermanentes1 extends StatefulWidget {
  @override
  _TduPermanentes1State createState() => _TduPermanentes1State();
}

class _TduPermanentes1State extends State<TduPermanentes1>
    with AutomaticKeepAliveClientMixin {
  final _prefs = PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final serviciosTduProvider = Provider.of<ServiciosTduProvider>(context);

    final _screenSize = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: Text("Capital Partners Directorio"),
          centerTitle: true,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back)),
        ),
        endDrawer: usuarioHamburguesa(),
        backgroundColor: Theme.of(context).backgroundColor,
        //body: AppTarjetasTduPermanentes(tdu: serviciosTduProvider.tduServicios,)
        body: Column(
          children: <Widget>[
            Container(
                height: _screenSize.height * .08, child: _ListaCategorias()),
            Container(
              color: Theme.of(context).dividerColor,
              height: 1,
              width: double.infinity,
            ),
            Expanded(
              child: (serviciosTduProvider.getCategoriaTdu!.length == 0)
                  ? Center(
                      child: Image.asset(
                      "images/load_2.gif",
                    ))
                  : AppTarjetasTduPermanentes(
                      tdu: serviciosTduProvider.getCategoriaTdu),
            )
          ],
        ));
  }

  usuarioHamburguesa() {
    if (_prefs.tipoUsuario == 'empleado') {
      return HamburguesaEmpleadoEspejo();
    } else {
      return HamburguesaClienteEspejo();
    }
  }

  @override
  bool get wantKeepAlive => true;
}

class _ListaCategorias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    final serviciosTduProvider = Provider.of<ServiciosTduProvider>(context);
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: serviciosTduProvider.listaCategorias.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: _screenSize.width * .22,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _CategoriaBoton(serviciosTduProvider.listaCategorias[index]),
              ],
            ),
          );
        });
  }
}

class _CategoriaBoton extends StatelessWidget {
  final CategoriaTduModel categoriaTduModel;

  const _CategoriaBoton(this.categoriaTduModel);
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    final serviciosTduProvider = Provider.of<ServiciosTduProvider>(context);
    return GestureDetector(
      onTap: () {
        final serviciosTduProvider =
            Provider.of<ServiciosTduProvider>(context, listen: false);
        serviciosTduProvider.selectedCategory = categoriaTduModel.id;
      },
      child: Container(
          width: _screenSize.width * .22,
          child: Column(
            children: <Widget>[
              Icon(
                categoriaTduModel.icon,
                color: (serviciosTduProvider.selectedCategory ==
                        this.categoriaTduModel.id)
                    ? Theme.of(context).dividerColor
                    : Colors.grey,
              ),
              SizedBox(height: _screenSize.height * .01),
              Text(
                categoriaTduModel.name,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: (serviciosTduProvider.selectedCategory ==
                          this.categoriaTduModel.id)
                      ? Theme.of(context).dividerColor
                      : Colors.grey,
                ),
              )
            ],
          )),
    );
  }
}
