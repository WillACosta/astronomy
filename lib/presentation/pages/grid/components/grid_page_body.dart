import 'package:flutter/material.dart';

import '../../../../external/dependency_injection/locator.dart';
import '../../../../application/shared/shared_store.dart';
import '../../../../domain/entities/media.dart';
import '../../../widgets/widgets.dart';
import '../../../utils/utils.dart';

class GridPageBody extends StatelessWidget {
  GridPageBody({Key? key, required this.list}) : super(key: key);
  final List<Media> list;

  static final _sharedStore = locator<SharedStore>();

  @override
  Widget build(BuildContext context) {
    return AppPagesPadding(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: getProportionateScreenHeight(10),
          crossAxisSpacing: getProportionateScreenHeight(10),
        ),
        itemCount: list.length,
        itemBuilder: (_, int index) {
          return GridItemInkWell(
            media: list[index],
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
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
                          _sharedStore.dateFormat.format(list[index].date),
                          style: AppTextStyles.bodySmallest(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
