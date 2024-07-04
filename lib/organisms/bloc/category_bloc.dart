import 'package:flutter/material.dart';

import '../../data/category_data.dart';
import '../../data/item_data.dart';
import '../../data/tab_category_data.dart';

class CategoryBloc with ChangeNotifier {
  final tabs = <TabCategory>[];
  final items = <Item>[];
  TabController? tabController;
  ScrollController scrollController = ScrollController();
  bool _listen = true;
  bool _isScrolling = false;

  bool get isScrolling => _isScrolling;

  void init(TickerProvider ticker, double productHeight, double categoryHeight,
      List<Category>? categoryItems) {
    tabController?.dispose();

    final length = (categoryItems ?? categoriesItems).length;
    if (length > 0) {
      tabController = TabController(
          length: (categoryItems ?? categoriesItems).length, vsync: ticker);

      double offsetFrom = 0.0;
      double offsetTo = 0.0;

      for (int i = 0; i < (categoryItems ?? categoriesItems).length; i++) {
        final category = (categoryItems ?? categoriesItems)[i];

        if (i > 0) {
          offsetFrom +=
              ((categoryItems ?? categoriesItems)[i - 1].products?.length ??
                      0) *
                  productHeight;
        }

        if (i < (categoryItems ?? categoriesItems).length - 1) {
          offsetTo = offsetFrom +
              ((categoryItems ?? categoriesItems)[i + 1].products?.length ??
                      0) *
                  productHeight;
        } else {
          offsetTo = double.infinity;
        }

        tabs.add(TabCategory(
            category: category,
            onSelected: (i == 0),
            offsetFrom: categoryHeight * i + offsetFrom,
            offsetTo: offsetTo));

        items.add(Item(category: category));
        for (int j = 0; j < (category.products ?? []).length; j++) {
          final product = category.products?[j];
          items.add(Item(product: product));
        }
      }
    }

    scrollController.addListener(_onScrollListener);
    notifyListeners();
  }

  void update(TickerProvider ticker, double productHeight,
      double categoryHeight, List<Category>? categoryItems) {
    final length = (categoryItems ?? categoriesItems).length;
    if (length > 0) {
      tabController?.dispose();
      tabController = TabController(length: length, vsync: ticker);

      tabs.clear();
      items.clear();

      double offsetFrom = 0.0;
      double offsetTo = 0.0;

      for (int i = 0; i < length; i++) {
        final category = (categoryItems ?? categoriesItems)[i];

        if (i > 0) {
          offsetFrom +=
              ((categoryItems ?? categoriesItems)[i - 1].products?.length ??
                      0) *
                  productHeight;
        }

        if (i < length - 1) {
          offsetTo = offsetFrom +
              ((categoryItems ?? categoriesItems)[i + 1].products?.length ??
                      0) *
                  productHeight;
        } else {
          offsetTo = double.infinity;
        }

        tabs.add(TabCategory(
            category: category,
            onSelected: (i == 0),
            offsetFrom: categoryHeight * i + offsetFrom,
            offsetTo: offsetTo));

        items.add(Item(category: category));
        for (int j = 0; j < (category.products ?? []).length; j++) {
          final product = category.products?[j];
          items.add(Item(product: product));
        }
      }

      notifyListeners();
    }
  }

  void _onScrollListener() {
    _isScrolling = true;
    notifyListeners();

    if (_listen) {
      for (int i = 0; i < tabs.length; i++) {
        final tab = tabs[i];
        if (scrollController.offset >= tab.offsetFrom &&
            scrollController.offset <= tab.offsetTo &&
            !tab.onSelected) {
          onCategorySelected(i, animationRequired: false);
          tabController?.animateTo(i);
          break;
        }
      }
    }

    Future.delayed(const Duration(milliseconds: 200), () {
      _isScrolling = false;
      notifyListeners();
    });
  }

  void onCategorySelected(int index, {bool animationRequired = true}) async {
    final selected = tabs[index];
    for (int i = 0; i < tabs.length; i++) {
      final condition = selected.category.name == tabs[i].category.name;
      tabs[i] = tabs[i].copyWith(condition);
    }
    notifyListeners();
    if (animationRequired) {
      _listen = false;
      await scrollController.animateTo(selected.offsetFrom,
          duration: const Duration(milliseconds: 500), curve: Curves.linear);
      _listen = true;
    }
  }

  @override
  void dispose() {
    scrollController.removeListener(_onScrollListener);
    scrollController.dispose();
    tabController?.dispose();
    super.dispose();
  }
}
