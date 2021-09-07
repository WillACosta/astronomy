import 'package:astronomy/domain/entities/media.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

import '../../domain/entities/grid_page_dto.dart';
import '../../domain/usecases/grid/grid_usecase.dart';
import 'grid_page_state.dart';

part 'grid_page_store.g.dart';

@Injectable()
class GridPageStore = _GridPageStoreBase with _$GridPageStore;

abstract class _GridPageStoreBase with Store {
  final GridUseCase _usecase;
  final dateFormat = DateFormat('dd/MM/yyyy');

  _GridPageStoreBase(this._usecase) {
    getMediaList();

    reaction((_) => _dateTimeRange, (value) {
      getMediaList();
    });
  }

  @observable
  GridPageState state = InitialState();

  @observable
  List<Media> mediaList = [];

  @observable
  DateTimeRange _dateTimeRange = DateTimeRange(
    start: DateTime.now().subtract(Duration(days: 7)),
    end: DateTime.now(),
  );

  DateTimeRange get getDateRange => _dateTimeRange;

  @computed
  String get getDateRangeLabel =>
      '${dateFormat.format(getDateRange.start)} - ${dateFormat.format(getDateRange.end)}';

  @action
  void setDateRange(DateTimeRange value) => _dateTimeRange = value;

  @action
  setState(GridPageState value) => state = value;

  @action
  getMediaList() async {
    setState(LoadingState());

    final result = await _usecase.getMediaList(
      GridPageDto(dateTimeRange: _dateTimeRange),
    );

    result.fold(
      (error) => setState(ErrorState(error)),
      (result) => setState(SuccessState(result)),
    );
  }
}
