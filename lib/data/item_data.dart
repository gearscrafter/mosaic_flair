import 'category_data.dart';
import 'product_dart.dart';

class Item {
  final Category? category;
  final Product? product;
  Item({this.category, this.product});

  bool get isCategory => category != null;
}
