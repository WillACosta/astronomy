import 'package:astronomy/presentation/utils/utils.dart';
import 'package:flutter/material.dart';

class GridPageBody extends StatelessWidget {
  const GridPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        children: List.generate(
          20,
          (index) => Container(
            color: AppColors.accent,
            child: Text(
              '$index',
              style: AppTextStyles.bodyHead,
            ),
          ),
        ),
      ),
    );
  }
}
