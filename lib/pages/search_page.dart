import 'package:flutter/material.dart';

import '../data/product_dart.dart';
import '../molecules/product_card.dart';
import '../templates/search_template.dart';

class SearchPage extends StatelessWidget {
  final List<ProductCard>? productCards;
  final VoidCallback? onTapHome;
  final VoidCallback? onTapSupport;
  final VoidCallback? onTapContact;
  final Function(Product? product)? getProduct;
  final VoidCallback? onPressItem;
  const SearchPage(
      {super.key,
      this.productCards,
      this.onTapHome,
      this.onTapSupport,
      this.getProduct,
      this.onTapContact,
      this.onPressItem});

  @override
  Widget build(BuildContext context) {
    return const SearchTemplate();
  }
}
