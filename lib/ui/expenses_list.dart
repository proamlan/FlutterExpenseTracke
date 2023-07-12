import 'package:expense_tracker/models/Expense.dart';
import 'package:expense_tracker/ui/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.removeExpense});

  final Function(Expense expense) removeExpense;

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) => Dismissible(
            key: ValueKey(expenses[index]),
            background: Container(
                color: Theme.of(context).colorScheme.error,
                margin: Theme.of(context).cardTheme.margin),
            onDismissed: (item) {
              print(" Dismissed$item");
              removeExpense(expenses[index]);
            },
            child: ExpenseItem(expense: expenses[index])));
  }
}
