import '../../../infraestructure/models/media_model.dart';
import 'json_serializable_converter.dart';

const Map<Type, JsonFactory> factoryConverters = {
  MediaModel: MediaModel.fromMap,
  List<MediaModel>: MediaModel.fromMap,
};
