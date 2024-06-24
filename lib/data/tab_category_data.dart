import 'category_data.dart';

class TabCategory {
  final Category category;
  final bool onSelected;
  final double offsetFrom;
  final double offsetTo;
  TabCategory(
      {required this.category,
      required this.onSelected,
      required this.offsetFrom,
      required this.offsetTo});

  TabCategory copyWith(bool onSelected) => TabCategory(
      category: category,
      onSelected: onSelected,
      offsetFrom: offsetFrom,
      offsetTo: offsetTo);
}
