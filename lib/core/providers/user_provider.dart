import 'package:flutter/material.dart';
import 'package:wallet_app/models/user/user_request.dart';
import 'package:wallet_app/models/user/user_response.dart';
import 'package:wallet_app/service/user_service.dart';

class UserProvider extends ChangeNotifier {
  final UserService _service = UserService();

  UserResponse? _user;
  bool isLoading = false;

  UserResponse? get user => _user;

  Future<void> loadUser() async {
    isLoading = true;
    notifyListeners();

    try {
      _user = await _service.getUserInfo();
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> saveUser(UserRequest dto) async {
    isLoading = true;
    notifyListeners();
    try {
      _user = await _service.saveUser(dto);
    } catch (e) {
      debugPrint(e.toString());
      rethrow; // El rethrow relanza el error desde UserProvider a la pantalla que lo llamó, si no se hace el catch de la pantalla "llamada" nunca se ejecutará y no se sabrá si falló.
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateUsername(int userId, String username) async {
    isLoading = true;
    notifyListeners();
    try {
      await _service.updateUsername(userId, username);
      _user = _user != null
          ? UserResponse(
              userId: _user!.userId,
              username: username,
              fullname: _user!.fullname,
              phoneNumber: _user!.phoneNumber,
              dateOfBirth: _user!.dateOfBirth,
              address: _user!.address,
              email: _user!.email,
              country: _user!.country,
              defaultCurrency: _user!.defaultCurrency,
            )
          : null;
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateFullname(int userId, String fullname) async {
    isLoading = true;
    notifyListeners();
    try {
      await _service.updateFullname(userId, fullname);
      _user = _user != null
          ? UserResponse(
              userId: _user!.userId,
              username: _user!.username,
              fullname: fullname,
              phoneNumber: _user!.phoneNumber,
              dateOfBirth: _user!.dateOfBirth,
              address: _user!.address,
              email: _user!.email,
              country: _user!.country,
              defaultCurrency: _user!.defaultCurrency,
            )
          : null;
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updatePhoneNumber(int userId, String phoneNumber) async {
    isLoading = true;
    notifyListeners();
    try {
      await _service.updatePhoneNumber(userId, phoneNumber);
      _user = _user != null
          ? UserResponse(
              userId: _user!.userId,
              username: _user!.username,
              fullname: _user!.fullname,
              phoneNumber: phoneNumber,
              dateOfBirth: _user!.dateOfBirth,
              address: _user!.address,
              email: _user!.email,
              country: _user!.country,
              defaultCurrency: _user!.defaultCurrency,
            )
          : null;
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateDateOfBirth(int userId, String date) async {
    isLoading = true;
    notifyListeners();
    try {
      await _service.updateDateOfBirth(userId, date);
      _user = _user != null
          ? UserResponse(
              userId: _user!.userId,
              username: _user!.username,
              fullname: _user!.fullname,
              phoneNumber: _user!.phoneNumber,
              dateOfBirth: DateTime.parse(date),
              address: _user!.address,
              email: _user!.email,
              country: _user!.country,
              defaultCurrency: _user!.defaultCurrency,
            )
          : null;
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateAddress(int userId, String address) async {
    isLoading = true;
    notifyListeners();
    try {
      await _service.updateAddress(userId, address);
      _user = _user != null
          ? UserResponse(
              userId: _user!.userId,
              username: _user!.username,
              fullname: _user!.fullname,
              phoneNumber: _user!.phoneNumber,
              dateOfBirth: _user!.dateOfBirth,
              address: address,
              email: _user!.email,
              country: _user!.country,
              defaultCurrency: _user!.defaultCurrency,
            )
          : null;
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateCountry(int userId, String country) async {
    isLoading = true;
    notifyListeners();
    try {
      await _service.updateCountry(userId, country);
      _user = _user != null
          ? UserResponse(
              userId: _user!.userId,
              username: _user!.username,
              fullname: _user!.fullname,
              phoneNumber: _user!.phoneNumber,
              dateOfBirth: _user!.dateOfBirth,
              address: _user!.address,
              email: _user!.email,
              country: country,
              defaultCurrency: _user!.defaultCurrency,
            )
          : null;
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateCurrency(int userId, String currency) async {
    isLoading = true;
    notifyListeners();
    try {
      await _service.updateDefaultCurrency(userId, currency);
      _user = _user != null
          ? UserResponse(
              userId: _user!.userId,
              username: _user!.username,
              fullname: _user!.fullname,
              phoneNumber: _user!.phoneNumber,
              dateOfBirth: _user!.dateOfBirth,
              address: _user!.address,
              email: _user!.email,
              country: _user!.country,
              defaultCurrency: currency,
            )
          : null;
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
