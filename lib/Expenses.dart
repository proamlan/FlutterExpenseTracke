import 'package:expense_tracker/models/Expense.dart';
import 'package:expense_tracker/ui/expenses_list.dart';
import 'package:expense_tracker/ui/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: "Flutter Course",
        amount: 19.99,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: "Cinema",
        amount: 15.69,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  void _addExpense(Expense expense) {
    print("Got Expense data in Parent Screen");
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpenses(Expense expense) {
    print("Remove expense called${expense.title}");
    final index = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("${expense.title} Deleted"),
      action: SnackBarAction(
        label: "Undo",
        onPressed: () {
          setState(() {
            _registeredExpenses.insert(index, expense);
          });
        },
      ),
    ));
  }

  void _openAddExpensesBottomSheet() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewExpense(onAddExpense: _addExpense));
  }

  @override
  Widget build(BuildContext context) {
    var mainContent;
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        removeExpense: _removeExpenses,
      );
    } else {
      mainContent = const Center(child: Text("No expenses found"));
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: _openAddExpensesBottomSheet, icon: Icon(Icons.add))
        ],
        title: const Text("Expense"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          const Text(
            ' The charts',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, ),
          ),
          const SizedBox(height: 10),
          Expanded(child: mainContent)
        ],
      ),
    );
  }
}
