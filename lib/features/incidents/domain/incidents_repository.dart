import 'fire_entity.dart';

abstract class IncidentsRepository {
  Future<List<Fire>> getActiveFires();
}
