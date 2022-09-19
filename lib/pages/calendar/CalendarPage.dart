import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'CalendarProvider.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  void initState() {
    super.initState();
    CalendarProvider().openCalendar(context);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CalendarProvider(),
      child: const Scaffold(
        body: BodyCalendar(),
      ),
    );
  }
}

class BodyCalendar extends StatelessWidget {
  const BodyCalendar({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          GestureDetector(
              onTap: (() {
                context.read<CalendarProvider>().openCalendar(context);
              }),
              child: Text(context.watch<CalendarProvider>().titleDate)),
          Text(
            context.watch<CalendarProvider>().familiarDate.toString(),
            style: const TextStyle(fontFamily: "Poppins"),
          ),
          // Text(
          //   'SOS ${context.watch<CalendarProvider>().dayBeen.toString()} ngày',
          //   style: const TextStyle(fontFamily: "Poppins"),
          // ),
        ],
      ),
    );
  }
}
