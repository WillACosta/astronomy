import 'package:astronomy/presentation/utils/utils.dart';
import 'package:astronomy/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class GridDetailPage extends StatelessWidget {
  const GridDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          MediaActionBar(),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            child: Column(
              children: [
                Text('Fire in the Space', style: AppTextStyles.bodyHead),
                Text('02/08/2021', style: AppTextStyles.bodySmallest),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Image.asset(AppImages.nasaSplashImage, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 400),
            child: SheetContainer(
              child: SingleChildScrollView(
                child: Text('AAA'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
