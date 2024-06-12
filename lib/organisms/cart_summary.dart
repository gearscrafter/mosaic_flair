import 'package:flutter/material.dart';

class CartSummary extends StatelessWidget {
  final List<CartItem> items;
  final VoidCallback? onCheckout;

  const CartSummary({
    super.key,
    required this.items,
    this.onCheckout,
  });

  @override
  Widget build(BuildContext context) {
    double total =
        items.fold(0, (sum, item) => sum + item.price * item.quantity);

    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return ListTile(
              leading: Image.network(item.image, width: 50, height: 50),
              title: Text(item.name),
              subtitle: Text('Quantity: ${item.quantity}'),
              trailing:
                  Text('\$${(item.price * item.quantity).toStringAsFixed(2)}'),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: \$${total.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                onPressed: onCheckout,
                child: const Text('Checkout'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CartItem {
  final String name;
  final String image;
  final double price;
  final int quantity;

  CartItem({
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
  });
}
