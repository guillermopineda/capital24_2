import 'package:capital24_2/src/models/capitalBenefits/categoriaCapitalBenefitsModel.dart';
import 'package:capital24_2/src/providers/capitalBenefits/localizacionCapitalBenefitsProvider.dart';
import 'package:capital24_2/src/widgets/appHamburguesaEmpleadoEspejo.dart';
import 'package:capital24_2/src/widgets/appTarjetaCapitalPartnersCercanos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TduPermanentes2 extends StatefulWidget {
  @override
  _TduPermanentes2State createState() => _TduPermanentes2State();
}

class _TduPermanentes2State extends State<TduPermanentes2>
    with AutomaticKeepAliveClientMixin {
  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    final localizacionTduProvider =
        Provider.of<LocalizacionTduProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Capital Partners Cercános'),
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
      ),
      endDrawer: usuarioHamburguesa(),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: <Widget>[
          Container(
              height: _screenSize.height * .08, child: _ListaCategorias()),

          Container(
            color: Theme.of(context).primaryColor,
            height: 1,
            width: double.infinity,
          ),

          Expanded(
            child: (localizacionTduProvider.getCategoriaTdu!.length == 0)
                ? Center(
                    child: Image.asset(
                    "images/load_2.gif",
                  ))
                : AppTarjetasTduCercanos(
                    tduCercano: localizacionTduProvider.getCategoriaTdu),
          )

          //AppTarjetasTduPermanentes(tdu:serviciosTduProvider.getCategoriaTdu)),
        ],
      ),
    );
  }

  usuarioHamburguesa() {
    //if (_prefs.tipoUsuario == 'empleado') {
    if (1 > 0) {
      return HamburguesaEmpleadoEspejo();
    } else {
      return; //HamburguesaClienteEspejo();
    }
  }

  @override
  bool get wantKeepAlive => true;
}

class _ListaCategorias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    final localizacionTduProvider =
        Provider.of<LocalizacionTduProvider>(context);
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: localizacionTduProvider.listaCategorias.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: _screenSize.width * .22,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _CategoriaBoton(localizacionTduProvider.listaCategorias[index]),
              ],
            ),
          );
        });
  }
}

class _CategoriaBoton extends StatelessWidget {
  final CategoriaTduModelCercanos categoriaTduModel;

  const _CategoriaBoton(this.categoriaTduModel);
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    final localizacionTduProvider =
        Provider.of<LocalizacionTduProvider>(context);
    return GestureDetector(
      onTap: () {
        final serviciosTduProvider =
            Provider.of<LocalizacionTduProvider>(context, listen: false);
        serviciosTduProvider.selectedCategory = categoriaTduModel.id;
      },
      child: Container(
          width: _screenSize.width * .22,
          child: Column(
            children: <Widget>[
              Icon(
                categoriaTduModel.icon,
                color: (localizacionTduProvider.selectedCategory ==
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
                  color: (localizacionTduProvider.selectedCategory ==
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
