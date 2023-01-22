import 'package:async/async.dart';
import 'package:flutter/material.dart';

import '../../utils/utils.dart';
import '../widgets.dart';

class TranslatorFutureBuilder extends StatefulWidget {
  const TranslatorFutureBuilder({
    Key? key,
    required this.futureFunction,
    required this.englishTextChild,
    required this.isTitleShimmerTile,
  }) : super(key: key);

  final Future<String> futureFunction;
  final Widget englishTextChild;
  final bool isTitleShimmerTile;

  @override
  _TranslatorFutureBuilderState createState() =>
      _TranslatorFutureBuilderState();
}

class _TranslatorFutureBuilderState extends State<TranslatorFutureBuilder> {
  late AsyncMemoizer _asyncMemoizer;

  @override
  void initState() {
    super.initState();
    _asyncMemoizer = AsyncMemoizer();
  }

  _fetchData() async {
    return _asyncMemoizer.runOnce(() async {
      return await widget.futureFunction;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _fetchData(),
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          return widget.isTitleShimmerTile
              ? Text(
                  snapshot.data as String,
                  style: AppTextStyles.bodyHead(),
                  textAlign: TextAlign.center,
                )
              : Text(
                  snapshot.data as String,
                  style: AppTextStyles.body(),
                  textAlign: TextAlign.justify,
                );
        }

        if (snapshot.hasError) {
          return Container(child: widget.englishTextChild);
        }

        return widget.isTitleShimmerTile
            ? ShimmerTile.radiusSquare(
                width: 100,
                height: 10,
                shapeBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
              )
            : const TextShimmerLoader();
      },
    );
  }
}

class TextShimmerLoader extends StatelessWidget {
  const TextShimmerLoader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List values = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];

    return Column(
      children: values
          .map(
            (e) => Column(
              children: [
                ShimmerTile.radiusSquare(
                  width: double.infinity,
                  height: 10,
                  shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(15)),
              ],
            ),
          )
          .toList(),
    );
  }
}
