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

class ProductQuantity {
  int productId;
  int quantity;

  ProductQuantity({
    required this.productId,
    required this.quantity,
  });
}
