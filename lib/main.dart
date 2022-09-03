import 'package:flutter/material.dart';
import 'package:flutterservidomisti/src/pages/admin/categories/create/admin_categories_create_page.dart';
import 'package:flutterservidomisti/src/pages/admin/orders/list/admin_orders_list_page.dart';
import 'package:flutterservidomisti/src/pages/admin/products/create/admin_products_create_page.dart';
import 'package:flutterservidomisti/src/pages/client/address/create/client_address_create_page.dart';
import 'package:flutterservidomisti/src/pages/client/address/list/client_address_list_page.dart';
import 'package:flutterservidomisti/src/pages/client/address/map/client_address_map_page.dart';
import 'package:flutterservidomisti/src/pages/client/orders/create/client_orders_create_page.dart';
import 'package:flutterservidomisti/src/pages/client/orders/list/client_orders_list_page.dart';
import 'package:flutterservidomisti/src/pages/client/orders/map/client_orders_map_page.dart';
import 'package:flutterservidomisti/src/pages/client/payments/create/client_payments_create_page.dart';
import 'package:flutterservidomisti/src/pages/client/payments/installments/client_payments_installments_page.dart';
import 'package:flutterservidomisti/src/pages/client/products/list/client_products_list_page.dart';
import 'package:flutterservidomisti/src/pages/client/update/client_update_page.dart';
import 'package:flutterservidomisti/src/pages/delivery/orders/list/delivery_orders_list_page.dart';
import 'package:flutterservidomisti/src/pages/delivery/orders/map/delivery_orders_map_page.dart';
import 'package:flutterservidomisti/src/pages/login/login_page.dart';
import 'package:flutterservidomisti/src/pages/login/register/register_page.dart';
import 'package:flutterservidomisti/src/pages/roles/roles_page.dart';
import 'package:flutterservidomisti/src/utils/my_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'get date00 if  ==> 0987777 if get ==> date',
      initialRoute: 'login',
      routes: {
        'login': (BuildContext context) => LoginPage(),
        'register': (BuildContext context) => RegisterPage(),
        'roles': (BuildContext context) => RolesPage(),
        'client/products/list': (BuildContext context) =>
            ClientProductsListPage(),
        'client/update': (BuildContext context) => ClientUpdatePage(),
        'client/orders/create': (BuildContext context) =>
            ClientOrdersCreatePage(),
        'client/address/list': (BuildContext context) =>
            ClientAddressListPage(),
        'client/address/create': (BuildContext context) =>
            ClientAddressCreatePage(),
        'client/address/map': (BuildContext context) => ClientAddressMapPage(),
        'client/orders/list': (BuildContext context) => ClientOrdersListPage(),
        'client/orders/map': (BuildContext context) => ClientOrdersMapPage(),
        'client/payments/create': (BuildContext context) => ClientPaymentsCreatePage(),
        'client/payments/installments': (BuildContext context) => ClientPaymentsInstallmentsPage(),
        'admin/orders/list': (BuildContext context) => AdminOrdersListPage(),
        'admin/categories/create': (BuildContext context) =>
            AdminCategoriesCreatePage(),
        'admin/products/create': (BuildContext context) =>
            AdminProductsCreatePage(),
        'delivery/orders/list': (BuildContext context) =>
            DeliveryOrdersListPage(),
            'delivery/orders/map': (BuildContext context) =>
            DeliveryOrdersMapPage(),
      },
      theme: ThemeData(
          primaryColor: MyColors.primaryColor,
          appBarTheme: AppBarTheme(elevation: 0)),
    );
  }
}
