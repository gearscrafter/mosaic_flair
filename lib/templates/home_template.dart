import 'package:flutter/material.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

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
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 90,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: paddingMediumDimension),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: 'Hola, ${widget.userName ?? 'Usuario'}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: fontSizeLargeDimension),
                      ),
                      const AppText(
                        text: 'Ordena tu producto favorito',
                      ),
                    ],
                  ),
                ),
                AppCarousel(
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
                const SizedBox(
                  height: paddingMediumDimension,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: paddingMediumDimension),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AppText(
                        text: 'Popular',
                        sizeText: SizeText.L,
                        fontWeight: FontWeight.bold,
                      ),
                      GestureDetector(
                        onTap: widget.onTapSeeMore,
                        child: const AppText(
                          text: 'Ver más',
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: paddingMediumDimension,
                ),
                SizedBox(
                  height: size.height * 0.5,
                  child: ProductList(
                    aspectHeight: 4,
                    onTapProductSelected: widget.onTapProductSelected,
                    productSelected: widget.productSelected,
                    products: widget.products ??
                        const [
                          ProductCard(
                            id: 1,
                            title: 'Product 1',
                            category: 'category',
                            image: null,
                            price: 29.99,
                          ),
                          ProductCard(
                            id: 2,
                            title: 'Product 2',
                            category: 'category',
                            image: null,
                            price: 49.99,
                          ),
                          ProductCard(
                            id: 3,
                            title: 'Product 3',
                            category: 'category',
                            image: null,
                            price: 49.99,
                          ),
                          ProductCard(
                            id: 4,
                            title: 'Product 4',
                            category: 'category',
                            image: null,
                            price: 49.99,
                          ),
                          ProductCard(
                            id: 5,
                            title: 'Product 5',
                            category: 'category',
                            image: null,
                            price: 49.99,
                          ),
                          ProductCard(
                            id: 6,
                            title: 'Product 6',
                            category: 'category',
                            image: null,
                            price: 49.99,
                          ),
                          ProductCard(
                            id: 7,
                            title: 'Product 7',
                            category: 'category',
                            image: null,
                            price: 49.99,
                          ),
                          ProductCard(
                            id: 8,
                            title: 'Product 8',
                            category: 'category',
                            image: null,
                            price: 49.99,
                          ),
                          ProductCard(
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
              ],
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
