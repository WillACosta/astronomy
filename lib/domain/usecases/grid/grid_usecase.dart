import '../../models/grid_page_dto.dart';

import '../../../core/types/types.dart';

abstract class GridUseCase {
  ListOfMediaType getMediaList(GridPageDto dto);
}
