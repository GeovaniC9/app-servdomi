import 'package:flutter/material.dart';
import 'package:flutterservidomisti/src/models/category.dart';
import 'package:flutterservidomisti/src/models/product.dart';
import 'package:flutterservidomisti/src/models/user.dart';
import 'package:flutterservidomisti/src/pages/client/products/detail/client_products_detail_page.dart';
import 'package:flutterservidomisti/src/provider/categories_provider.dart';
import 'package:flutterservidomisti/src/provider/products_provider.dart';
import 'package:flutterservidomisti/src/utils/shared_pref.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ClientProductsListController {
  BuildContext context;
  SharedPref _sharedPref = new SharedPref();
  GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();
  Function refresh;

  User user;
  CategoriesProvider _categoriesProvider = new CategoriesProvider();
  ProductsProvider _productsProvider = new ProductsProvider();
  List<Category> categories = [];

  Future init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;

    user = User.fromJson(await _sharedPref.read('user'));
    _categoriesProvider.init(context, user);
    _productsProvider.init(context, user);
    getCategories();
    refresh();
  }

  Future<List<Product>> getProducts(String idCategory) async {
    return await _productsProvider.getByCategory(idCategory);
  }

  void getCategories() async {
    categories = await _categoriesProvider.getAll();
    refresh();
  }

  void openBottomSheet(Product product) {
    showMaterialModalBottomSheet(
      context: context, 
    builder: (context) => ClientProductsDetailPage(product: product)
    );
  }

  void logout() {
    _sharedPref.logout(context, user.id);
  }

  void openDrawer() {
    key.currentState.openDrawer();
  }

  void goToUpdatePage() {
    Navigator.pushNamed(context, 'client/update');
  }

  void goToOrdersList() {
    Navigator.pushNamed(context, 'client/orders/list');
  }

  void goToOrderCreatePage() {
    Navigator.pushNamed(context, 'client/orders/create');
  }

  void goToRoles() {
    Navigator.pushNamedAndRemoveUntil(context, 'roles', (route) => false);
  }
}
