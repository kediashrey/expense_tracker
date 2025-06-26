import 'package:expense_tracker/expense_model.dart';
import 'package:expense_tracker/expsense_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

//controllers

final newExpensesNameController = TextEditingController();
final newExpensesAmountController = TextEditingController();

class _HomePageState extends State<HomePage> {
  void addNewExpense() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add new expense'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: newExpensesNameController),

            TextField(controller: newExpensesAmountController),
          ],
        ),

        actions: [
          //save
          MaterialButton(onPressed: save, child: Text('save')),

          MaterialButton(onPressed: cancel, child: Text('cancel')),
        ],
      ),
    );
  }

  void save() {
    ExpenseItem newExpense = ExpenseItem(
      name: newExpensesNameController.text,
      amount: newExpensesAmountController.text,
      dateTime: DateTime.now(),
    );

    Provider.of<ExpsenseData>(context, listen: false).addnewExpense(newExpense);

    Navigator.pop(context);
    clear();
  }

  void cancel() {
    Navigator.pop(context);
    clear();
  }

  //clear

  void clear() {
    newExpensesAmountController.clear();
    newExpensesNameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpsenseData>(
      builder: (conetxt, value, child) => Scaffold(
        backgroundColor: Colors.grey[300],
        floatingActionButton: FloatingActionButton(
          onPressed: addNewExpense,
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: value.getAllExpenseList().length,
          itemBuilder: (context, index) =>
              ListTile(title: Text(value.getAllExpenseList()[index].name),
              subtitle: Text(value.getAllExpenseList()[index].dateTime.toString()),
              trailing: Text('Rs.'+ value.getAllExpenseList()[index].amount),
              ),

        ),
      ),
    );
  }
}
