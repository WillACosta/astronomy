import 'package:astronomy/domain/models/grid_page_dto.dart';

import 'package:astronomy/core/types/types.dart';

abstract class GridUseCase {
  ListOfMediaType getMediaList(GridPageDto dto);
}
