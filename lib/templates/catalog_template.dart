import 'package:flutter/material.dart';
import 'package:mosaic_flair/molecules/menu.dart';
import '../data/category_data.dart';
import '../data/product_dart.dart';
import '../foundation/color_foundation.dart';
import '../molecules/appbar.dart';
import '../molecules/product_card.dart';
import '../organisms/synchronous_tab_bar.dart';

/// `CatalogTemplate` es un widget que representa la plantilla del catálogo de productos.
///
/// ### Atributos:
/// - `products`: Una lista opcional de tarjetas de productos a mostrar.
/// - `items`: Una lista opcional de categorías a mostrar en la barra de pestañas.
/// - `onTapHome`: Callback opcional que se ejecuta cuando se toca el botón de inicio.
/// - `onTapSupport`: Callback opcional que se ejecuta cuando se toca el botón de soporte.
/// - `onTapContact`: Callback opcional que se ejecuta cuando se toca el botón de contacto.
/// - `onTapSearch`: Callback opcional que se ejecuta cuando se toca el botón de búsqueda.
/// - `onTapCart`: Callback opcional que se ejecuta cuando se toca el botón del carrito.
/// - `getProduct`: Función opcional que se ejecuta cuando se selecciona un producto.
/// - `onProductTap`: Función opcional que se ejecuta cuando se toca una tarjeta de producto.

class CatalogTemplate extends StatefulWidget {
  /// Una lista opcional de tarjetas de productos a mostrar.
  final List<ProductCard>? products;

  /// Una lista opcional de categorías a mostrar en la barra de pestañas.
  final List<Category>? items;

  /// Callback opcional que se ejecuta cuando se toca el botón de inicio.
  final VoidCallback? onTapHome;

  /// Callback opcional que se ejecuta cuando se toca el botón de soporte.
  final VoidCallback? onTapSupport;

  /// Callback opcional que se ejecuta cuando se toca el botón de contacto.
  final VoidCallback? onTapContact;

  /// Callback opcional que se ejecuta cuando se toca el botón de búsqueda.
  final VoidCallback? onTapSearch;

  /// Callback opcional que se ejecuta cuando se toca el botón del carrito.
  final VoidCallback? onTapCart;

  /// Función opcional que se ejecuta cuando se selecciona un producto.
  final Function(Product? product)? getProduct;

  /// Función opcional que se ejecuta cuando se toca una tarjeta de producto.
  final void Function(ProductCard? product)? onProductTap;

  /// Constructor para crear una instancia de `CatalogTemplate`.
  const CatalogTemplate({
    this.products,
    this.onProductTap,
    this.onTapHome,
    this.onTapSupport,
    this.onTapContact,
    this.onTapCart,
    this.onTapSearch,
    this.items,
    this.getProduct,
    super.key,
  });

  @override
  State<CatalogTemplate> createState() => _CatalogTemplateState();
}

class _CatalogTemplateState extends State<CatalogTemplate> {
  bool _openMenu = false;
  bool _isScrolling = false;

  void _updateScrolling(bool isScrolling) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          _isScrolling = isScrolling;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          SynchronousTabBar(
            items: widget.items,
            onScrollChange: _updateScrolling,
            getProduct: widget.getProduct,
          ),
          Menu(
            isScrolling: _isScrolling,
            hasMenu: (openMenu) {
              setState(() {
                _openMenu = openMenu;
              });
            },
            onTapContact: widget.onTapContact,
            onTapHome: widget.onTapHome,
            onTapSupport: widget.onTapSupport,
            isHome: true,
          ),
          Appbar(
            openMenu: _openMenu,
            onTapCart: widget.onTapCart,
            onTapSearch: widget.onTapSearch,
          )
        ],
      ),
    );
  }
}
