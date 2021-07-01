// import 'package:flutter/material.dart';

// import 'package:table_calendar/table_calendar.dart';

// import '../resuable_ui/landscape_screen.dart';

// class CalendarScreen extends StatefulWidget {
//   static const routeName = 'calendar';
//   @override
//   _CalendarScreenState createState() => _CalendarScreenState();
// }

// class _CalendarScreenState extends State<CalendarScreen> {
//   var date = DateTime.now();
//   List _selectedEvents;
//   Map<DateTime, List> _events;

//   @override
//   void initState() {
//     _events = {
//       DateTime(2021, 05, 25): ['Happy Birthday accha'],
//       DateTime(2021, 05, 23): ['Happy Birthday jaja'],
//       DateTime(2021, 05, 27): ['Happy Birthday haha'],
//       DateTime(2021, 05, 22): ['Happy Birthday nana'],
//       DateTime(2021, 05, 28): ['Happy Birthday anna'],
//       DateTime(2021, 05, 29): ['Happy Birthday toi'],
//       DateTime(2021, 05, 21): ['Happy Birthday boi'],
//       date: ['Happy Birthday to Mrinalika'],
//     };
//     print('selectedDay : $_selectedDay');
//     _selectedEvents = _events[_selectedDay] ??
//         []; // selected day events, if there is no event(null) then empty list is returned.
//     print('selectedEvents : $_selectedEvents');

//     super.initState();
//   }

//   CalendarFormat _calendarFormat = CalendarFormat.month;
//   DateTime _focusedDay = DateTime.now();
//   DateTime _selectedDay;
//   DateTime _lastDay = DateTime(2021, 12, 31);
//   DateTime _firstDay = DateTime(2021, 1, 1);

//   List _getEventsForDay(DateTime day) {
//     return _events[day] ?? [];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MediaQuery.of(context).orientation == Orientation.landscape
//         ? LandscapeScreen()
//         : Container(
//             decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                     begin: Alignment.topRight,
//                     end: Alignment.bottomLeft,
//                     colors: [
//                   Theme.of(context).primaryColor,
//                   Theme.of(context).accentColor,
//                 ])),
//             child: Scaffold(
//               backgroundColor: Colors.transparent,
//               appBar: AppBar(
//                 elevation: 0.0,
//                 backgroundColor: Colors.transparent,
//                 title: Text('Calendar'),
//               ),
//               body: Column(
//                 children: [
//                   calendarWidget(),
//                   Text(_selectedDay.toString()),
//                 ],
//               ),
//             ),
//           );
//   }

//   TableCalendar calendarWidget() {
//     return TableCalendar(
//       headerStyle: HeaderStyle(
//         titleTextStyle: TextStyle(
//           color: Colors.white,
//         ),
//         formatButtonTextStyle: TextStyle(
//           color: Colors.white,
//         ),
//         formatButtonShowsNext: false,

//         // decoration: BoxDecoration(
//         // color: Colors.white,
//         // )
//       ),
//       eventLoader: (day) {
//         // print('event day : ${_events[day]}');
//         // print(date);
//         day = DateTime.parse('${day.day}${day.month}${day.year}');
//         return _getEventsForDay(day);
//       },
//       calendarStyle: CalendarStyle(
//         todayTextStyle: TextStyle(
//           color: Colors.white,
//         ),
//         defaultTextStyle: TextStyle(
//           color: Colors.white,
//         ),
//         holidayTextStyle: TextStyle(
//           color: Colors.green,
//         ),
//         weekendTextStyle: TextStyle(
//           color: Colors.red,
//         ),
//         // defaultDecoration: BoxDecoration(
//         //   color: Colors.pinkAccent,
//         // ),
//         canMarkersOverflow: false,
//         markerDecoration: BoxDecoration(
//           color: Colors.white,
//         ),
//         markerSize: 5,
//       ),
//       firstDay: _firstDay,
//       lastDay: _lastDay,
//       focusedDay: _focusedDay,
//       selectedDayPredicate: (day) {
//         return isSameDay(_selectedDay, day);
//       },
//       onDaySelected: (selectedDay, focusedDay) {
//         if (!isSameDay(_selectedDay, selectedDay)) {
//           setState(() {
//             _selectedDay = selectedDay;
//             print('_selectedDay : $_selectedDay');
//             _focusedDay = focusedDay;
//           });
//         }
//       },
//       calendarFormat: _calendarFormat,
//       onFormatChanged: (format) {
//         if (_calendarFormat != format) {
//           setState(() {
//             _calendarFormat = format;
//           });
//         }
//       },
//     );
//   }

//   // Widget _buildEventList() {
//   //   print('_selectedEvents : $_selectedEvents');
//   //   print('_events : $_events');
//   //   return ListView(
//   //     children: _selectedEvents
//   //         .map((event) => Container(
//   //               decoration: BoxDecoration(
//   //                 border: Border.all(width: 0.2),
//   //                 borderRadius: BorderRadius.circular(25),
//   //               ),
//   //               margin: EdgeInsets.all(10.0),
//   //               child: ListTile(
//   //                 title: Center(child: Text(event.toString())),
//   //                 onTap: () => print('$event tapped!'),
//   //               ),
//   //             ))
//   //         .toList(),
//   //   );
//   // }
// }
