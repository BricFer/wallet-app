import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/core/constants/constants.dart';
import 'package:wallet_app/core/constants/default_currency.dart';
import 'package:wallet_app/core/providers/auth_provider.dart';
import 'package:wallet_app/core/providers/category_provider.dart';
import 'package:wallet_app/core/providers/expense_provider.dart';
import 'package:wallet_app/core/themes/app_decoration.dart';
import 'package:wallet_app/core/themes/container_theme.dart';
import 'package:wallet_app/models/expense/expense_request.dart';
import 'package:wallet_app/widgets/transactions/transaction_group_dropdown.dart';
import 'package:wallet_app/widgets/widgets.dart';

class AddEditExpenseScreen extends StatefulWidget {
  const AddEditExpenseScreen({super.key, this.expenseId});

  final int? expenseId;

  @override
  State<AddEditExpenseScreen> createState() => _AddEditExpenseScreenState();
}

class _AddEditExpenseScreenState extends State<AddEditExpenseScreen> {
  int? _selectedCategoryId;
  int? _selectedGroupId;
  int? _selectedPaymentMethodId;

  final _commerceController = TextEditingController();
  final _conceptController = TextEditingController();
  final _amountController = TextEditingController();
  final _currencyController = TextEditingController();
  final _noteController = TextEditingController();

  DateTime? _selectedDate;

  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CategoryProvider>().loadCategories();
      if (widget.expenseId != null) {
        _loadExpense();
      }
    });
  }

  Future<void> _selectDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  Future<void> _loadExpense() async {
    final userId = context.read<AuthProvider>().userId!;

    await context.read<ExpenseProvider>().loadExpenseDetail(
      userId,
      widget.expenseId!,
    );

    if (!mounted) return;

    final expense = context.read<ExpenseProvider>().selectedExpense;

    if (expense == null) return;

    setState(() {
      _selectedCategoryId = expense.categoryId;
      _selectedGroupId = expense.groupId;
      _selectedPaymentMethodId = expense.paymentMethodId;

      _selectedDate = expense.date;
    });

    _commerceController.text = expense.commerce;
    _conceptController.text = expense.concept ?? '';
    _amountController.text = expense.amount.toString();
    _currencyController.text = expense.currency;
    _noteController.text = expense.note ?? '';
  }

  @override
  void dispose() {
    _commerceController.dispose();
    _conceptController.dispose();
    _amountController.dispose();
    _currencyController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_isSubmitting) return;

    // Se verifica que el usuario agrego un importe y en caso de no haberlo hecho en lugar de romper la ejecución. Estas líneas previenen que se envíe el formulario
    final amount = double.tryParse(_amountController.text);

    if (amount == null) {
      debugPrint('Invalid amount');
      return;
    }

    // Superada la validación se establece el _isSubmitting a true para prevenir que el usuario pueda enviar varias veces el formulario (clic varias veces a enviar)
    setState(() {
      _isSubmitting = true;
    });

    final userId = context.read<AuthProvider>().userId!;
    _isSubmitting = true;

    final dto = ExpenseRequest(
      categoryId: _selectedCategoryId,
      groupId: _selectedGroupId,
      paymentMethodId: _selectedPaymentMethodId,
      commerce: _commerceController.text.trim(),
      amount: amount,
      currency: _currencyController.text,
      concept: _conceptController.text.trim().isEmpty
          ? null
          : _conceptController.text.trim(),
      note: _noteController.text.trim().isEmpty
          ? null
          : _noteController.text.trim(),
      date: _selectedDate ?? DateTime.now(),
    );

    try {
      await context.read<ExpenseProvider>().saveExpense(
        userId,
        dto,
        widget.expenseId,
      );
      if (!mounted) return;
      context.go('/transactions');
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final containerTheme = Theme.of(context).extension<AppContainerTheme>()!;
    final _colorScheme = Theme.of(context).colorScheme;
    final Color inputColor = Theme.of(context).colorScheme.primary;

    final provider = context.watch<ExpenseProvider>();

    // Me permite determinar si estoy creando un gasto o modificandolo
    final isEditMode = widget.expenseId != null;

    if (provider.isLoadingDetail) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: CustomAppBar(
        title: isEditMode ? Strings.editExpense : Strings.addExpense,
      ),
      body: Form(
        child: ListView(
          padding: AppPaddings.paddingLTR16B106,
          children: [
            TransactionCategoriesDropdown(
              selectedCategoryId: _selectedCategoryId,
              onChanged: (value) {
                setState(() {
                  _selectedCategoryId = value;
                });
              },
            ),
            SizedBox(height: AppDimens.height18),
            TransactionGroupDropdown(
              selectedGroupId: _selectedGroupId,
              onChanged: (value) {
                setState(() {
                  _selectedGroupId = value;
                });
              },
            ),
            SizedBox(height: AppDimens.height18),
            TransactionInput(
              labelText: Strings.commerce,
              hintText: 'Ex. Mercadona',
              icon: FontAwesomeIcons.basketShopping,
              controller: _commerceController,
            ),
            SizedBox(height: AppDimens.height36),
            TransactionInput(
              labelText: Strings.concept,
              hintText: 'Ex. Weekly buying',
              controller: _conceptController,
            ),
            SizedBox(height: AppDimens.height36),
            Row(
              spacing: AppDimens.spacing16,
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownMenu<String>(
                  textAlign: TextAlign.center,
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                  menuHeight: AppDimens.height150,
                  menuStyle: MenuStyle(
                    backgroundColor: WidgetStateProperty.all(
                      _colorScheme.surface,
                    ),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppDimens.radius12),
                        side: BorderSide(
                          color: _colorScheme.secondary,
                          width: AppDimens.width2,
                        ),
                      ),
                    ),
                  ),
                  inputDecorationTheme: InputDecorationTheme(
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(AppDimens.radius12),
                      ),
                      borderSide: BorderSide(
                        color: inputColor,
                        width: AppDimens.width2,
                      ),
                    ),

                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: inputColor,
                        width: AppDimens.width2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(AppDimens.radius12),
                      ),
                      borderSide: BorderSide(
                        color: inputColor,
                        width: AppDimens.width2,
                      ),
                    ),
                  ),
                  dropdownMenuEntries: [
                    for (final currency in DefaultCurrency.currencies)
                      DropdownMenuEntry(
                        value: currency.code,
                        label: currency.symbol,
                        style: ButtonStyle(),
                      ),
                  ],
                ),
                Expanded(
                  child: TransactionInput(
                    labelText: Strings.amount,
                    hintText: 'Ex. 0,00€',
                    keyboardType: TextInputType.number,
                    icon: AppIcons.euroFaIcon,
                    controller: _amountController,
                  ),
                ),
              ],
            ),
            SizedBox(height: AppDimens.height18),
            TransactionInput(
              labelText: Strings.note,
              maxLength: 150,
              showCursor: true,
              controller: _noteController,
            ),
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
                  Tooltip(
                    message: _selectedDate == null
                        ? 'Select date'
                        : DateFormat('dd/MM/yyyy').format(_selectedDate!),
                    child: GestureDetector(
                      onTap: _selectDate,
                      child: _selectedDate != null
                          ? FaIcon(AppIcons.filledCalendarIcon)
                          : Icon(
                              AppIcons.calendarIcon,
                              color: _selectedDate != null
                                  ? _colorScheme.primary
                                  : containerTheme.iconColor,
                            ),
                    ),
                  ),
                  Text(
                    Strings.paymentMethod,
                    style: TextStyle(
                      color: containerTheme.fontColorTransaction,
                    ),
                  ),
                  Icon(AppIcons.cameraIcon),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: AppPaddings.paddingAll24,
        child: FloatingActionButton(
          // Deshabilita el _submit mientras se envía la información al backend
          onPressed: _isSubmitting ? null : _submit,

          // Muestra un circulo de "cargando" mientras se envía la información al backend
          child: _isSubmitting
              ? const SizedBox(
                  width: AppDimens.width20,
                  height: AppDimens.height20,
                  child: CircularProgressIndicator(
                    strokeWidth: AppDimens.width1,
                  ),
                )
              : const FaIcon(FontAwesomeIcons.check),
        ),
      ),
    );
  }
}
