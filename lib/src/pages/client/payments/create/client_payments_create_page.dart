import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutterservidomisti/src/pages/client/payments/create/client_payments_create_controller.dart';
import 'package:flutterservidomisti/src/utils/my_colors.dart';

class ClientPaymentsCreatePage extends StatefulWidget {
  const ClientPaymentsCreatePage({Key key}) : super(key: key);

  @override
  _ClientPaymentsCreatePageState createState() =>
      _ClientPaymentsCreatePageState();
}

class _ClientPaymentsCreatePageState extends State<ClientPaymentsCreatePage> {
  ClientPaymentsCreateController _con = new ClientPaymentsCreateController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context, refresh);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagos'),
      ),
      body: ListView(
        children: [
          CreditCardWidget(
            cardNumber: _con.cardNumber,
            expiryDate: _con.expireDate,
            cardHolderName: _con.cardHolderName,
            cvvCode: _con.cvvCode,
            showBackView: _con.isCvvFocused,
            cardBgColor: MyColors.primaryColor,
            obscureCardNumber: true,
            obscureCardCvv: true,
            animationDuration: Duration(milliseconds: 1000),
            labelCardHolder: 'NOMBRE Y APELLIDO',
          ),
          CreditCardForm(
            cvvCode: '',
            expiryDate: '',
            cardHolderName: '',
            cardNumber: '',
            formKey: _con.keyForm, // Required
            onCreditCardModelChange: _con.onCreditCardModelChanged, // Required
            themeColor: Colors.red,
            obscureCvv: true,
            obscureNumber: true,
            cardNumberDecoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Numero de la tarjeta',
              hintText: 'XXXX XXXX XXXX XXXX',
            ),
            expiryDateDecoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Fecha de expiracion',
              hintText: 'XX/XX',
            ),
            cvvCodeDecoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'CVV',
              hintText: 'XXX',
            ),
            cardHolderDecoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Nombre del titular',
            ),
          ),
          _buttonNext()
        ],
      ),
    );
  }

  Widget _buttonNext() {
    return Container(
      margin: EdgeInsets.all(20),
      child: ElevatedButton(
        onPressed: _con.createCardToken,
        style: ElevatedButton.styleFrom(
            primary: MyColors.primaryColor,
            padding: EdgeInsets.symmetric(vertical: 6),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 50,
                alignment: Alignment.center,
                child: Text('CONTINUAR',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(left: 50, top: 8),
                height: 30,
                child: Icon(
                  Icons.arrow_forward_sharp,
                  color: Colors.lightGreenAccent,
                  size: 30,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void refresh() {
    setState(() {});
  }
}
