import 'package:flutter/material.dart';

import '../atoms/process_button.dart';
import '../data/product_dart.dart';
import '../foundation/color_foundation.dart';
import '../organisms/product_detail.dart';

/// `DetailsTemplate` es un widget que representa la plantilla de detalles de un producto.
///
/// ### Atributos:
/// - `product`: El producto a mostrar.
/// - `onAddToCart`: Función que se ejecuta cuando se añade el producto al carrito.

class DetailsTemplate extends StatefulWidget {
  /// El producto a mostrar.
  final Product? product;

  /// Función que se ejecuta cuando se añade el producto al carrito.
  final Function(Product? product, int quantity)? onAddToCart;

  /// Constructor para crear una instancia de `DetailsTemplate`.
  const DetailsTemplate({super.key, this.product, this.onAddToCart});

  @override
  State<DetailsTemplate> createState() => _DetailsTemplateState();
}

class _DetailsTemplateState extends State<DetailsTemplate> {
  int _quantity = 1;

  /// Incrementa la cantidad del producto.
  void _increaseQuantity() {
    setState(() {
      _quantity++;
    });
  }

  /// Decrementa la cantidad del producto.
  void _decreaseQuantity() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductDetail(
              title: widget.product?.name ?? 'Producto 1',
              description: widget.product?.description ??
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
              image: widget.product?.image,
              price: widget.product?.price ?? 20.0,
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: _decreaseQuantity,
                  icon: const Icon(Icons.remove),
                ),
                Text(
                  _quantity.toString(),
                  style: const TextStyle(fontSize: 18),
                ),
                IconButton(
                  onPressed: _increaseQuantity,
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            ProcessButton(
              steps: const ["Add to cart"],
              leftOnTap: () {
                Navigator.pop(context);
              },
              centerOnTap: () {
                widget.onAddToCart!(widget.product, _quantity);
              },
            ),
            SizedBox(
              height: size.height * 0.15,
            ),
          ],
        ),
      ),
    );
  }
}
