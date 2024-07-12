import 'package:flutter/material.dart';
import '../molecules/product_card.dart';

/// `ProductList` es un widget que muestra una lista de productos en un grid.
///
/// ### Atributos:
/// - `products`: Una lista de widgets `ProductCard` que representan los productos.
/// - `productSelected`: Función que se ejecuta cuando se selecciona un producto (opcional).
/// - `onTapProductSelected`: Callback que se ejecuta cuando se presiona un producto (opcional).
/// - `onScrollChange`: Función que se ejecuta cuando cambia el estado de desplazamiento (opcional).
/// - `aspectHeight`: La relación de aspecto de la altura del grid (por defecto es 7).

class ProductList extends StatefulWidget {
  /// Una lista de widgets `ProductCard` que representan los productos.
  final List<ProductCard> products;

  /// Función que se ejecuta cuando se selecciona un producto (opcional).
  final Function(int id)? productSelected;

  /// Callback que se ejecuta cuando se presiona un producto (opcional).
  final VoidCallback? onTapProductSelected;

  /// Función que se ejecuta cuando cambia el estado de desplazamiento (opcional).
  final Function(bool isScrolling)? onScrollChange;

  /// La relación de aspecto de la altura del grid (por defecto es 7).
  final double aspectHeight;

  /// Constructor para crear una instancia de `ProductList`.
  const ProductList({
    super.key,
    required this.products,
    this.productSelected,
    this.onTapProductSelected,
    this.onScrollChange,
    this.aspectHeight = 7,
  });

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  /// Última posición de desplazamiento registrada.
  double _lastScrollPosition = 0.0;

  /// Indica si se está desplazando hacia arriba.
  bool _isScrollingUp = false;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification is ScrollUpdateNotification) {
          final currentScrollPosition = notification.metrics.pixels;
          _isScrollingUp = currentScrollPosition > _lastScrollPosition;
          _lastScrollPosition = currentScrollPosition;
          if (widget.onScrollChange != null) {
            widget.onScrollChange!(true);
          }
          setState(() {});
        } else if (notification is ScrollEndNotification) {
          if (widget.onScrollChange != null) {
            widget.onScrollChange!(false);
          }
        }
        return true;
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          return GridView.builder(
            itemCount: widget.products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: (constraints.maxWidth /
                      (MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? 5.2
                          : 1.2)) /
                  (constraints.maxHeight /
                      ((MediaQuery.of(context).orientation ==
                              Orientation.portrait)
                          ? widget.aspectHeight
                          : 0.5)),
            ),
            itemBuilder: (context, index) {
              final product = widget.products[index];
              return Center(
                child: GestureDetector(
                  onTap: () {
                    if (widget.productSelected != null) {
                      widget.productSelected!(product.id);
                      if (widget.onTapProductSelected != null) {
                        widget.onTapProductSelected!();
                      }
                    }
                  },
                  child: ProductCard(
                    id: product.id,
                    title: product.title,
                    category: product.category,
                    image: product.image,
                    price: product.price,
                    topBoxHeight: _isScrollingUp ? 80.0 : 70.0,
                    bottomBoxHeight: _isScrollingUp ? 0.0 : 10.0,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
