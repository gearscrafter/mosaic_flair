#!/bin/bash

# Ruta al proyecto de ejemplo
EXAMPLE_DIR="example/"

# Lista de todos los archivos de prueba en el directorio test
tests=(
  "test/atoms/button_test.dart"
  "test/atoms/dropdownbutton_test.dart"
  "test/atoms/icon_test.dart"
  "test/atoms/input_test.dart"
  "test/atoms/process_button_test.dart"
  "test/atoms/support_test.dart"
  "test/atoms/text_test.dart"
  "test/molecules/appbar_test.dart"
  "test/molecules/carousel_test.dart"
  "test/molecules/category_card_test.dart"
  "test/molecules/category_item_test.dart"
  "test/molecules/menu_test.dart"
  "test/molecules/product_card_test.dart"
  "test/molecules/tile_card_test.dart"
  "test/organisms/cart_summary_test.dart"
  "test/organisms/login_form_test.dart"
  "test/organisms/product_detail_test.dart"
  "test/organisms/product_list_test.dart"
  "test/organisms/register_form_test.dart"
  "test/organisms/synchronous_tab_bar_test.dart"
)

# Lista de todos los archivos de prueba en el directorio test
tests_driver=(
  "test_driver/templates/cart_template_test.dart"
  "test_driver/templates/cart_template_test.dart"
  "test_driver/templates/catalog_template_test.dart"
  "test_driver/templates/contact_template_test.dart"
  "test_driver/templates/detail_template_test.dart"
  "test_driver/templates/home_template_test.dart"
  "test_driver/templates/login_template_test.dart"
  "test_driver/templates/register_template_test.dart"
  "test_driver/templates/search_template_test.dart"
  "test_driver/templates/support_template_test.dart"
)

# Ejecutar pruebas unitarias
for test in "${tests[@]}"; do
  echo "Running unit test $test..."
  (cd $EXAMPLE_DIR && flutter test ../$test)
done

#Ejecutar pruebas de integración
for test in "${tests_driver[@]}"; do
  echo "Running integration test $test..."
  (cd $EXAMPLE_DIR && flutter drive --driver=test_driver/integration_test.dart --target=$test)
done
