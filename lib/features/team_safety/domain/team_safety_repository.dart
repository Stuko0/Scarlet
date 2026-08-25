import 'team_member_status.dart';

abstract class TeamSafetyRepository {
  Stream<List<TeamMemberStatus>> get teamStatusStream;

  /// Inicia advertising+discovery. Devuelve false si faltan permisos.
  Future<bool> advertise(String teamId, String userId, String fullName);

  /// Publica el estado propio (emisión local + broadcast P2P).
  Future<void> sendStatus(TeamMemberStatus status);

  /// Corta todas las conexiones P2P sin cerrar el stream (permite rejoin).
  Future<void> disconnect();
}
