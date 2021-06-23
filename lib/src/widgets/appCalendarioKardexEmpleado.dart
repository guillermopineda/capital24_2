import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:table_calendar/table_calendar.dart';

class CalendarioKardexEmpleado extends StatefulWidget {
  // const CalendarioKardexEmpleado({this.kardexEmpleadoModel});
  _CalendarioKardexEmpleadoState createState() =>
      _CalendarioKardexEmpleadoState();
}

class _CalendarioKardexEmpleadoState extends State<CalendarioKardexEmpleado> {
  List<dynamic>? _selectedEvents;

  void initState() {
    super.initState();
    _selectedEvents = [];
  }

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
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
              firstDay: DateTime.utc(1990, 1, 1),
              lastDay: DateTime.utc(2025, 12, 31),
              focusedDay: DateTime.now(),
              // events: {
              //   for (int i = 0; i < kardexEmpleadoModel.length; i++)
              //     DateFormat("dd/MM/yyyy", "en_US")
              //         .parse(widget.kardexEmpleadoModel[i].fecha): [
              //       widget.kardexEmpleadoModel[i].marca
              //     ],
              // },
              formatAnimationDuration: Duration(milliseconds: 200),
              availableGestures: AvailableGestures.all,
              startingDayOfWeek: StartingDayOfWeek.sunday,
              calendarFormat: CalendarFormat.month,
              locale: 'es_MX',
              calendarStyle: CalendarStyle(
                  markersAlignment: Alignment.center,
                  outsideDaysVisible: false,
                  weekendTextStyle:
                      TextStyle(color: Theme.of(context).accentColor),
                  defaultTextStyle:
                      TextStyle(color: Theme.of(context).accentColor),
                  todayDecoration:
                      BoxDecoration(color: Theme.of(context).primaryColor),
                  selectedDecoration:
                      BoxDecoration(color: Theme.of(context).accentColor),
                  selectedTextStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).backgroundColor)),
              headerStyle: HeaderStyle(
                titleTextFormatter: (date, locale) =>
                    DateFormat.MMMM("es_MX").add_y().format(date),
                titleCentered: true,
                formatButtonVisible: false,
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
              // onDaySelected: (DateTime date, DateTime events) {
              //   setState(() {
              //     _selectedEvents = events;
              //   });
              // },
              calendarBuilders: CalendarBuilders(
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

    //if (widget.kardexEmpleadoModel.isEmpty) {
    if (1 > 0) {
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
