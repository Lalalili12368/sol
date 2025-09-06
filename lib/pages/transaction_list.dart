import 'package:flutter/material.dart';
import '../data/transaction.dart';

class TransactionListPage extends StatelessWidget {
  const TransactionListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = TransactionModel.transactions;

    if (transactions.isEmpty) {
      return const Center(
        child: Text("No transactions yet", style: TextStyle(fontSize: 16)),
      );
    }

    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final tx = transactions[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: ListTile(
            leading: Icon(
              tx.type == 'Income' ? Icons.arrow_downward : Icons.arrow_upward,
              color: tx.type == 'Income' ? Colors.green : Colors.red,
            ),
            title: Text(tx.title),
            subtitle: Text(
              "${tx.type} • ${tx.date.day}/${tx.date.month}/${tx.date.year}",
            ),
            trailing: Text(
              "৳${tx.amount.toStringAsFixed(2)}",
              style: TextStyle(
                color: tx.type == 'Income' ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
