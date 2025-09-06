import 'package:flutter/material.dart';
import '../auth/auth_service.dart';
import 'add_transaction.dart';
import 'transaction_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthService _authService = AuthService();
  String? userEmail;

  @override
  void initState() {
    super.initState();
    userEmail = _authService.currentUserEmail();
  }

  void logout() async {
    await _authService.signOut();
    if (mounted) {
      Navigator.pushReplacementNamed(context, "/login");
    }
  }

  void navigateToAddTransaction() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddTransactionPage()),
    ).then((_) => setState(() {})); // Refresh when returning
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wallet Tracker"),
        actions: [
          IconButton(onPressed: logout, icon: const Icon(Icons.logout)),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.purple[50],
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome, ${userEmail ?? ''}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Your Wallet Balance:",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 5),
                const Text(
                  "৳0.00",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
          const Expanded(child: TransactionListPage()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: navigateToAddTransaction,
        backgroundColor: Colors.purple,
        child: const Icon(Icons.add),
      ),
    );
  }
}
