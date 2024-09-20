# Expenses App

## Overview
The Expenses App allows users to track their expenses efficiently. Users can add, manage, and delete their expenses, providing them with a clear overview of their spending habits.

## Features
- **Add Expense**: Users can input the title, amount, date, and category of each expense.
- **Categorize Expenses**: Expenses are categorized into different types, such as Food, Travel, Study, and Leisure.
- **Total Calculation**: The app calculates the total amount spent in each category.
- **Delete Expenses**: Users can remove expenses they no longer wish to track.

## Models

### Expense
The `Expense` class represents a single expense entry with the following properties:
- `uid`: A unique identifier for each expense (generated using UUID).
- `title`: The title or description of the expense.
- `amount`: The monetary value of the expense.
- `date`: The date when the expense occurred.
- `category`: The category of the expense, which can be one of the following:
  - `food`
  - `travel`
  - `study`
  - `leisure`

#### Example
```dart
Expense expense = Expense(
  title: "Dinner",
  amount: 50.0,
  date: DateTime.now(),
  category: Category.food,
);
