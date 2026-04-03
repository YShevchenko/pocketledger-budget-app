import '../models/envelope.dart';

abstract class EnvelopeRepository {
  Future<List<Envelope>> getAll();
  Future<Envelope?> getById(String id);
  Future<void> insert(Envelope envelope);
  Future<void> update(Envelope envelope);
  Future<void> delete(String id);
  Future<int> count();
  Future<void> resetAllSpent();
  Future<void> updateSpentAmount(String id, double spentAmount);
}
