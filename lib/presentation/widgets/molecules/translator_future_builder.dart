import 'package:astronomy/presentation/utils/utils.dart';
import 'package:astronomy/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TranslatorFutureBuilder extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureFunction,
      // future: Future.delayed(Duration(minutes: 5)),
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          return isTitleShimmerTile
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
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Ops! Ocorreu um erro na tradução do texto!'),
              action: SnackBarAction(
                label: 'Ok',
                onPressed: () {},
              ),
            ),
          );
          return Container(child: englishTextChild);
        }

        return isTitleShimmerTile
            ? ShimmerTile.radiusSquare(
                width: 100,
                height: 10,
                shapeBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
              )
            : TextShimmerLoader();
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
