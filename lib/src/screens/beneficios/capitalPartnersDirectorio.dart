import 'package:capital24_2/src/models/capitalBenefits/categoriaCapitalBenefitsModel.dart';
import 'package:capital24_2/src/preferences/PreferenciasUsuario.dart';
import 'package:capital24_2/src/providers/capitalBenefits/ServiciosDescuentosProvider.dart';
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
    final serviciosDescuentoProvider =
        Provider.of<ServiciosDescuentoProvider>(context);

    final _screenSize = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: Text("Categorias Beneficios"),
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
              child:
                  (serviciosDescuentoProvider.getCategoriaDescuento!.length ==
                          0)
                      ? Center(
                          child: Image.asset(
                          "images/load_2.gif",
                        ))
                      : AppTarjetasTduPermanentes(
                          descuento:
                              serviciosDescuentoProvider.getCategoriaDescuento),
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
    final serviciosDescuentoProvider =
        Provider.of<ServiciosDescuentoProvider>(context);
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: serviciosDescuentoProvider.listaCategorias.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: _screenSize.width * .22,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _CategoriaBoton(
                    serviciosDescuentoProvider.listaCategorias[index]),
              ],
            ),
          );
        });
  }
}

class _CategoriaBoton extends StatelessWidget {
  final CategoriaDescuentoModel categoriaTduModel;

  const _CategoriaBoton(this.categoriaTduModel);
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    final serviciosTduProvider =
        Provider.of<ServiciosDescuentoProvider>(context);
    return GestureDetector(
      onTap: () {
        final serviciosTduProvider =
            Provider.of<ServiciosDescuentoProvider>(context, listen: false);
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
