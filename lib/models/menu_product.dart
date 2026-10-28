import 'drink_product.dart';
import 'food_product.dart';

abstract class MenuProduct {
  final int? _id;
  final String _name;
  final double _price;
  final String _category;
  final String _description;
  final String _art;

  MenuProduct({
    int? id,
    required String name,
    required double price,
    required String category,
    required String description,
    required String art,
  })  : _id = id,
        _name = name,
        _price = price,
        _category = category,
        _description = description,
        _art = art;

  int? get id => _id;
  String get name => _name;
  double get price => _price;
  String get category => _category;
  String get description => _description;

  String get art => _art;

  String get type;

  int get prepMinutes;

  String get optionLabel;

  List<String> get options;

  String get prepLabel => 'Siap sekitar $prepMinutes mnt';

  Map<String, Object?> toMap() {
    return {
      if (_id != null) 'id': _id,
      'name': _name,
      'price': _price,
      'category': _category,
      'description': _description,
      'art': _art,
      'type': type,
    };
  }

  factory MenuProduct.fromMap(Map<String, Object?> map) {
    return map['type'] == 'drink'
        ? DrinkProduct.fromMap(map)
        : FoodProduct.fromMap(map);
  }
}
