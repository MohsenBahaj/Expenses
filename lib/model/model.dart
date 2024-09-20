import 'package:uuid/uuid.dart';

enum Category { food, travel, study, liesure }

const uuid = Uuid();

class Expense {
  final String uid;
  final String title;
  final double amount;
  DateTime date;
  final Category category;

  Expense(
      {required this.date,
      required this.category,
      required this.title,
      required this.amount})
      : uid = uuid.v4();
}

class ExpenseBucket {
  final Category category;
  final List<Expense> expenses;

  ExpenseBucket(this.category, this.expenses);
  ExpenseBucket.forchart(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((element) => element.category == category)
            .toList();

  double get total {
    double sum = 0;
    for (var element in expenses) {
      sum += element.amount;
    }
    return sum;
  }
}
