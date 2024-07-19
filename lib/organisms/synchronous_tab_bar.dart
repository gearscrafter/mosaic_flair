import 'package:flutter/material.dart';

import '../data/category_data.dart';
import '../data/product_dart.dart';
import '../foundation/color_foundation.dart';
import '../foundation/dimension_foundation.dart';
import '../molecules/category_card.dart';
import '../molecules/category_item.dart';
import '../molecules/tile_card.dart';
import 'bloc/category_bloc.dart';

const categoryHeight = 50.0;
const productHeight = 100.0;

/// `SynchronousTabBar` es un widget que muestra una barra de pestañas sincronizadas con una lista de categorías y productos.
///
/// ### Atributos:
/// - `items`: Una lista de categorías opcional para mostrar en las pestañas.
/// - `onScrollChange`: Función opcional que se ejecuta cuando cambia el estado de desplazamiento.
/// - `getProduct`: Función opcional que se ejecuta cuando se selecciona un producto.

class SynchronousTabBar extends StatefulWidget {
  /// Una lista de categorías opcional para mostrar en las pestañas.
  final List<Category>? items;

  /// Función opcional que se ejecuta cuando cambia el estado de desplazamiento.
  final Function(bool isScrolling)? onScrollChange;

  /// Función opcional que se ejecuta cuando se selecciona un producto.
  final Function(Product? product)? getProduct;

  /// Constructor para crear una instancia de `SynchronousTabBar`.
  const SynchronousTabBar({
    this.onScrollChange,
    this.getProduct,
    this.items,
    super.key,
  });

  @override
  State<SynchronousTabBar> createState() => _SynchronousTabBarState();
}

class _SynchronousTabBarState extends State<SynchronousTabBar>
    with TickerProviderStateMixin {
  late final _bloc = CategoryBloc();

  @override
  void initState() {
    _initializeBloc();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant SynchronousTabBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.items != oldWidget.items) {
      _updateBloc();
    }
  }

  void _initializeBloc() {
    if (_bloc.tabController == null) {
      _bloc.init(this, productHeight, categoryHeight, widget.items);
    }
  }

  void _updateBloc() {
    _bloc.update(this, productHeight, categoryHeight, widget.items);
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Semantics(
      label: 'Barra de pestañas sincronizadas con categorías y productos',
      child: AnimatedBuilder(
        animation: _bloc,
        builder: (_, __) {
          return Column(
            children: [
              const SizedBox(height: 80),
              Semantics(
                label: 'Categorías',
                child: SizedBox(
                  height: 60,
                  width: size.width,
                  child: _bloc.tabController == null
                      ? Container()
                      : TabBar(
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
                              .toList(),
                        ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: paddingLargeDimension),
                  child: Semantics(
                    label: 'Lista de productos y categorías',
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
                          return Semantics(
                            label:
                                'Categoría: ${item.category?.name ?? 'Sin nombre'}',
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: paddingMediumDimension,
                                  horizontal: paddingSmallDimension),
                              child: CategoryItem(
                                title: item.category?.name ?? '',
                                categoryHeight: categoryHeight,
                                color: textColorPrimary,
                              ),
                            ),
                          );
                        } else {
                          return Semantics(
                            label:
                                'Producto: ${item.product?.name ?? 'Sin nombre'}, Precio: \$${item.product?.price.toStringAsFixed(2) ?? '0.00'}',
                            child: Padding(
                              padding: EdgeInsets.all(paddingSmallDimension),
                              child: TileCard(
                                title: item.product?.name,
                                price: item.product?.price ?? 0.0,
                                image: item.product?.image,
                                height: productHeight,
                                onPressed: () {
                                  if (widget.getProduct != null) {
                                    widget.getProduct!(Product(
                                        id: item.product?.id,
                                        name: item.product?.name ?? '',
                                        description:
                                            item.product?.description ?? '',
                                        image: item.product?.image ?? '',
                                        price: item.product?.price ?? 0.0));
                                  }
                                },
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
