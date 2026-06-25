import 'package:flutter/material.dart';
import 'package:wallet_app/models/payment_method/payment_method_request.dart';
import 'package:wallet_app/models/payment_method/payment_method_response.dart';
import 'package:wallet_app/service/payment_method_service.dart';

class PaymentMethodProvider extends ChangeNotifier {
  final PaymentMethodService _service = PaymentMethodService();

  List<PaymentMethodResponse> _methods = [];
  Map<int, PaymentMethodResponse> _byId = {};
  PaymentMethodResponse? selectedMethod;

  bool isLoading = false;
  bool isLoadingDetails = false;

  List<PaymentMethodResponse> get methods => _methods;

  PaymentMethodResponse? getById(int? id) {
    if (id == null) return null;
    return _byId[id];
  }

  Future<void> loadActiveMethods(
    int userId, {
    bool forceRefresh =
        false, //Previene que no se recarguen los métodos de pago
  }) async {
    if (!forceRefresh && _methods.isNotEmpty) return;

    isLoading = true;
    notifyListeners();

    try {
      _methods = await _service.getAllActivePaymentMethods(userId);
      _byId = {for (final method in methods) method.paymentMethodId: method};
    } catch (e, stackTrace) {
      debugPrint(e.toString());
      debugPrint(stackTrace.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadAllMethods(int userId, {bool forceRefresh = false}) async {
    if (!forceRefresh && _methods.isNotEmpty) return;

    isLoading = true;
    notifyListeners();

    try {
      _methods = await _service.getAllPaymentMethods(userId);
      _byId = {for (final method in methods) method.paymentMethodId: method};
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadMethodInfo(int userId, int? methodId) async {
    if (methodId == null) {
      selectedMethod = null;
      notifyListeners();
      return;
    }

    // Esto evita una petición HTTP si ya se ha cargado la lista previamente.
    final cached = _byId[methodId];

    if (cached != null) {
      selectedMethod = cached;
      notifyListeners();
      return;
    }

    isLoadingDetails = true;
    notifyListeners();

    try {
      final method = await _service.getPaymentMethodInfo(methodId, userId);

      selectedMethod = method;

      _byId[methodId] = selectedMethod!;

      final index = _methods.indexWhere(
        (method) => method.paymentMethodId == methodId,
      );

      if (index != -1) {
        _methods[index] = method;
      }
    } catch (e) {
      debugPrint(e.toString());
      selectedMethod = null;
    } finally {
      isLoadingDetails = false;
      notifyListeners();
    }
  }

  Future<PaymentMethodResponse?> saveMethod(
    int userId,
    PaymentMethodRequest dto,
    int? paymentMethodId,
  ) async {
    isLoading = true;
    notifyListeners();

    try {
      if (paymentMethodId == null) {
        final createdMethod = await _service.savePaymentMethod(dto, userId);

        _methods.insert(0, createdMethod);
        _byId[createdMethod.paymentMethodId] = createdMethod;
        selectedMethod = createdMethod;

        notifyListeners();

        return createdMethod;
      } else {
        final updatedMethod = await _service.updatePaymentMethod(
          dto,
          paymentMethodId,
          userId,
        );

        final index = _methods.indexWhere(
          (method) => method.paymentMethodId == paymentMethodId,
        );

        if (index != -1) {
          _methods[index] = updatedMethod;
        }

        _byId[paymentMethodId] = updatedMethod;

        if (selectedMethod?.paymentMethodId == paymentMethodId) {
          selectedMethod = updatedMethod;
        }

        return updatedMethod;
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteMethod(int userId, int methodId) async {
    isLoading = true;
    notifyListeners();

    try {
      await _service.deletePaymentMethod(userId, methodId);

      _methods.removeWhere((method) => method.paymentMethodId == methodId);
      _byId.remove(methodId);

      if (selectedMethod?.paymentMethodId == methodId) {
        selectedMethod = null;
      }
    } catch (e) {
      debugPrint(e.toString());
      debugPrint('Failed to delete payment method.');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void clear() {
    _methods = [];
    _byId = {};
    selectedMethod = null;
    notifyListeners();
  }

  // Cuando se cierre ventana de edición se limpian los datos
  void clearSelectedMethod() {
    selectedMethod = null;
    notifyListeners();
  }
}
