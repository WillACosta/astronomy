import 'package:flutter/material.dart';

class TranslatorFutureBuilder extends StatelessWidget {
  const TranslatorFutureBuilder({
    Key? key,
    required this.futureFunction,
  }) : super(key: key);

  final Future<String> futureFunction;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureFunction,
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data as String);
        }

        if (snapshot.hasError) {
          // return ;
          print('error');
        }

        return CircularProgressIndicator();
      },
    );
  }
}
