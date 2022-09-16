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
    TextEditingController textEditingController = TextEditingController();
    return SafeArea(
      child: Column(
        children: [
          GestureDetector(
              onTap: (() {}),
              child: Text(context.watch<CalculateProvider>().a)),
          GestureDetector(
            child: TextFormField(
              onTap: () {
                context.read<CalculateProvider>().onTap(context);
              },
              decoration: const InputDecoration(
                  label: Text(''
                      // context.watch<CalculateProvider>().date1.toString(),
                      // style: const TextStyle(fontFamily: "Poppins"),
                      ),
                  border: const OutlineInputBorder()),
            ),
          ),
        ],
      ),
    );
  }
}
