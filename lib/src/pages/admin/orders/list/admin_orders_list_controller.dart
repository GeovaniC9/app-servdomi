import 'package:flutter/material.dart';
import 'package:flutterservidomisti/src/models/user.dart';
import 'package:flutterservidomisti/src/pages/admin/orders/detail/admin_orders_detail_page.dart';
import 'package:flutterservidomisti/src/provider/orders_provider.dart';
import 'package:flutterservidomisti/src/utils/shared_pref.dart';
import 'package:flutterservidomisti/src/models/order.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class AdminOrdersListController {
  BuildContext context;
  SharedPref _sharedPref = new SharedPref();
  GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();
  Function refresh;
  User user;

  List<String> status = ['PAGADO', 'DESPACHADO', 'EN CAMINO', 'ENTREGADO'];

  OrdersProvider _ordersProvider = new OrdersProvider();

  bool isUpdated = true;

  Future init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;
    user = User.fromJson(await _sharedPref.read('user'));

    _ordersProvider.init(context, user);
    refresh();
  }

  Future<List<Order>> getOrders(String status) async {
    return await _ordersProvider.getByStatus(status);
  }

  void openBottomSheet(Order order) async {
    isUpdated = await showMaterialModalBottomSheet(
        context: context,
        builder: (context) => AdminOrdersDetailPage(order: order));

    if (isUpdated = true) {
      refresh();
    }
  }

  void logout() {
    _sharedPref.logout(context, user.id);
  }

  void goToCategoryCreate() {
    Navigator.pushNamed(context, 'admin/categories/create');
  }

  void goToProductCreate() {
    Navigator.pushNamed(context, 'admin/products/create');
  }

  void openDrawer() {
    key.currentState.openDrawer();
  }

  void goToRoles() {
    Navigator.pushNamedAndRemoveUntil(context, 'roles', (route) => false);
  }
}
