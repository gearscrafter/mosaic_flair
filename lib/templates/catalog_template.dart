import 'package:flutter/material.dart';
import 'package:mosaic_flair/molecules/menu.dart';
import '../foundation/color_foundation.dart';
import '../molecules/appbar.dart';
import '../molecules/product_card.dart';
import '../organisms/synchronous_tab_bar.dart';

class CatalogTemplate extends StatefulWidget {
  final List<ProductCard>? products;
  final void Function(ProductCard? product)? onProductTap;

  const CatalogTemplate({
    super.key,
    this.products,
    this.onProductTap,
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
              onScrollChange: _updateScrolling,
            ),
            Menu(
              isScrolling: _isScrolling,
              hasMenu: (openMenu) {
                setState(() {
                  _openMenu = openMenu;
                });
              },
              isHome: true,
            ),
            Appbar(
              openMenu: _openMenu,
            )
          ],
        ));
  }
}
