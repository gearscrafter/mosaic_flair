import 'package:flutter/material.dart';

import '../data/product_dart.dart';
import '../foundation/color_foundation.dart';
import '../foundation/dimension_foundation.dart';
import '../molecules/menu.dart';
import '../molecules/product_card.dart';
import '../molecules/search_bar.dart';
import '../molecules/tile_card.dart';

/// `SearchTemplate` es una plantilla que permite buscar productos y
/// mostrarlos en una lista filtrable.
///
/// ### Atributos:
/// - `productCards`: Lista de productos a mostrar.
/// - `onTapHome`: Función a ejecutar al presionar el botón de inicio.
/// - `onTapSupport`: Función a ejecutar al presionar el botón de soporte.
/// - `onTapContact`: Función a ejecutar al presionar el botón de contacto.
/// - `getProduct`: Función a ejecutar al seleccionar un producto, recibe el producto como parámetro.
/// - `onPressItem`: Función a ejecutar al presionar un item de la lista.
///
/// ### Variables:
/// - `scrollController`: Controlador del scroll para manejar el estado de desplazamiento.
/// - `_isScrolling`: Indicador booleano de si la lista se está desplazando.
/// - `_searchController`: Controlador de texto para el campo de búsqueda.
/// - `filteredListNotifier`: Notificador de valor para la lista de productos filtrados.

class SearchTemplate extends StatefulWidget {
  final List<ProductCard>? productCards;
  final VoidCallback? onTapHome;
  final VoidCallback? onTapSupport;
  final VoidCallback? onTapContact;
  final Function(Product? product)? getProduct;
  final VoidCallback? onPressItem;
  const SearchTemplate(
      {super.key,
      this.productCards,
      this.onTapHome,
      this.onTapSupport,
      this.getProduct,
      this.onTapContact,
      this.onPressItem});

  @override
  State<SearchTemplate> createState() => _SearchTemplateState();
}

class _SearchTemplateState extends State<SearchTemplate> {
  ScrollController scrollController = ScrollController();
  bool _isScrolling = false;
  final _searchController = TextEditingController();
  late ValueNotifier<List<ProductCard>> filteredListNotifier;

  @override
  void initState() {
    super.initState();
    filteredListNotifier = ValueNotifier(widget.productCards ?? tileList);
    _searchController.addListener(_filterList);
  }

  @override
  void didUpdateWidget(covariant SearchTemplate oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.productCards != oldWidget.productCards) {
      filteredListNotifier.value = widget.productCards ?? tileList;
    }
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterList);
    _searchController.dispose();
    filteredListNotifier.dispose();
    super.dispose();
  }

  void _filterList() {
    setState(() {
      if (_searchController.text.isEmpty) {
        filteredListNotifier.value = widget.productCards ?? tileList;
      } else {
        filteredListNotifier.value =
            (widget.productCards ?? tileList).where((tile) {
          return tile.title
              .toLowerCase()
              .contains(_searchController.text.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 32,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: paddingMediumDimension,
                  right: paddingMediumDimension,
                ),
                child: SearchBarM(
                  controller: _searchController,
                  onSearch: (value) {},
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: paddingLargeDimension),
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification notification) {
                      setState(() {
                        if (notification is ScrollUpdateNotification) {
                          _isScrolling = true;
                        } else if (notification is ScrollEndNotification) {
                          _isScrolling = false;
                        }
                      });

                      return true;
                    },
                    child: ValueListenableBuilder<List<ProductCard>>(
                        valueListenable: filteredListNotifier,
                        builder: (context, filteredList, child) {
                          return ListView.builder(
                              shrinkWrap: true,
                              controller: scrollController,
                              itemCount: filteredList.length,
                              itemBuilder: (context, index) {
                                final item = filteredList[index];
                                return Padding(
                                  padding:
                                      EdgeInsets.all(paddingSmallDimension),
                                  child: TileCard(
                                    height: 100,
                                    title: item.title,
                                    price: item.price,
                                    image: item.image,
                                    onPressed: () {
                                      if (widget.getProduct != null) {
                                        widget.getProduct!(Product(
                                            name: item.title,
                                            description: "",
                                            image: item.image ?? '',
                                            price: item.price));
                                      }

                                      widget.onPressItem;
                                    },
                                  ),
                                );
                              });
                        }),
                  ),
                ),
              ),
            ],
          ),
          Menu(
            isScrolling: _isScrolling,
            hasMenu: (openMenu) {},
            isHome: true,
            onTapContact: widget.onTapContact,
            onTapHome: widget.onTapHome,
            onTapSupport: widget.onTapSupport,
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
