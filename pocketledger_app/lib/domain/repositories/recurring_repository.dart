import '../models/recurring_bill.dart';

abstract class RecurringRepository {
  Future<List<RecurringBill>> getAll();
  Future<List<RecurringBill>> getActive();
  Future<RecurringBill?> getById(String id);
  Future<void> insert(RecurringBill bill);
  Future<void> update(RecurringBill bill);
  Future<void> delete(String id);
  Future<void> updateLastProcessed(String id, DateTime date);
}
