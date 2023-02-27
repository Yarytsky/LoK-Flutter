import 'package:flutter/material.dart';
import 'package:lok/Reusable%20Widgets/BaseAppBar.dart';
import 'package:lok/Reusable%20Widgets/BaseDrawler.dart';
import 'package:lok/constants/colors.dart';
import 'package:lok/constants/utils.dart';
import 'package:table_calendar/table_calendar.dart';


class TableBasicsExample extends StatefulWidget {
  @override
  _TableBasicsExampleState createState() => _TableBasicsExampleState();
}

class _TableBasicsExampleState extends State<TableBasicsExample> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseWhite,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: BaseAppBar(
          appBarText: 'Profile',
        ),
      ),
      drawer: BaseDrawler(),
      body: TableCalendar(
        firstDay: kFirstDay,
        lastDay: kLastDay,
        focusedDay: _focusedDay,
        calendarFormat: _calendarFormat,
        selectedDayPredicate: (day) {
          // Use `selectedDayPredicate` to determine which day is currently selected.
          // If this returns true, then `day` will be marked as selected.

          // Using `isSameDay` is recommended to disregard
          // the time-part of compared DateTime objects.
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(_selectedDay, selectedDay)) {
            // Call `setState()` when updating the selected day
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          }
        },
        onFormatChanged: (format) {
          if (_calendarFormat != format) {
            // Call `setState()` when updating calendar format
            setState(() {
              _calendarFormat = format;
            });
          }
        },
        onPageChanged: (focusedDay) {
          // No need to call `setState()` here
          _focusedDay = focusedDay;
        },
      ),
    );
  }
}

// import 'dart:collection';
// import 'dart:html';
//
// import 'package:flutter/material.dart';
// import 'package:lok/constants/colors.dart';
// import 'package:table_calendar/table_calendar.dart';
//
// import 'package:lok/Reusable%20Widgets/BaseAppBar.dart';
// import 'package:lok/Reusable%20Widgets/BaseDrawler.dart';
//
// import '../constants/utils.dart';
//
//
//
// class Calendar extends StatefulWidget {
//   @override
//   _CalendarState createState() => _CalendarState();
// }
//
// class _CalendarState extends State<Calendar> {
//   final ValueNotifier<List<Event>> _selectedEvents = ValueNotifier([]);
//
//   // Using a `LinkedHashSet` is recommended due to equality comparison override
//   final Set<DateTime> _selectedDays = LinkedHashSet<DateTime>(
//     equals: isSameDay,
//     hashCode: getHashCode,
//   );
//
//   CalendarFormat _calendarFormat = CalendarFormat.month;
//   DateTime _focusedDay = DateTime.now();
//
//   @override
//   void dispose() {
//     _selectedEvents.dispose();
//     super.dispose();
//   }
//
//   List<Event> _getEventsForDay(DateTime day) {
//     // Implementation example
//     return kEvents[day] ?? [];
//   }
//
//   List<Event> _getEventsForDays(Set<DateTime> days) {
//     // Implementation example
//     // Note that days are in selection order (same applies to events)
//     return [
//       for (final d in days) ..._getEventsForDay(d),
//     ];
//   }
//   void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
//     // Update values in a Set
//     setState(() {
//       if (_selectedDays.contains(selectedDay)) {
//         _selectedDays.remove(selectedDay);
//       } else {
//         _selectedDays.add(selectedDay);
//       }
//     });
//
//     _selectedEvents.value = _getEventsForDays(_selectedDays);
//     _focusedDay = focusedDay;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(50),
//         child: BaseAppBar(),
//       ),
//       drawer: BaseDrawler(),
//       body: Column(
//         children: [
//           TableCalendar<Event>(
//             calendarStyle: CalendarStyle(
//               markerDecoration: BoxDecoration(
//                 color: PrimaryPurple5,
//                 shape: BoxShape.circle,
//               ),
//               selectedDecoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: SecondOrange1,
//
//               ),
//             ),
//             headerStyle: HeaderStyle(
//               titleCentered: true,
//               decoration: BoxDecoration(
//                 color: PrimaryPurple4,
//               )
//             ),
//             firstDay: kFirstDay,
//             lastDay: kLastDay,
//             focusedDay: _focusedDay,
//             calendarFormat: CalendarFormat.month,
//             eventLoader: _getEventsForDay,
//             startingDayOfWeek: StartingDayOfWeek.monday,
//             selectedDayPredicate: (day) => isSameDay(day, _focusedDay),
//             onDaySelected: _onDaySelected,
//             onPageChanged: (focusedDay) {
//               _focusedDay = focusedDay;
//             },
//           ),
//           const SizedBox(height: 8.0),
//           Expanded( // настройка списку вибраного предмету
//             child: ValueListenableBuilder<List<Event>>(
//               valueListenable: _selectedEvents,
//               builder: (context, value, _) {
//                 return ListView.builder(
//                   itemCount: value.length,
//                   itemBuilder: (context, index) {
//                     return Container(
//                       margin: const EdgeInsets.symmetric(
//                         horizontal: 12.0,
//                         vertical: 4.0,
//                       ),
//                       decoration: BoxDecoration(
//                         border: Border.all(),
//                         borderRadius: BorderRadius.circular(12.0),
//                       ),
//                       child: Column(
//                         children: [
//                           Text('${value[index]}'),
//                         ],
//                       ),
//                       // ListTile(
//                       //   onTap: () => print('${value[index]}'),
//                       //   title: Text('${value[index]}'),
//                       // ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }