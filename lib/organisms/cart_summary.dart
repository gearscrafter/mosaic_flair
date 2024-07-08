import 'package:flutter/material.dart';
import '../atoms/button.dart';
import '../atoms/text.dart';
import '../data/cart_data.dart';
import '../foundation/color_foundation.dart';
import '../foundation/dimension_foundation.dart';

class CartSummary extends StatefulWidget {
  final List<CartItem> items;
  final Function(List<ProductQuantity> products)? onCheckout;

  const CartSummary({
    super.key,
    required this.items,
    this.onCheckout,
  });

  @override
  State<CartSummary> createState() => _CartSummaryState();
}

class _CartSummaryState extends State<CartSummary> {
  void _increaseQuantity(int index) {
    setState(() {
      widget.items[index].quantity++;
    });
  }

  void _decreaseQuantity(int index) {
    setState(() {
      if (widget.items[index].quantity > 1) {
        widget.items[index].quantity--;
      }
    });
  }

  void _removeItem(int index) {
    setState(() {
      widget.items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    double total =
        widget.items.fold(0, (sum, item) => sum + item.price * item.quantity);
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height - 80,
      width: size.width,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.items.length,
              itemBuilder: (context, index) {
                final item = widget.items[index];
                return Dismissible(
                  key: Key(item.name),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  onDismissed: (direction) {
                    if (direction == DismissDirection.endToStart) {
                      _removeItem(index);
                    }
                  },
                  child: ListTile(
                    leading: (item.image ?? '').isNotEmpty
                        ? Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(borderRadiusDimensions),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.4),
                                  spreadRadius: 0.7,
                                  blurRadius: 1,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(borderRadiusDimensions),
                              child: item.image != null
                                  ? Image.network(
                                      item.image!,
                                      fit: BoxFit.cover,
                                    )
                                  : const SizedBox.shrink(),
                            ),
                          )
                        : const SizedBox.shrink(),
                    title: Text(item.name),
                    subtitle: Text('Quantity: ${item.quantity}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () => _decreaseQuantity(index),
                        ),
                        AppText(text: '${item.quantity}'),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () => _increaseQuantity(index),
                        ),
                        const SizedBox(width: 10),
                        AppText(
                          text:
                              '\$${(item.price * item.quantity).toStringAsFixed(2)}',
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  text: 'Total: \$${total.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AppButton(
                  onPressed: () {
                    if (widget.onCheckout != null) {
                      final List<ProductQuantity> products = widget.items
                          .map((item) => ProductQuantity(
                                productId: item.id,
                                quantity: item.quantity,
                              ))
                          .toList();
                      widget.onCheckout!(products);
                    }
                  },
                  backColor: accentColor1,
                  width: size.width * 0.3,
                  label: 'Pagar',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
