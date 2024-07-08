class CartItem {
  final int id;
  final String name;
  final String? image;
  double price;
  int quantity;

  CartItem({
    required this.id,
    required this.name,
    this.image,
    required this.price,
    required this.quantity,
  });
}

class ProductQuantityEntity {
  int productId;
  int quantity;

  ProductQuantityEntity({
    required this.productId,
    required this.quantity,
  });
}
