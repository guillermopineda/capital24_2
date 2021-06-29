import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
//import 'package:intl/intl.dart';

class TarjetaComunicadoEmpleado extends StatefulWidget {
  _TarjetaComunicadoEmpleadoState createState() =>
      _TarjetaComunicadoEmpleadoState();
}

class _TarjetaComunicadoEmpleadoState extends State<TarjetaComunicadoEmpleado> {
  final RefreshController _refreshController = RefreshController();
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
        width: double.infinity,
        color: Theme.of(context).backgroundColor,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: SafeArea(
            bottom: true,
            maintainBottomViewPadding: true,
            child: SizedBox(
                height: _screenSize.height * .85,
                width: double.infinity,
                child: condicionComunicados(context, _screenSize)),
          ),
        ));
  }

  condicionComunicados(context, _screenSize) {
    //if (widget.comunicadoModel != null && widget.comunicadoModel.isEmpty)
    if (1 < 0) {
      return Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "No hay comunicados que mostrar, regresa pronto",
              style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText1!.color,
                  fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 15,
            ),
            Icon(FontAwesomeIcons.volumeMute,
                color: Theme.of(context).dividerColor, size: 40),
          ],
        ),
      ));
    } else {
      return SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        onRefresh: null,
        //child: (widget.comunicadoModel != null)
        child: (1 == 1)
            ? ListView.builder(
                addRepaintBoundaries: false,
                physics: BouncingScrollPhysics(),
                //itemCount: widget.comunicadoModel.length,
                itemCount: 1,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  // widget.comunicadoModel[index].comunicadoId =
                  //     '${widget.comunicadoModel[index].getImagenComunicado()}-comunicadoId-${widget.comunicadoModel[index].runtimeType}';
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Column(
                      children: <Widget>[
                        GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, '/homeEmpleadoDetalle');
                              //  arguments: widget.comunicadoModel[index]);
                            },
                            child: Hero(
                              //tag: widget.comunicadoModel[index].comunicadoId,
                              tag: "Helo",
                              child: SingleChildScrollView(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Card(
                                    elevation: 40.0,
                                    child: Column(
                                      //aqui se aprovecha que una de las propiedades de la clase Card es child, lo que nos indica que puede recibir un widget, aqui sera Column, por aue queremos mostrar informacion en forma VERTICAL
                                      children: <Widget>[
                                        //nuevamente usamos una propiedad que nos permita insertar mas widgets pero ya de forma VERTICAL, en este caso sera children <Widget> por que indica que viene una lista
                                        Container(
                                          //usamos un container para usar un bloque en niuestra pantalla de app
                                          child: Stack(
                                            //usando la propiedad child de Container, insertaremos un Stack que permite sobreponer widget dentro de la pantalla
                                            children: <Widget>[
                                              //los widget que vamos a sobreponer seran en forma de lista, asi se respeta la idea inicial de columnas con listas
                                              FadeInImage.assetNetwork(
                                                //es una clase que nos ayuda a importar imagenes
                                                placeholder:
                                                    "images/load_2.gif", //que imagen aparece en tiempos de carga, este es válido solo si nuestra clase FadeInImage.assetNetwork
                                                // image: widget
                                                //     .comunicadoModel[index]
                                                //     .getImagenComunicado(),
                                                image:
                                                    "https://gn10.sfo3.digitaloceanspaces.com/gn10/intranet/bienestar/2021/06/21/WhatsApp_Image_2021-06-21_at_10.04.32.jpeg",
                                                fit: BoxFit.cover,
                                                width: double.infinity,
                                                fadeInDuration:
                                                    Duration(milliseconds: 40),
                                                height:
                                                    _screenSize.height * .33,
                                                alignment: Alignment.center,
                                              ), //hasta aqui acaba la tarjeta de imagenes
                                              Positioned(
                                                //aqui usamos la posicion de lo que venga encima, por eso usamos stack
                                                left:
                                                    0.0, //cargado a la izquierda
                                                bottom: 0.0,
                                                right: 0.0,
                                                child: Container(
                                                  //usamos un container por que es un bloque que se utilizara nuevamente
                                                  decoration: BoxDecoration(
                                                    //usamos una decoracion al bloque que haremoa BoxConstraints que se posicione encima
                                                    color: Colors.grey[900]!
                                                        .withOpacity(.5),
                                                  ),
                                                  constraints:
                                                      BoxConstraints.expand(
                                                          height: 55.0),
                                                ),
                                              ),
                                              Positioned(
                                                left:
                                                    10.0, //cargado a la derecha,
                                                bottom: 10.0,
                                                right: 0.0,
                                                child: Column(
                                                  //aqui traemos lo que se va a pintar
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Container(
                                                      width: 300.0,
                                                      child: Text(
                                                        "widget.comunicadoModel[index].tipo",
                                                        style: TextStyle(
                                                            fontSize: 16.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.red
                                                            // color: widget
                                                            //     .comunicadoModel[
                                                            //         index]
                                                            //     .getColorComunicado(),
                                                            ),
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 300.0,
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 4.0),
                                                      child: Text(
                                                        "widget.comunicadoModel[index].nombre",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          color: Colors.white,
                                                        ),
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Positioned(
                                                  //aqui haceos el positioned de la derecha
                                                  right: 5.0,
                                                  bottom: 10.0,
                                                  child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: <Widget>[
                                                        Container(
                                                          child: Text(
                                                            'Vence el '
                                                            // +
                                                            // DateFormat.MMMd('es_MX').format(
                                                            //     DateFormat(
                                                            //             "dd/MM/yyyy",
                                                            //             "es_MX")
                                                            //                                                                      // .parse(widget
                                                            //            .comunicadoModel[
                                                            //                index]
                                                            //     .fechaFinal)),
                                                            ,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.blue,
                                                              // color: widget
                                                              //     .comunicadoModel[
                                                              //         index]
                                                              //     .getColorComunicado(),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 10,
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 4.0),
                                                          child: Text(
                                                            '',
                                                            textAlign:
                                                                TextAlign.right,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        )
                                                      ]))
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )),
                        SizedBox(
                          height: _screenSize.height * .015,
                        ),
                        Center(
                            child: Divider(
                          color: Theme.of(context).dividerColor,
                          indent: 25.0,
                          endIndent: 25.0,
                          thickness: 1.5,
                        )),
                        SizedBox(
                          height: _screenSize.height * .015,
                        ),
                      ],
                    ),
                  );
                })
            : Container(),
      );
    }
  }
}
