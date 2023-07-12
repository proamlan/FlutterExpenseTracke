import 'package:expense_tracker/models/Expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  final Expense expense;

  const ExpenseItem({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(expense.title,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text("\$${expense.amount.toStringAsFixed(2)}"),
                const Spacer(),
                Row(children: [
                  Icon(categoryIcons[expense.category]),
                  const SizedBox(width: 8),
                  Text(expense.formattedDate)
                ])
              ],
            )
          ],
        ),
      ),
    );
  }
}
