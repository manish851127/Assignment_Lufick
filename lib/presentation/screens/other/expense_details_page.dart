import 'package:assignment_lufick/core/ui.dart';
import 'package:flutter/material.dart';

class ExpenseDetailsPage extends StatefulWidget {
  final int? expense;
  final String? title;
  const ExpenseDetailsPage({super.key,required this.expense,required this.title});

  @override
  State<ExpenseDetailsPage> createState() => _ExpenseDetailsPageState();
  static const String routeName='expense';
}

class _ExpenseDetailsPageState extends State<ExpenseDetailsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.title}'),),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Total expense of this month',style: TextStyles.heading3,),

          Text('Rs. ${widget.expense}',style: TextStyles.heading1,),
        ],
      ),),
    );
  }
}