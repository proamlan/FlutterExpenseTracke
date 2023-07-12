import 'package:expense_tracker/models/Expense.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  final void Function(Expense expense) onAddExpense;

  const NewExpense({super.key, required this.onAddExpense});

  @override
  State<StatefulWidget> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _presentDatePicker() async {
    final now = DateTime.now();
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(now.year - 1, now.month, now.day),
        lastDate: now);
    print(pickedDate);
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _sumbitData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final isAmountValid = enteredAmount == null || enteredAmount <= 0;

    if (_titleController.text.trim().isEmpty ||
        isAmountValid ||
        _selectedDate == null) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text("Invalid Input"),
                content: const Text("Enter Valid Amount"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Okey"))
                ],
              ));
    }

    widget.onAddExpense(Expense(
        title: _titleController.text.trim(),
        amount: enteredAmount!,
        date: _selectedDate!,
        category: _selectedCategory));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(label: Text("Expense Name")),
          ),
          Row(
            children: [
              Expanded(
                  child: TextField(
                controller: _amountController,
                maxLength: 10,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    prefixText: "\$", label: Text("Expense Amount")),
              )),
              const SizedBox(width: 40),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(_selectedDate == null
                      ? "Select Date"
                      : formmater.format(_selectedDate!)),
                  IconButton(
                      onPressed: () {
                        _presentDatePicker();
                      },
                      icon: Icon(Icons.calendar_month))
                ],
              ))
            ],
          ),
          const SizedBox(
            height: 60,
          ),
          Row(
            children: [
              DropdownButton(
                  value: _selectedCategory,
                  items: Category.values
                      .map((category) => DropdownMenuItem(
                          value: category,
                          child: Text(category.name.toUpperCase())))
                      .toList(),
                  onChanged: (value) {
                    if (_selectedCategory == null) {
                      return;
                    } else {
                      _selectedCategory = value!;
                    }
                    print("Got selected Value $value");
                  }),
              const Spacer(),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel")),
              ElevatedButton(
                  onPressed: () {
                    print(_titleController.text);
                    print(_amountController.text);
                    _sumbitData();
                  },
                  child: const Text("Save Expense"))
            ],
          )
        ],
      ),
    );
  }
}
