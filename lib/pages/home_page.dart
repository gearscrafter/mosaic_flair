import 'package:flutter/material.dart';

import '../molecules/product_card.dart';
import '../molecules/promotion_card.dart';
import '../templates/home_template.dart';

class HomePage extends StatelessWidget {
  final List<PromotionCard>? promotionCards;
  final List<ProductCard>? products;
  const HomePage({this.promotionCards, this.products, super.key});

  @override
  Widget build(BuildContext context) {
    return HomeTemplate(
      userName: "Juan",
      promotionCards: promotionCards,
      products: products,
    );
  }
}
