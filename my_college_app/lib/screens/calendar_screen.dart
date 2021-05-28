import 'package:flutter/material.dart';

import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  static const routeName = 'calendar';
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  List _selectedEvents;
  Map<DateTime, List> _events;

  @override
  void initState() {
    _events = {
      DateTime(2021, 05, 25): ['Happy Birthday accha'],
      DateTime(2021, 05, 23): ['Happy Birthday jaja'],
      DateTime(2021, 05, 27): ['Happy Birthday haha'],
      DateTime(2021, 05, 22): ['Happy Birthday nana'],
      DateTime(2021, 05, 28): ['Happy Birthday anna'],
      DateTime(2021, 05, 29): ['Happy Birthday toi'],
      DateTime(2021, 05, 21): ['Happy Birthday boi'],
    };
    _selectedEvents = _events[_selectedDay] ??
        []; // selected day events, if there is no event(null) then empty list is returned.

    super.initState();
  }

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay;
  DateTime _lastDay = DateTime(2021, 12, 31);
  DateTime _firstDay = DateTime(2021, 1, 1);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).accentColor,
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          title: Text('Calendar'),
        ),
        body: Column(
          children: [
            calendarWidget(),
            Text(_selectedEvents.toString()),
          ],
        ),
      ),
    );
  }

  TableCalendar calendarWidget() {
    return TableCalendar(
      // headerStyle: HeaderStyle(
      //     decoration: BoxDecoration(
      //   color: Colors.white,

      // )),
      eventLoader: (day) {
        print('day : $day');
        return _events[day] ?? [];
      },
      calendarStyle: CalendarStyle(
        todayTextStyle: TextStyle(
          color: Colors.white,
        ),
        defaultTextStyle: TextStyle(
          color: Colors.white,
        ),
        holidayTextStyle: TextStyle(
          color: Colors.white,
        ),
        weekendTextStyle: TextStyle(
          color: Colors.yellow[500],
        ),

        // defaultDecoration: BoxDecoration(
        //   color: Colors.pinkAccent,
        // ),
      ),
      firstDay: _firstDay,
      lastDay: _lastDay,
      focusedDay: _focusedDay,
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        if (!isSameDay(_selectedDay, selectedDay)) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        }
      },
      calendarFormat: _calendarFormat,
      onFormatChanged: (format) {
        if (_calendarFormat != format) {
          setState(() {
            _calendarFormat = format;
          });
        }
      },
    );
  }

  // Widget _buildEventList() {
  //   print('_selectedEvents : $_selectedEvents');
  //   print('_events : $_events');
  //   return ListView(
  //     children: _selectedEvents
  //         .map((event) => Container(
  //               decoration: BoxDecoration(
  //                 border: Border.all(width: 0.2),
  //                 borderRadius: BorderRadius.circular(25),
  //               ),
  //               margin: EdgeInsets.all(10.0),
  //               child: ListTile(
  //                 title: Center(child: Text(event.toString())),
  //                 onTap: () => print('$event tapped!'),
  //               ),
  //             ))
  //         .toList(),
  //   );
  // }
}
