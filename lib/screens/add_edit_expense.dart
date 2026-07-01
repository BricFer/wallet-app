import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/core/constants/constants.dart';
import 'package:wallet_app/core/providers/provider.dart';
import 'package:wallet_app/core/themes/app_decoration.dart';
import 'package:wallet_app/core/themes/container_theme.dart';
import 'package:wallet_app/models/expense/expense_request.dart';
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
  String? _selectedCurrency;

  final _commerceController = TextEditingController();
  final _conceptController = TextEditingController();
  final _amountController = TextEditingController();
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
    final _containerTheme = Theme.of(context).extension<AppContainerTheme>()!;

    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
              surfaceContainer: _containerTheme
                  .backgroundColor, // Color de fondo del calendario
              onSurface: _containerTheme
                  .fontColorVariant, // Color del texto de los días
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: _containerTheme
                    .fontColorVariant, // Color de los botones (CANCELAR / ACEPTAR)
              ),
            ),
            datePickerTheme: DatePickerThemeData(
              backgroundColor: _containerTheme.backgroundColor,
              headerForegroundColor: _containerTheme.fontColorVariant,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  Future<void> _loadExpense() async {
    // TODO: Revisar si debería de ser el AuthProvider o el UserProvider

    context.read<UserProvider>().loadUser();
    final userId = context.read<UserProvider>().user?.userId;

    await context.read<ExpenseProvider>().loadExpenseDetail(
      userId!,
      widget.expenseId!,
    );

    if (!mounted) return;

    final expense = context.read<ExpenseProvider>().selectedExpense;

    if (expense == null) return;

    setState(() {
      _selectedCategoryId = expense.categoryId;
      _selectedGroupId = expense.groupId;
      _selectedPaymentMethodId = expense.paymentMethodId;
      _selectedCurrency = expense.currency;

      _selectedDate = expense.date;
    });

    _commerceController.text = expense.commerce;
    _conceptController.text = expense.concept ?? '';
    _amountController.text = expense.amount.toString();
    _noteController.text = expense.note ?? '';
  }

  @override
  void dispose() {
    _commerceController.dispose();
    _conceptController.dispose();
    _amountController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_isSubmitting) return;

    // Se verifica que el usuario agregó un importe y en caso de no haberlo hecho en lugar de romper la ejecución estas líneas previenen que se envíe el formulario
    final amount = double.tryParse(_amountController.text);

    if (amount == null) {
      debugPrint('Invalid amount');
      return;
    }

    // Superada la validación se establece el _isSubmitting a true para prevenir que el usuario pueda enviar varias veces el formulario (clic varias veces a enviar)
    setState(() {
      _isSubmitting = true;
    });

    final userId = context.read<UserProvider>().user?.userId;
    _isSubmitting = true;

    final dto = ExpenseRequest(
      categoryId: _selectedCategoryId,
      groupId: _selectedGroupId,
      paymentMethodId: _selectedPaymentMethodId,
      commerce: _commerceController.text.trim(),
      amount: amount,
      currency: _selectedCurrency ?? 'EUR',
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
        userId!,
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
    final _containerTheme = Theme.of(context).extension<AppContainerTheme>()!;
    final _colorScheme = Theme.of(context).colorScheme;

    final provider = context.watch<ExpenseProvider>();
    final userProvider = context.watch<UserProvider>();
    final defaultCurrency = userProvider.user?.defaultCurrency;

    //TODO: Recuperar el PaymentMethod por defecto
    final defaultMethod = -1;

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
              children: [
                TransactionCurrencyDropdown(
                  selectedCurrency: _selectedCurrency ?? defaultCurrency,
                  onChanged: (value) {
                    setState(() {
                      _selectedCurrency = value;
                    });
                  },
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
                containerBackgroud: _colorScheme.primary,
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
                          ? FaIcon(
                              AppIcons.filledCalendarIcon,
                              color: _containerTheme.iconContainerColor,
                            )
                          : Icon(
                              AppIcons.calendarIcon,
                              color: _containerTheme.iconContainerColor,
                            ),
                    ),
                  ),
                  TransactionPaymentMethodDropdown(
                    selectedMethodId: _selectedPaymentMethodId ?? defaultMethod,
                    onChanged: (value) {
                      setState(() {
                        _selectedPaymentMethodId = value;
                      });
                    },
                  ),
                  Icon(
                    AppIcons.cameraIcon,
                    color: _containerTheme.iconContainerColor,
                  ),
                ],
              ),
            ),
            SizedBox(height: AppDimens.height48),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Deshabilita el _submit mientras se envía la información al backend
        onPressed: _isSubmitting ? null : _submit,

        // Muestra un circulo de "cargando" mientras se envía la información al backend
        child: _isSubmitting
            ? const SizedBox(
                width: AppDimens.width20,
                height: AppDimens.height20,
                child: CircularProgressIndicator(strokeWidth: AppDimens.width1),
              )
            : const FaIcon(FontAwesomeIcons.check),
      ),
    );
  }
}
