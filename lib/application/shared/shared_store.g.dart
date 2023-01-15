// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SharedStore on _SharedStoreBase, Store {
  late final _$isDownloadingImageAtom =
      Atom(name: '_SharedStoreBase.isDownloadingImage', context: context);

  @override
  bool get isDownloadingImage {
    _$isDownloadingImageAtom.reportRead();
    return super.isDownloadingImage;
  }

  @override
  set isDownloadingImage(bool value) {
    _$isDownloadingImageAtom.reportWrite(value, super.isDownloadingImage, () {
      super.isDownloadingImage = value;
    });
  }

  late final _$downloadImageAsyncAction =
      AsyncAction('_SharedStoreBase.downloadImage', context: context);

  @override
  Future<void> downloadImage({required String url}) {
    return _$downloadImageAsyncAction.run(() => super.downloadImage(url: url));
  }

  @override
  String toString() {
    return '''
isDownloadingImage: ${isDownloadingImage}
    ''';
  }
}
