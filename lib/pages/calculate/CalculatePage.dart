import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_provider/pages/calculate/CalculateProvider.dart';

class CalculatePage extends StatelessWidget {
  const CalculatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CalculateProvider(),
      child: const Scaffold(
        body: BodyCalculate(),
      ),
    );
  }
}

class BodyCalculate extends StatelessWidget {
  const BodyCalculate({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          GestureDetector(
              onTap: (() {
                context.read<CalculateProvider>().dateTime(context);
              }),
              child: Text(context.watch<CalculateProvider>().a)),
          Text(
            context.watch<CalculateProvider>().date.toString(),
            style: const TextStyle(fontFamily: "Poppins"),
          ),
          Text(
            'Đã bên nhau được ${context.watch<CalculateProvider>().dayBeen.toString()} ngày',
            style: const TextStyle(fontFamily: "Poppins"),
          ),
        ],
      ),
    );
  }
}
