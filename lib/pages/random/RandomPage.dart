import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_provider/pages/random/RandomProvider.dart';
import 'package:test_provider/utils/const/app_dimens.dart';

class RandomPage extends StatelessWidget {
  const RandomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RandomProvider(),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          body: SafeArea(
            child: RandomBody(),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class RandomBody extends StatelessWidget {
  RandomBody({
    Key? key,
  }) : super(key: key);

  TextEditingController num1 = TextEditingController();
  TextEditingController num2 = TextEditingController();

  String stringFirst = 'Random';
  bool isFirst = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(children: [
        Text(
          isFirst
              ? stringFirst
              : (num1.text.isEmpty || num2.text.isEmpty)
                  ? 'Lỗi cú pháp 🙂'
                  : context.watch<RandomProvider>().randomNum,
          style: const TextStyle(
              fontFamily: "Poppins",
              fontSize: AppDimens.icon_size_30,
              fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.only(top: AppDimens.padding_20),
          child: TextFormField(
            controller: num1,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                errorText: isFirst
                    ? null
                    : (num1.text.isEmpty)
                        ? 'Vui lòng nhập số vào'
                        : null,
                label: Text(
                  context.watch<RandomProvider>().firstNum.toString(),
                  style: const TextStyle(fontFamily: "Poppins"),
                ),
                border: const OutlineInputBorder()),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          controller: num2,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              errorText: isFirst
                  ? null
                  : (num2.text.isEmpty)
                      ? 'Vui lòng nhập số vào'
                      : null,
              label: Text(
                context.watch<RandomProvider>().lastNum.toString(),
                style: const TextStyle(fontFamily: "Poppins"),
              ),
              border: const OutlineInputBorder()),
        ),
        ElevatedButton(
          onPressed: () {
            if (isFirst) {
              isFirst = !isFirst;
            }
            context.read<RandomProvider>().clicked(
                int.parse(num1.text.isNotEmpty ? num1.text : "-1"),
                int.parse(num2.text.isNotEmpty ? num2.text : "-1"));
          },
          child: const Text(
            'Xác nhận',
            style: TextStyle(fontFamily: "Poppins"),
          ),
        ),
        GestureDetector(
            onTap: () {
              (context.read<RandomProvider>().go(context));
            },
            child: const Text('go')),
      ]),
    );
  }
}
