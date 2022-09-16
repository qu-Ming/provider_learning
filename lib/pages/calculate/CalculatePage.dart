import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_provider/components/textfield_component.dart';
import 'package:test_provider/pages/calculate/CalculateProvider.dart';

class CalculatePage extends StatelessWidget {
  const CalculatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CalculateProvider(),
      child: Scaffold(
        body: BodyCalculate(),
      ),
    );
  }
}

class BodyCalculate extends StatelessWidget {
  BodyCalculate({
    Key? key,
  }) : super(key: key);
  // DateTime a = DateTime.now();
  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    return SafeArea(
      child: Column(
        children: [
          Container(
            child: GestureDetector(
                onTap: (() {
                  context.read<CalculateProvider>().dateTime();
                }),
                child: Text(context.watch<CalculateProvider>().a)),
          ),
          TextFormField(
            // controller: num2,
            keyboardType: TextInputType.datetime,
            decoration: InputDecoration(
                // errorText: isFirst
                //     ? null
                //     : (num2.text.isEmpty)
                //         ? 'Vui lòng nhập số vào'
                //         : null,
                label: Text(
                  'asd',
                  style: const TextStyle(fontFamily: "Poppins"),
                ),
                border: const OutlineInputBorder()),
          ),
        ],
      ),
    );
  }
}
