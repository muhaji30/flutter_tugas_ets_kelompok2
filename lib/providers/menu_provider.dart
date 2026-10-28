import 'package:flutter/foundation.dart';

import '../models/menu_product.dart';
import '../services/database_helper.dart';

class MenuProvider extends ChangeNotifier {
  MenuProvider({DatabaseHelper? db}) : _db = db ?? DatabaseHelper.instance;

  final DatabaseHelper _db;

  List<MenuProduct> _all = [];
  bool _isLoading = false;
  String? _error;
  String _category = 'Semua';
  String _query = '';
  bool _simulateError = false;

  bool get isLoading => _isLoading;
  String? get error => _error;
  String get category => _category;
  String get query => _query;
  bool get simulateError => _simulateError;
  bool get hasData => _all.isNotEmpty;

  List<String> get categories => const ['Semua', 'Makanan', 'Minuman'];

  List<MenuProduct> get products {
    final q = _query.trim().toLowerCase();
    return _all.where((p) {
      final matchCategory = _category == 'Semua' || p.category == _category;
      final matchQuery = q.isEmpty || p.name.toLowerCase().contains(q);
      return matchCategory && matchQuery;
    }).toList();
  }

  List<MenuProduct> get popular => _all.take(2).toList();

  Future<void> loadMenu() async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    try {
      // Jeda singkat agar tampilan loading terlihat saat demo.
      await Future<void>.delayed(const Duration(milliseconds: 500));
      if (_simulateError) {
        throw StateError('Simulasi error untuk demo');
      }
      _all = await _db.getMenu();
    } catch (_) {
      _error = 'Gagal memuat menu. Silakan coba lagi.';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void setCategory(String value) {
    _category = value;
    notifyListeners();
  }

  void search(String value) {
    _query = value;
    notifyListeners();
  }

  Future<void> toggleSimulateError() async {
    _simulateError = !_simulateError;
    await loadMenu();
  }
}
