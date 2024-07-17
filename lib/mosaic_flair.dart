library mosaic_flair;

// Foundation
export 'foundation/color_foundation.dart';
export 'foundation/dimension_foundation.dart';
export 'foundation/duration_fundation.dart';
export 'foundation/icon_foundation.dart';
export 'foundation/radius_foundation.dart';
export 'foundation/spacing_foundation.dart';
export 'foundation/typography_foundation.dart';
export 'foundation/strings_foundation.dart';

// Atomos
export 'atoms/button.dart';
export 'atoms/icon.dart';
export 'atoms/input.dart';
export 'atoms/text.dart';
export 'atoms/process_button.dart';
export 'atoms/support.dart';
export 'atoms/dropdownbutton.dart';

// Moleculas
export 'molecules/carousel.dart';
export 'molecules/appbar.dart';
export 'molecules/navigation.dart';
export 'molecules/product_card.dart';
export 'molecules/search_bar.dart';
export 'molecules/promotion_card.dart';
export 'molecules/menu.dart';
export 'molecules/category_item.dart';
export 'molecules/category_card.dart';
export 'molecules/tile_card.dart';

// Organismos
export 'organisms/cart_summary.dart';
export 'organisms/login_form.dart';
export 'organisms/product_detail.dart';
export 'organisms/product_list.dart';
export 'organisms/register_form.dart';
export 'organisms/synchronous_tab_bar.dart';

// Templates
export 'templates/login_template.dart';
export 'templates/register_template.dart';
export 'templates/home_template.dart';
export 'templates/cart_template.dart';
export 'templates/contact_template.dart';
export 'templates/catalog_template.dart';
export 'templates/search_template.dart';
export 'templates/support_template.dart';
export 'templates/detail_template.dart';

// Paginas
export 'pages/cart_page.dart';
export 'pages/catalog_page.dart';
export 'pages/contact_page.dart';
export 'pages/detail_page.dart';
export 'pages/home_page.dart';
export 'pages/login_page.dart';
export 'pages/register_page.dart';
export 'pages/search_page.dart';
export 'pages/support_page.dart';

// Inicializador
import 'app_initializer.dart';

Future<void> initializeApp(
    {required String path, bool useJsonConfig = true}) async {
  await AppInitializer().initialize(path: path, useJsonConfig: useJsonConfig);
}
