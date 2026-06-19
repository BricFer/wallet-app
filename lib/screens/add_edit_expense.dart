import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/core/constants/dimens.dart';
import 'package:wallet_app/core/constants/icons.dart';
import 'package:wallet_app/core/constants/paddings.dart';
import 'package:wallet_app/core/constants/strings.dart';
import 'package:wallet_app/core/providers/auth_provider.dart';
import 'package:wallet_app/core/themes/app_decoration.dart';
import 'package:wallet_app/core/themes/container_theme.dart';
import 'package:wallet_app/models/expense/expense_detail_response.dart';
import 'package:wallet_app/service/expense_service.dart';
import 'package:wallet_app/widgets/widgets.dart';

class AddEditExpenseScreen extends StatefulWidget {
  const AddEditExpenseScreen({super.key, this.expenseId});

  final int? expenseId;

  @override
  State<AddEditExpenseScreen> createState() => _AddEditExpenseScreenState();
}

class _AddEditExpenseScreenState extends State<AddEditExpenseScreen> {
  final ExpenseService _service = ExpenseService();

  late ExpenseDetailResponse expense;
  late int? expenseId;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    expenseId = widget.expenseId;
    _loadExpense();
  }

  Future<void> _loadExpense() async {
    final userId = context.read<AuthProvider>().userId;
    expense = await _service.getExpenseInfo(userId, expenseId);

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final containerTheme = Theme.of(context).extension<AppContainerTheme>()!;
    final _colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: CustomAppBar(title: Strings.addExpense),
      floatingActionButton: FloatingActionButton(onPressed: () => () {
        
      }),
      body: Form(
        child: ListView(
          padding: AppPaddings.paddingLTR16B106,
          children: [
            TransactionGroup(),
            TransactionInput(
              labelText: Strings.commerce,
              hintText: 'Ex. Mercadona',
              icon: FontAwesomeIcons.basketShopping,
            ),
            TransactionInput(labelText: Strings.concept, hintText: 'Ex. Weekly buying'),
            TransactionInput(
              labelText: Strings.amount,
              hintText: 'Ex. 0,00€',
              keyboardType: TextInputType.number,
              icon: AppIcons.euroFaIcon,
            ),
            //
            TransactionType(),
            TransactionInput(labelText: Strings.note, maxLength: 150, showCursor: true),
            SizedBox(height: AppDimens.height48),
            CustomContainer(
              decoration: AppDecoration.container(
                context,
                containerBackgroud: _colorScheme.tertiary,
                showGradient: false,
              ),
        
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(AppIcons.calendarIcon),
                  Text(
                    Strings.paymentMethod,
                    style: TextStyle(color: containerTheme.fontColorTransaction),
                  ),
                  Icon(AppIcons.cameraIcon),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
