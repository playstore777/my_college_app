import 'package:flutter/material.dart';

import '/resuable_ui/reusable_container.dart';
import '/resuable_ui/landscape_screen.dart';
import '/constants.dart';

import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentScreen extends StatefulWidget {
  static const routeName = 'payment';
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  TextEditingController textController;

  void payment() {
    // this function is not mandatory, but the statement/code under it is!
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

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print('Success paymentId : ${response.paymentId}');
    print('Success orderId : ${response.orderId}');
    print('Success Signature : ${response.signature}');
  }

  void _handlePaymentError(response) {
    print('Error! : ${response.body}');
  }

  void _handleExternalWallet(response) {
    print('Wallet! : ${response.body}');
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return MediaQuery.of(context).orientation == Orientation.landscape
        ? LandscapeScreen()
        : ReusableContainerDark(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                title: Text(
                  Constants.homeCardPaymentName,
                ),
              ),
              body: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: mediaQuery.width * 0.1,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[300],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '₹',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: textController,
                              decoration: InputDecoration(
                                hintText: 'Enter the Amount',
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: TextButton(
                              child: Text('Submit'),
                              onPressed: payment,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
