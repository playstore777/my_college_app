import 'package:flutter/material.dart';

import '../constants.dart';

import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../resuable_ui/landscape_screen.dart';

class PaymentScreen extends StatefulWidget {
  static const routeName = 'payment';
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  TextEditingController textController;

  void payment() {
    // this function is not mandatory, but the statemenst/code under it is!
    var options = {
      'key': 'rzp_test_Uv9wo6uX9ue8vz',
      'amount': num.parse(textController.text) * 100,
      'name': 'St. Josephs College',
      'description': 'Payment of ${textController.text}',
      'prefil': {
        'contacts': "",
        'email': '',
      },
      'external': {
        'wallets': [
          'paytm',
        ]
      }
    };
    try {
      _razorPay.open(options);
    } catch (error) {
      print('error at openCheckout : $error');
    }
  }

  void dispose() {
    super.dispose();
    _razorPay?.clear();
  }

  Razorpay _razorPay;
  @override
  void initState() {
    textController = TextEditingController();
    _razorPay = Razorpay();
    _razorPay?.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorPay?.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorPay?.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  void _handlePaymentSuccess() {
    print('Success!');
  }

  void _handlePaymentError() {
    print('Error!');
  }

  void _handleExternalWallet() {
    print('Wallet!');
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape
        ? LandscapeScreen()
        : Scaffold(
            appBar: AppBar(
              title: Text(
                Constants.homeCardPaymentName,
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: textController,
                  ),
                  ElevatedButton(
                    child: Text('Submit'),
                    onPressed: payment,
                  ),
                ],
              ),
            ),
          );
  }
}
