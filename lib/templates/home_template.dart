import 'package:flutter/material.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

/// `HomeTemplate` es un widget que representa la plantilla principal de la aplicación.
/// Muestra una bienvenida al usuario, una lista de promociones y una lista de productos populares.
/// Además, incluye navegación a otras secciones de la aplicación.
///
/// ### Atributos:
/// - `userName`: El nombre del usuario.
/// - `promotionCards`: Una lista de tarjetas de promoción.
/// - `onTapSeeMore`: Función a ejecutar cuando se presiona "See more".
/// - `products`: Una lista de tarjetas de productos.
/// - `onTapHome`: Función a ejecutar cuando se presiona el botón de inicio.
/// - `onTapProducts`: Función a ejecutar cuando se presiona el botón de productos.
/// - `onTapSupport`: Función a ejecutar cuando se presiona el botón de soporte.
/// - `onTapContact`: Función a ejecutar cuando se presiona el botón de contacto.
/// - `onTapSearch`: Función a ejecutar cuando se presiona el botón de búsqueda.
/// - `onTapCart`: Función a ejecutar cuando se presiona el botón del carrito.
/// - `productSelected`: Función a ejecutar cuando se selecciona un producto.
/// - `onTapProductSelected`: Función a ejecutar cuando se selecciona un producto.

class HomeTemplate extends StatefulWidget {
  final String? userName;
  final List<PromotionCard>? promotionCards;
  final VoidCallback? onTapSeeMore;
  final List<ProductCard>? products;
  final VoidCallback? onTapHome;
  final VoidCallback? onTapProducts;
  final VoidCallback? onTapSupport;
  final VoidCallback? onTapContact;
  final VoidCallback? onTapSearch;
  final VoidCallback? onTapCart;
  final Function(int id)? productSelected;
  final VoidCallback? onTapProductSelected;

  const HomeTemplate(
      {this.userName,
      this.promotionCards,
      this.onTapSeeMore,
      this.products,
      this.onTapHome,
      this.onTapProducts,
      this.onTapSupport,
      this.onTapContact,
      this.onTapCart,
      this.onTapSearch,
      this.productSelected,
      this.onTapProductSelected,
      super.key});

  @override
  State<HomeTemplate> createState() => _HomeTemplateState();
}

class _HomeTemplateState extends State<HomeTemplate> {
  bool _isScrolling = false;
  bool _openMenu = false;

  /// Actualiza el estado de desplazamiento de la pantalla.
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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Semantics(
            label: 'Contenido principal',
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 90,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: paddingMediumDimension),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Semantics(
                          label: 'Saludo al usuario ${widget.userName}',
                          child: AppText(
                            text:
                                '$greetingsLabelString${widget.userName ?? 'Usuario'}',
                            textColor: textColorPrimary,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: fontSizeLargeDimension),
                          ),
                        ),
                        Semantics(
                          label: 'Ordena tu producto favorito',
                          child: AppText(
                            textColor: textColorPrimary,
                            text: orderYourProductLabelString,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Semantics(
                    label: 'Carrusel de promociones',
                    child: AppCarousel(
                        items: widget.promotionCards ??
                            [
                              const PromotionCard(
                                  description: 'Descuento al',
                                  image: null,
                                  percentage: 50),
                              const PromotionCard(
                                  description: 'Descuento al',
                                  image: null,
                                  percentage: 30)
                            ]),
                  ),
                  SizedBox(
                    height: paddingMediumDimension,
                  ),
                  Semantics(
                    label: 'Sección de productos populares',
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: paddingMediumDimension),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Semantics(
                            label: 'listado de productos populares',
                            hint: 'listado de productos populares',
                            child: AppText(
                              text: popularSectionLabelString,
                              textColor: textColorPrimary,
                              sizeText: SizeText.L,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Semantics(
                            label: 'Ver más productos',
                            hint: 'Ver más productos',
                            child: GestureDetector(
                              onTap: widget.onTapSeeMore,
                              child: AppText(
                                textColor: textColorPrimary,
                                text: seeMoreSectionLabelString,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: paddingMediumDimension,
                  ),
                  Semantics(
                    label: 'Lista de productos',
                    child: SizedBox(
                      height: size.height * 0.5,
                      child: ProductList(
                        aspectHeight: 4,
                        onTapProductSelected: widget.onTapProductSelected,
                        productSelected: widget.productSelected,
                        products: widget.products ??
                            [
                              const ProductCard(
                                id: 1,
                                title: 'Product 1',
                                category: 'category',
                                image: null,
                                price: 29.99,
                              ),
                              const ProductCard(
                                id: 2,
                                title: 'Product 2',
                                category: 'category',
                                image: null,
                                price: 49.99,
                              ),
                              const ProductCard(
                                id: 3,
                                title: 'Product 3',
                                category: 'category',
                                image: null,
                                price: 49.99,
                              ),
                              const ProductCard(
                                id: 4,
                                title: 'Product 4',
                                category: 'category',
                                image: null,
                                price: 49.99,
                              ),
                              const ProductCard(
                                id: 5,
                                title: 'Product 5',
                                category: 'category',
                                image: null,
                                price: 49.99,
                              ),
                              const ProductCard(
                                id: 6,
                                title: 'Product 6',
                                category: 'category',
                                image: null,
                                price: 49.99,
                              ),
                              const ProductCard(
                                id: 7,
                                title: 'Product 7',
                                category: 'category',
                                image: null,
                                price: 49.99,
                              ),
                              const ProductCard(
                                id: 8,
                                title: 'Product 8',
                                category: 'category',
                                image: null,
                                price: 49.99,
                              ),
                              const ProductCard(
                                id: 9,
                                title: 'Product 9',
                                category: 'category',
                                image: null,
                                price: 49.99,
                              ),
                            ],
                        onScrollChange: _updateScrolling,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Menu(
            isScrolling: _isScrolling,
            hasMenu: (openMenu) {
              setState(() {
                _openMenu = openMenu;
              });
            },
            isHome: false,
            onTapContact: widget.onTapContact,
            onTapHome: widget.onTapHome,
            onTapProducts: widget.onTapProducts,
            onTapSupport: widget.onTapSupport,
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
