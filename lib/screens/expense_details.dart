import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/core/constants/constants.dart';
import 'package:wallet_app/core/providers/user_provider.dart';
import 'package:wallet_app/core/themes/container_theme.dart';
import 'package:wallet_app/models/expense/expense_detail_response.dart';
import 'package:wallet_app/service/expense_service.dart';
import 'package:wallet_app/widgets/widgets.dart';

class ExpenseDetails extends StatefulWidget {
  const ExpenseDetails({super.key, required this.expenseId});

  final int expenseId;

  @override
  State<ExpenseDetails> createState() => _ExpenseDetailsState();
}

class _ExpenseDetailsState extends State<ExpenseDetails> {
  final ExpenseService _service = ExpenseService();

  ExpenseDetailResponse? expense;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserProvider>().loadUser();
      _loadExpense();
    });
  }

  Future<void> _loadExpense() async {
    try {
      final userId = context.read<UserProvider>().user?.userId;
      final expenseId = widget.expenseId;

      final result = await _service.getExpenseInfo(userId, expenseId);

      setState(() {
        expense = result;
        isLoading = false;
      });
    } catch (e, stack) {
      debugPrint('>>> ERROR: $e');
      debugPrint('>>> STACK: $stack');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator.adaptive());
    }
    final _textTheme = Theme.of(context).textTheme;
    final _containerTheme = Theme.of(context).extension<AppContainerTheme>()!;

    final alias =
        expense?.paymentMethodAlias ?? expense?.paymentMethodType?.typeName;

    final currencies = DefaultCurrency.currencies;
    final currencySymbol = currencies
        .firstWhere((c) => c.code == expense?.currency)
        .symbol;
    final numberFormat = NumberFormat('#,##0.00');

    return Scaffold(
      appBar: CustomAppBar(title: Strings.expenseDetails),
      body: Padding(
        padding: AppPaddings.paddingAll16,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          spacing: AppDimens.spacing24,
          children: [
            SizedBox(height: AppDimens.spacing16),
            CustomContainer(
              child: Column(
                spacing: AppDimens.spacing16,
                children: [
                  TransactionDetailsRow(
                    label: 'Group\n',
                    subtext: expense?.groupName ?? 'No group assigned',
                  ),
                  TransactionDetailsRow(
                    label: 'Category\n',
                    subtext: expense?.categoryName ?? 'No category assigned',
                  ),
                  TransactionDetailsRow(
                    label: 'Commerce\n',
                    subtext: expense?.commerce ?? '',
                  ),
                  TransactionDetailsRow(
                    label: 'Concept\n',
                    subtext: expense?.concept ?? 'No concept',
                  ),
                  TransactionDetailsRow(
                    label: 'Amount\n',
                    subtext:
                        '${numberFormat.format(expense?.amount)}$currencySymbol',
                  ),
                  TransactionDetailsRow(
                    label: 'Payment Method\n',
                    subtext: alias!,
                  ),
                  TransactionDetailsRow(
                    label: 'Note\n',
                    subtext: expense?.note ?? '',
                  ),
                ],
              ),
            ),
            // TODO: Agregar estilos al boton y redirigir a /add-expense
            SizedBox(
              width: AppDimens.width152,
              height: AppDimens.height56,
              child: ElevatedButton(
                style: TextButton.styleFrom(
                  shadowColor: _containerTheme.containerShadow,
                ),
                onPressed: () => (_) {
                  context.push(
                    '/edit-expense/${widget.expenseId}',
                    extra: widget.expenseId,
                  );
                },
                child: Text(
                  Strings.edit,
                  style: _textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
