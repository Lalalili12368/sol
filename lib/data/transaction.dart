class TransactionModel {
  final String title;
  final double amount;
  final String type; // Income or Expense
  final DateTime date;

  TransactionModel({
    required this.title,
    required this.amount,
    required this.type,
    required this.date,
  });

  static List<TransactionModel> transactions = [];
}
