class CartItem {
  final String name;
  final String? image;
  double price;
  int quantity;

  CartItem({
    required this.name,
    this.image,
    required this.price,
    required this.quantity,
  });
}
