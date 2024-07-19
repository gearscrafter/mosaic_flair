import 'package:flutter/material.dart';
import '../atoms/button.dart';
import '../atoms/text.dart';
import '../data/cart_data.dart';
import '../foundation/color_foundation.dart';
import '../foundation/dimension_foundation.dart';
import '../foundation/strings_foundation.dart';

/// `CartSummary` es un widget que muestra un resumen del carrito de compras.
///
/// ### Atributos:
/// - `items`: Una lista de elementos del carrito.
/// - `onCheckout`: Función que se ejecuta cuando se realiza el pago.
/// - `onRemoveItem`: Función que se ejecuta cuando se elimina un elemento del carrito.

class CartSummary extends StatefulWidget {
  /// Una lista de elementos del carrito.
  final List<CartItem> items;

  /// Función que se ejecuta cuando se realiza el pago.
  final Function(List<ProductQuantity> products)? onCheckout;

  /// Función que se ejecuta cuando se elimina un elemento del carrito.
  final Function(int index)? onRemoveItem;

  /// Constructor para crear una instancia de `CartSummary`.
  const CartSummary({
    super.key,
    required this.items,
    this.onCheckout,
    this.onRemoveItem,
  });

  @override
  State<CartSummary> createState() => _CartSummaryState();
}

class _CartSummaryState extends State<CartSummary> {
  /// Incrementa la cantidad de un elemento del carrito.
  void _increaseQuantity(int index) {
    setState(() {
      widget.items[index].quantity++;
    });
  }

  /// Decrementa la cantidad de un elemento del carrito.
  void _decreaseQuantity(int index) {
    setState(() {
      if (widget.items[index].quantity > 1) {
        widget.items[index].quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double total =
        widget.items.fold(0, (sum, item) => sum + item.price * item.quantity);
    final size = MediaQuery.of(context).size;

    return Semantics(
      label: 'Resumen del carrito de compras',
      child: SizedBox(
        height: size.height - 80,
        width: size.width,
        child: Column(
          children: [
            Expanded(
              child: Semantics(
                label: 'Lista de artículos en el carrito',
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.items.length,
                  itemBuilder: (context, index) {
                    final item = widget.items[index];
                    return Dismissible(
                      key: UniqueKey(),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      onDismissed: (direction) {
                        if (direction == DismissDirection.endToStart) {
                          if (widget.onRemoveItem != null) {
                            widget.onRemoveItem!(index);
                          }
                          setState(() {
                            widget.items.removeAt(index);
                          });
                        }
                      },
                      child: Semantics(
                        hint:
                            'Artículo: ${item.name}, Cantidad: ${item.quantity}, Precio unitario: \$${item.price.toStringAsFixed(2)}, Total: \$${(item.price * item.quantity).toStringAsFixed(2)}',
                        child: ListTile(
                          leading: (item.image ?? '').isNotEmpty
                              ? Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                        borderRadiusDimensions),
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
                                    borderRadius: BorderRadius.circular(
                                        borderRadiusDimensions),
                                    child: item.image != null
                                        ? Image.network(
                                            item.image!,
                                            fit: BoxFit.cover,
                                          )
                                        : const SizedBox.shrink(),
                                  ),
                                )
                              : const SizedBox.shrink(),
                          title: Semantics(
                            hint: 'Nombre del artículo: ${item.name}',
                            child: Text(item.name),
                          ),
                          subtitle: Semantics(
                            label: 'Cantidad: ${item.quantity}',
                            child: Text('$amountLabelString: ${item.quantity}'),
                          ),
                          trailing: Semantics(
                            hint:
                                'Controles para ajustar la cantidad del artículo',
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Semantics(
                                  label: 'quitar item',
                                  hint: 'quitar item',
                                  child: IconButton(
                                    icon: const Icon(Icons.remove),
                                    onPressed: () => _decreaseQuantity(index),
                                  ),
                                ),
                                AppText(
                                  text: '${item.quantity}',
                                  textColor: textColorPrimary,
                                ),
                                Semantics(
                                  label: 'Añadir item',
                                  hint: 'Añadir item',
                                  child: IconButton(
                                    icon: const Icon(Icons.add),
                                    onPressed: () => _increaseQuantity(index),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                AppText(
                                  text:
                                      '\$${(item.price * item.quantity).toStringAsFixed(2)}',
                                  textColor: textColorPrimary,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Semantics(
                hint: 'Resumen del total y botón de pago',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Semantics(
                      label: 'Total del carrito: \$${total.toStringAsFixed(2)}',
                      child: AppText(
                        text:
                            '$totalLabelString: \$${total.toStringAsFixed(2)}',
                        textColor: textColorPrimary,
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Semantics(
                      hint: 'Botón para realizar el pago',
                      child: AppButton(
                        labelColor: textColorPrimary,
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
                        label: payLabelString,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
