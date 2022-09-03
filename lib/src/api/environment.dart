import 'package:flutterservidomisti/src/models/mercado_pago_credentials.dart';

class Environment {
  static const String API_SERVDOMI = "appserverdomi.herokuapp.com";
  static const String API_KEY_MAPS = "AIzaSyDCJLnU99Vm7LsORDvm9y2SJdWA4Fg2-xE";

  static MercadoPagoCredentials mercadoPagoCredentials = MercadoPagoCredentials(
      publicKey: 'TEST-257ff05f-55a9-4bc5-a281-f9fe8d64f1e5',
      accessToken:
          'TEST-5077757554920833-120917-ba1ac019d8d8e874ec3fe4b395abea5f-1033571811');
}
