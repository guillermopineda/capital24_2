import 'package:capital24_2/src/screens/conexion/accesoGPS.dart';
import 'package:capital24_2/src/screens/conexionRemota.dart';
import 'package:capital24_2/src/screens/kardexCliente.dart';
import 'package:capital24_2/src/screens/kardexClienteDetalle.dart';
import 'package:capital24_2/src/screens/conexion/loadingMapa.dart';
import 'package:capital24_2/src/screens/conexion/mapa.dart';
import 'package:capital24_2/src/screens/registro.dart';
import 'package:capital24_2/src/screens/conexion/sucursalesMapa.dart';
import 'package:capital24_2/src/screens/vencimientoContratos.dart';
import 'package:flutter/material.dart';
import 'package:capital24_2/src/screens/indicadoresNegocio.dart';
import 'package:capital24_2/src/screens/altasBajas.dart';
import 'package:capital24_2/src/screens/atencionCliente.dart';
import 'package:capital24_2/src/screens/beneficios/assismed.dart';
import 'package:capital24_2/src/screens/beneficios/capitalBenefits.dart';
import 'package:capital24_2/src/screens/beneficios/capitalPartners.dart';
import 'package:capital24_2/src/screens/beneficios/capitalPartnersCercanosDetalle.dart';
import 'package:capital24_2/src/screens/beneficios/capitalPartnersCercanosMapa.dart';
import 'package:capital24_2/src/screens/beneficios/capitalPartnersDirectorioDetalle.dart';
import 'package:capital24_2/src/screens/beneficios/capitalPlatinum.dart';
import 'package:capital24_2/src/screens/beneficios/capitalPlatinumDetalle.dart';
import 'package:capital24_2/src/screens/costoPeriodo.dart';
import 'package:capital24_2/src/screens/headcount.dart';
import 'package:capital24_2/src/screens/home/homeCliente.dart';
import 'package:capital24_2/src/screens/home/homeClienteDetalle.dart';
import 'package:capital24_2/src/screens/plantillaColaboradores.dart';
import 'package:capital24_2/src/screens/plantillaColaboradoresDetalle.dart';
import 'package:capital24_2/src/screens/plantillaColaboradoresDetalleOtro.dart';
import 'package:capital24_2/src/screens/plantillaColaboradoresDetalleOtroDesglose.dart';
import 'package:capital24_2/src/screens/plantillaColaboradoresDetallePago.dart';
import 'package:capital24_2/src/screens/plantillaColaboradoresDetallePagoDesglose.dart';
import 'package:capital24_2/src/screens/rotacionPersonal.dart';
import 'package:capital24_2/src/screens/beneficios/beneficios.dart';
import 'package:capital24_2/src/screens/home/homeEmpleado.dart';
import 'package:capital24_2/src/screens/home/homeEmpleadoDetalle.dart';
import 'package:capital24_2/src/screens/informacionLaboral.dart';
import 'package:capital24_2/src/screens/informacionPersonal.dart';
import 'package:capital24_2/src/screens/login/loginCliente.dart';
import 'package:capital24_2/src/screens/login/loginInicio.dart';
import 'package:capital24_2/src/screens/login/loginEmpleado.dart';
import 'package:capital24_2/src/screens/nomina.dart';
import 'package:capital24_2/src/screens/nominaPagoDetalle.dart';
import 'package:capital24_2/src/screens/otros.dart';
import 'package:capital24_2/src/screens/otrosPagoDetalle.dart';
import 'package:capital24_2/src/screens/kardexEmpleado.dart';

Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{
    AccesoGPS.routeName: (BuildContext context) => AccesoGPS(),
    AltasBajas.routeName: (BuildContext context) => AltasBajas(),
    AtencionClientes.routeName: (BuildContext context) => AtencionClientes(),
    Asismed.routeName: (BuildContext context) => Asismed(),
    Beneficios.routeName: (BuildContext context) => Beneficios(),
    CapitalBenefits.routeName: (BuildContext context) => CapitalBenefits(),
    CapitalPartners.routeName: (BuildContext context) => CapitalPartners(),
    CapitalPartnersDirectorioDetalle.routeName: (BuildContext context) =>
        CapitalPartnersDirectorioDetalle(),
    CapitalPartnersCercanosDetalle.routeName: (BuildContext context) =>
        CapitalPartnersCercanosDetalle(),
    CapitalPartnersCercanosMapa.routeName: (BuildContext context) =>
        CapitalPartnersCercanosMapa(),
    CapitalPlatinum.routeName: (BuildContext context) => CapitalPlatinum(),
    CapitalPlatinumDetalle.routeName: (BuildContext context) =>
        CapitalPlatinumDetalle(),
    CostoPeriodo.routeName: (BuildContext context) => CostoPeriodo(),
    Headcount.routeName: (BuildContext context) => Headcount(),
    HomeCliente.routeName: (BuildContext context) => HomeCliente(),
    HomeClienteDetalle.routeName: (BuildContext context) =>
        HomeClienteDetalle(),
    HomeEmpleado.routeName: (BuildContext context) => HomeEmpleado(),
    HomeEmpleadoDetalle.routeName: (BuildContext context) =>
        HomeEmpleadoDetalle(),
    IndicadoresNegocio.routeName: (BuildContext context) =>
        IndicadoresNegocio(),
    InformacionLaboral.routeName: (BuildContext context) =>
        InformacionLaboral(),
    InformacionPersonal.routeName: (BuildContext context) =>
        InformacionPersonal(),
    KardexEmpleado.routeName: (BuildContext context) => KardexEmpleado(),
    KardexCliente.routeName: (BuildContext context) => KardexCliente(),
    KardexClienteDetalle.routeName: (BuildContext context) =>
        KardexClienteDetalle(),
    LoadingMapa.routeName: (BuildContext context) => LoadingMapa(),
    Mapa.routeName: (BuildContext context) => Mapa(),
    LoginCliente.routeName: (BuildContext context) => LoginCliente(),
    LoginEmpleado.routeName: (BuildContext context) => LoginEmpleado(),
    LoginInicio.routeName: (BuildContext context) => LoginInicio(),
    Nomina.routeName: (BuildContext context) => Nomina(),
    NominaPagoDetalle.routeName: (BuildContext context) => NominaPagoDetalle(),
    Otros.routeName: (BuildContext context) => Otros(),
    OtrosPagoDetalle.routeName: (BuildContext context) => OtrosPagoDetalle(),
    PlantillaColaboradores.routeName: (BuildContext context) =>
        PlantillaColaboradores(),
    PlantillaColaboradoresDetalle.routeName: (BuildContext context) =>
        PlantillaColaboradoresDetalle(),
    PlantillaColaboradoresDetalleOtro.routeName: (BuildContext context) =>
        PlantillaColaboradoresDetalleOtro(),
    PlantillaColaboradoresDetalleOtroDesglose.routeName:
        (BuildContext context) => PlantillaColaboradoresDetalleOtroDesglose(),
    PlantillaColaboradoresDetallePago.routeName: (BuildContext context) =>
        PlantillaColaboradoresDetallePago(),
    PlantillaColaboradoresPagoDetalleDesglose.routeName:
        (BuildContext context) => PlantillaColaboradoresPagoDetalleDesglose(),
    ConexionRemota.routeName: (BuildContext context) => ConexionRemota(),
    RotacionPersonal.routeName: (BuildContext context) => RotacionPersonal(),
    Sucursales.routeName: (BuildContext context) => Sucursales(),
    SucursalesMapa.routeName: (BuildContext context) => SucursalesMapa(),
    VencimientoContrato.routeName: (BuildContext context) =>
        VencimientoContrato(),
  };
}
