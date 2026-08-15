import 'package:flutter/material.dart';
import 'package:wallet_app/models/user/user_request.dart';
import 'package:wallet_app/models/user/user_response.dart';
import 'package:wallet_app/service/user_service.dart';

class UserProvider extends ChangeNotifier {
  final UserService _service = UserService();

  UserResponse? _user;
  bool isLoading = false;

  UserResponse? get user => _user;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> loadUser() async {
    // Si el user ya está cargado no hace falta volver a hacer la llamada al notifyListener
    if(_user != null) return; 
    
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
    _errorMessage = null;
    isLoading = true;
    notifyListeners();
    try {
      _user = await _service.saveUser(dto);
    } on Error catch (e) {
      _errorMessage = 'Something went wrong.';
      debugPrint(e.toString());
      rethrow; // El rethrow relanza el error desde UserProvider a la pantalla que lo llamó, si no se hace el catch de la pantalla "llamada" nunca se ejecutará y no se sabrá si falló.
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateUsername(int userId, String username) async {
    _errorMessage = null;
    isLoading = true;
    notifyListeners();
    try {
      await _service.updateUsername(userId, username);
      _user = _user?.copyWith(username: username);
    } on Error catch (e) {
      _errorMessage = 'It was not possible to update the nickname';
      debugPrint(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateFullname(int userId, String fullname) async {
    _errorMessage = null;
    isLoading = true;
    notifyListeners();
    try {
      await _service.updateFullname(userId, fullname);
      _user = _user?.copyWith(fullname: fullname);
    } catch (e) {
      _errorMessage = 'It was not possible to update the fullname';
      debugPrint(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updatePhoneNumber(int userId, String phoneNumber) async {
    _errorMessage = null;
    isLoading = true;
    notifyListeners();
    try {
      await _service.updatePhoneNumber(userId, phoneNumber);
      _user = _user?.copyWith(phoneNumber: phoneNumber);
    } catch (e) {
      _errorMessage = 'It was not possible to update the phone number';
      debugPrint(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateDateOfBirth(int userId, String date) async {
    _errorMessage = null;
    isLoading = true;
    notifyListeners();
    try {
      await _service.updateDateOfBirth(userId, date);
      _user = _user?.copyWith(dateOfBirth: DateTime.parse(date));
    } catch (e) {
      _errorMessage = 'It was not possible to update the date of birth';
      debugPrint(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateAddress(int userId, String address) async {
    _errorMessage = null;
    isLoading = true;
    notifyListeners();
    try {
      await _service.updateAddress(userId, address);
      _user = _user?.copyWith(address: address);
    } catch (e) {
      _errorMessage = 'It was not possible to update the address';
      debugPrint(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateCountry(int userId, String country) async {
    _errorMessage = null;
    isLoading = true;
    notifyListeners();
    try {
      await _service.updateCountry(userId, country);
      _user = _user?.copyWith(country: country);
    } catch (e) {
      _errorMessage = 'It was not possible to update the country';
      debugPrint(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateCurrency(int userId, String currency) async {
    _errorMessage = null;
    isLoading = true;
    notifyListeners();
    try {
      await _service.updateDefaultCurrency(userId, currency);
      _user = _user?.copyWith(defaultCurrency: currency);
    } catch (e) {
      _errorMessage = 'It was not possible to update the default currency';
      debugPrint(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
