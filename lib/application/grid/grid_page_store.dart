import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'package:mobx/mobx.dart';

import 'package:astronomy/external/dependency_injection/locator.dart';
import 'package:astronomy/domain/usecases/grid/grid_usecase.dart';
import 'package:astronomy/domain/entities/grid_page_dto.dart';
import 'package:astronomy/domain/entities/media.dart';
import 'package:astronomy/application/shared/shared_store.dart';
import 'package:astronomy/application/grid/grid_page_state.dart';

part 'grid_page_store.g.dart';

@LazySingleton()
class GridPageStore = _GridPageStoreBase with _$GridPageStore;

abstract class _GridPageStoreBase with Store {
  final GridUseCase _usecase;
  List<ReactionDisposer>? _disposers;

  static final _sharedStore = serviceLocator<SharedStore>();

  _GridPageStoreBase(this._usecase) {
    getMediaList();

    _disposers ??= [
      reaction((_) => _dateTimeRange, (value) {
        getMediaList();
      })
    ];
  }

  @observable
  GridPageState state = const InitialState();

  @observable
  List<Media> mediaList = [];

  @observable
  DateTimeRange _dateTimeRange = DateTimeRange(
    start: DateTime.now().subtract(const Duration(days: 7)),
    end: DateTime.now(),
  );

  DateTimeRange get getDateRange => _dateTimeRange;

  @computed
  String get getDateRangeLabel =>
      '${_sharedStore.dateFormat.format(getDateRange.start)} - ${_sharedStore.dateFormat.format(getDateRange.end)}';

  @action
  void setDateRange(DateTimeRange value) => _dateTimeRange = value;

  @action
  setState(GridPageState value) => state = value;

  @action
  getMediaList() async {
    setState(const LoadingState());

    final result = await _usecase.getMediaList(
      GridPageDto(dateTimeRange: _dateTimeRange),
    );

    result.fold(
      (error) => setState(ErrorState(error)),
      (result) => setState(SuccessState(result)),
    );
  }

  dispose() {
    if (_disposers != null) {
      for (var dispose in _disposers!) {
        dispose();
      }
    }
  }
}
