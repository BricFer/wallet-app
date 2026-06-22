import 'package:flutter/material.dart';
import 'package:wallet_app/models/category/category_response.dart';
import 'package:wallet_app/service/category_service.dart';

class CategoryProvider extends ChangeNotifier {
  final CategoryService _service = CategoryService();

  List<CategoryResponse> _categories = [];
  Map<int, CategoryResponse> _byId = {};

  bool isLoading = false;

  List<CategoryResponse> get categories => _categories;

  CategoryResponse? getById(int? id) {
    if (id == null) return null;
    return _byId[id];
  }

  Future<void> loadCategories() async {
    if (_categories.isNotEmpty) return;

    isLoading = true;
    notifyListeners();

    try {
      _categories = await _service.getAllCategories();
      _byId = {
        for (final category in _categories) category.categoryId: category,
      };
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadCategoriesByType(String type) async {
    if (_categories.isNotEmpty) return;

    isLoading = true;
    notifyListeners();

    try {
      _categories = await _service.getAllCategoriesByType(type);
      _byId = {
        for(final category in _categories) category.categoryId: category,
      };
      
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
