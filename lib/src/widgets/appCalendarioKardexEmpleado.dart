import 'package:capital24_2/src/models/kardexEmpleadoModel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:table_calendar/table_calendar.dart';

class CalendarioKardexEmpleado extends StatefulWidget {
  _CalendarioKardexEmpleadoState createState() =>
      _CalendarioKardexEmpleadoState();

  final List<KardexEmpleadoModel>? kardexEmpleadoModel;
  CalendarioKardexEmpleado({this.kardexEmpleadoModel});
}

class _CalendarioKardexEmpleadoState extends State<CalendarioKardexEmpleado> {
  CalendarController? _calendarController;
  List<dynamic>? _selectedEvents;

  void initState() {
    super.initState();
    _calendarController = CalendarController();
    _selectedEvents = [];
  }

  @override
  void dispose() {
    _calendarController!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    List kardexEmpleadoModel = widget.kardexEmpleadoModel as List;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(
                    "Consulta ausentismos e incapacidades   ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1!.color),
                  ),
                  Icon(
                    Icons.touch_app,
                    color: Theme.of(context).dividerColor,
                  ),
                ],
              ),
            ),
            Center(
                child: Divider(
              color: Theme.of(context).dividerColor,
              indent: 10.0,
              endIndent: 10.0,
              thickness: 1.5,
            )),
            TableCalendar(
              events: {
                for (int i = 0; i < kardexEmpleadoModel.length; i++)
                  DateFormat("dd/MM/yyyy", "en_US")
                      .parse(widget.kardexEmpleadoModel![i].fecha.toString()): [
                    widget.kardexEmpleadoModel![i].marca
                  ],
              },
              initialSelectedDay: DateTime.now(),
              formatAnimation: FormatAnimation.slide,
              availableGestures: AvailableGestures.all,
              startingDayOfWeek: StartingDayOfWeek.sunday,
              calendarController: _calendarController,
              locale: 'es_MX',
              calendarStyle: CalendarStyle(
                  markersPositionTop: null,
                  markersPositionBottom: null,
                  markersAlignment: Alignment.center,
                  highlightSelected: true,
                  outsideDaysVisible: false,
                  weekendStyle: TextStyle(color: Theme.of(context).accentColor),
                  weekdayStyle: TextStyle(color: Theme.of(context).accentColor),
                  outsideWeekendStyle: TextStyle(
                    color: Theme.of(context).accentColor,
                  ),
                  todayColor: Theme.of(context).primaryColor,
                  selectedColor: Theme.of(context).accentColor,
                  selectedStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).backgroundColor)),
              headerStyle: HeaderStyle(
                centerHeaderTitle: true,
                formatButtonVisible: false,
                titleTextBuilder: (date, locale) =>
                    DateFormat.MMMM("es_MX").add_y().format(date),
                titleTextStyle: TextStyle(
                    fontSize: 18.0, color: Theme.of(context).dividerColor),
                leftChevronIcon: Icon(
                  Icons.arrow_back_ios,
                  color: Theme.of(context).dividerColor,
                ),
                rightChevronIcon: Icon(
                  Icons.arrow_forward_ios,
                  color: Theme.of(context).dividerColor,
                ),
              ),
              daysOfWeekStyle: DaysOfWeekStyle(
                weekendStyle: TextStyle(color: Theme.of(context).dividerColor),
                weekdayStyle: TextStyle(color: Theme.of(context).dividerColor),
              ),
              onDaySelected: (DateTime date, List events, List noEvents) {
                setState(() {
                  _selectedEvents = events;
                });
              },
              builders: CalendarBuilders(
                  singleMarkerBuilder: (context, date, events) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (events as String).contains("FALTAS")
                              ? Color(0xffCB6CE6).withOpacity(.6)
                              : (events).contains("PERMISO S/D SUELDO")
                                  ? Color(0xff7ED957).withOpacity(.6)
                                  : (events).contains("INC. POR ACCIDENTE")
                                      ? Color(0xffA6A6A6).withOpacity(.6)
                                      : (events).contains(
                                              "INC. ENFERMEDAD GENERAL")
                                          ? Color(0xff5271FF).withOpacity(.6)
                                          : (events).contains("INC. POR ENLACE")
                                              ? Color(0xff5CE1E6)
                                                  .withOpacity(.6)
                                              : (events).contains(
                                                      "INC. MATERNIDAD")
                                                  ? Color(0xffFF66C4)
                                                      .withOpacity(.6)
                                                  : (events).contains(
                                                          "PERMISO G/G SUELDO")
                                                      ? Color(0xff0069F6)
                                                          .withOpacity(.6)
                                                      : (events).contains(
                                                              "DÍA SOLIDARIO")
                                                          ? Color(0xff864EF6)
                                                              .withOpacity(.6)
                                                          : (events).contains(
                                                                  "VACACIONES")
                                                              ? Color(0xffFFBD59)
                                                                  .withOpacity(
                                                                      .6)
                                                              : Color(0xff525151)
                                                                  .withOpacity(
                                                                      .6)),
                      height: 40.0,
                      width: 40.0,
                    ),
                  ],
                );
              }),
            ),
            Center(
                child: Divider(
              color: Theme.of(context).dividerColor,
              indent: 10.0,
              endIndent: 10.0,
              thickness: 1.5,
            )),
            ..._selectedEvents!.map(
              (event) => ListTile(
                  dense: true,
                  trailing: Icon(
                    Icons.fiber_manual_record,
                    color: (event as String).contains("FALTAS")
                        ? Color(0xffCB6CE6).withOpacity(.6)
                        : (event).contains("PERMISO S/D SUELDO")
                            ? Color(0xff7ED957).withOpacity(.6)
                            : (event).contains("INC. POR ACCIDENTE")
                                ? Color(0xffA6A6A6).withOpacity(.6)
                                : (event).contains("INC. ENFERMEDAD GENERAL")
                                    ? Color(0xff5271FF).withOpacity(.6)
                                    : (event).contains("INC. POR ENLACE")
                                        ? Color(0xff5CE1E6).withOpacity(.6)
                                        : (event).contains("INC. MATERNIDAD")
                                            ? Color(0xffFF66C4).withOpacity(.6)
                                            : (event).contains(
                                                    "PERMISO G/G SUELDO")
                                                ? Color(0xff0069F6)
                                                    .withOpacity(.6)
                                                : (event).contains(
                                                        "DÍA SOLIDARIO")
                                                    ? Color(0xff864EF6)
                                                        .withOpacity(.6)
                                                    : (event).contains(
                                                            "VACACIONES")
                                                        ? Color(0xffFFBD59)
                                                            .withOpacity(.6)
                                                        : Color(0xff525151)
                                                            .withOpacity(.6),
                    size: 30,
                  ),
                  title: Text(
                    event,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  )),
            ),
            SizedBox(
              height: _screenSize.height * .05,
            ),
            _dias(),
          ],
        ),
      ),
    );
  }

  _dias() {
    final _screenSize = MediaQuery.of(context).size;

    if (widget.kardexEmpleadoModel!.isEmpty) {
      return Center(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "Aun no se ha registrado información, vuelve pronto",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText1!.color),
              ),
              SizedBox(
                height: _screenSize.height * .05,
              ),
              Icon(FontAwesomeIcons.calendarCheck,
                  color: Theme.of(context).dividerColor, size: 45)
            ],
          ),
        ),
      );
    } else {
      return Center(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "Desliza el calendario",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText1!.color),
              ),
              SizedBox(
                height: _screenSize.height * .02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(FontAwesomeIcons.angleLeft,
                      color: Theme.of(context).dividerColor, size: 45),
                  Icon(FontAwesomeIcons.angleRight,
                      color: Theme.of(context).dividerColor, size: 45),
                ],
              )
            ],
          ),
        ),
      );
    }
  }
}
