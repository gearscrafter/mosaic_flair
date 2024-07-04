import 'package:flutter/material.dart';

import '../data/category_data.dart';
import '../foundation/color_foundation.dart';
import '../foundation/dimension_foundation.dart';
import '../molecules/category_card.dart';
import '../molecules/category_item.dart';
import '../molecules/tile_card.dart';
import 'bloc/category_bloc.dart';

const categoryHeight = 50.0;
const productHeight = 100.0;

class SynchronousTabBar extends StatefulWidget {
  final List<Category>? items;
  final Function(bool isScrolling)? onScrollChange;
  const SynchronousTabBar({this.onScrollChange, this.items, super.key});

  @override
  State<SynchronousTabBar> createState() => _SynchronousTabBarState();
}

class _SynchronousTabBarState extends State<SynchronousTabBar>
    with SingleTickerProviderStateMixin {
  late final _bloc = CategoryBloc();

  @override
  void initState() {
    _bloc.init(this, productHeight, categoryHeight, widget.items);
    super.initState();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnimatedBuilder(
        animation: _bloc,
        builder: (_, __) {
          return Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              SizedBox(
                height: 60,
                width: size.width,
                child: TabBar(
                    controller: _bloc.tabController,
                    isScrollable: true,
                    dividerColor: Colors.transparent,
                    onTap: _bloc.onCategorySelected,
                    overlayColor: WidgetStateColor.transparent,
                    indicatorColor: Colors.transparent,
                    tabs: _bloc.tabs
                        .map((item) => CategoryCard(
                              title: item.category.name ?? '',
                              onSelected: item.onSelected,
                              color: textColorPrimary,
                            ))
                        .toList()),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: paddingLargeDimension),
                  child: ListView.builder(
                      shrinkWrap: true,
                      controller: _bloc.scrollController,
                      itemCount: _bloc.items.length,
                      itemBuilder: (context, index) {
                        if (widget.onScrollChange != null) {
                          widget.onScrollChange!(_bloc.isScrolling);
                        }
                        final item = _bloc.items[index];
                        if (item.isCategory) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: paddingMediumDimension,
                                horizontal: paddingSmallDimension),
                            child: CategoryItem(
                              title: item.category?.name ?? '',
                              categoryHeight: categoryHeight,
                              color: textColorPrimary,
                            ),
                          );
                        } else {
                          return Padding(
                            padding:
                                const EdgeInsets.all(paddingSmallDimension),
                            child: TileCard(
                              title: item.product?.name,
                              price: 20,
                              image: item.product?.image,
                              height: productHeight,
                              onPressed: () {},
                            ),
                          );
                        }
                      }),
                ),
              ),
            ],
          );
        });
  }
}
