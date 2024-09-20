import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:expenses/components/customtext_field.dart';
import 'package:expenses/model/model.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController c1 = TextEditingController();
  TextEditingController c2 = TextEditingController();
  TextEditingController c3 = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  final List<Expense> expenses = [
    Expense(
        date: DateTime.now(),
        category: Category.food,
        title: 'dinner',
        amount: 200),
    Expense(
        date: DateTime.now(),
        category: Category.food,
        title: 'lunch',
        amount: 150),
    Expense(
        date: DateTime.now(),
        category: Category.food,
        title: 'textbook',
        amount: 145),
    Expense(
        date: DateTime.now(),
        category: Category.food,
        title: 'petrol',
        amount: 158),
    Expense(
        date: DateTime.now(),
        category: Category.food,
        title: 'dinner',
        amount: 20),
    Expense(
        date: DateTime.now(),
        category: Category.food,
        title: 'dinner',
        amount: 30),
  ];

  void removeExpenses(Expense e) {
    setState(() {
      expenses.remove(e);
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final currentDate = DateTime.now();
    final firstDate = DateTime(currentDate.year - 1, currentDate.month);
    final lastDate = DateTime(currentDate.year, currentDate.month + 1);

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses'),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {
                showbottomsheet(context);
              },
              icon: const Icon(Icons.add),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (c, i) {
          return Dismissible(
            key: ValueKey(expenses[i]),
            onDismissed: (c) {
              removeExpenses(expenses[i]);
            },
            child: Card(
              child: ListTile(
                title: Text(
                  expenses[i].title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w700),
                ),
                subtitle: Text(expenses[i].date.toString()),
                trailing: Text(
                  '${expenses[i].amount}',
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<dynamic> showbottomsheet(BuildContext context) {
    String? category;
    List<String> options = ['food', 'travel', 'study', 'others'];

    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'New Expense',
                    style: TextStyle(fontSize: 20),
                  ),
                  CustomTextField(
                    name: 'Title',
                    controller: c1,
                  ),
                  CustomNumberField(
                    name: 'Amount',
                    controller: c2,
                  ),
                  DropdownButton<String>(
                    hint:
                        Text(category == null ? "Select category" : category!),
                    value: category,
                    items:
                        options.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newvalue) {
                      setState(() {
                        category = newvalue;
                      });
                    },
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton.icon(
                        onPressed: () async {
                          await _selectDate(context);
                        },
                        label: const Text('Select Date'),
                        icon: const Icon(Icons.calendar_month),
                        style: ButtonStyle(
                          iconColor: MaterialStateProperty.all(Colors.black),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.black),
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      if (category != null &&
                          c1.text.isNotEmpty &&
                          c2.text.isNotEmpty) {
                        setState(() {
                          expenses.add(Expense(
                            date: _selectedDate,
                            category: Category
                                .food, // This should be mapped to the selected category
                            title: c1.text,
                            amount: double.parse(c2.text),
                          ));
                        });

                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.success,
                          animType: AnimType.rightSlide,
                          title: '${c1.text} Added!',
                          desc: '${c1.text} was added and its cost ${c2.text}',
                          btnOkOnPress: () {
                            Navigator.of(context).pop();
                          },
                        )..show();
                      } else {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.error,
                          animType: AnimType.rightSlide,
                          title: 'Error!',
                          desc: 'Please fill in all fields.',
                          btnOkOnPress: () {},
                        )..show();
                      }
                    },
                    label: const Text('Add Expense'),
                    icon: const Icon(Icons.add),
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.black),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                          side: const BorderSide(width: 1, color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
