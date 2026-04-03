import '../models/transaction.dart';

abstract class TransactionRepository {
  Future<List<Transaction>> getAll();
  Future<List<Transaction>> getByEnvelopeId(String envelopeId);
  Future<List<Transaction>> getByDateRange(DateTime start, DateTime end);
  Future<List<Transaction>> getByEnvelopeAndDateRange(
    String envelopeId,
    DateTime start,
    DateTime end,
  );
  Future<Transaction?> getById(String id);
  Future<void> insert(Transaction transaction);
  Future<void> update(Transaction transaction);
  Future<void> delete(String id);
  Future<void> deleteByEnvelopeId(String envelopeId);
  Future<double> sumByEnvelopeId(String envelopeId);
  Future<double> sumByEnvelopeIdAndDateRange(
    String envelopeId,
    DateTime start,
    DateTime end,
  );
}
