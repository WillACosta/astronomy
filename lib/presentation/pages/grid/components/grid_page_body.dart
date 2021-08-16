import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../domain/entities/media.dart';
import '../../../utils/utils.dart';

class GridPageBody extends StatelessWidget {
  GridPageBody({Key? key, required this.list}) : super(key: key);
  final List<Media> list;
  final dateFormat = DateFormat('dd/MM/yyyy');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: list.length,
        itemBuilder: (_, int index) {
          return Card(
            color: AppColors.accent,
            elevation: 0,
            borderOnForeground: false,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  list[index].url,
                  fit: BoxFit.cover,
                ),
                Container(
                  color: Colors.black.withOpacity(0.3),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          list[index].title,
                          style: AppTextStyles.bodySmall(fontSize: 12),
                        ),
                        Text(
                          dateFormat.format(list[index].date),
                          style: AppTextStyles.bodySmallest,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
