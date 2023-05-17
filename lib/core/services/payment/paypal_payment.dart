import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:solvers/Auth/presentation/controller/auth_cubit/auth_cubit.dart';
import 'package:solvers/Auth/presentation/widgets/default_snack_bar.dart';
import 'package:webview_flutter_x5/webview_flutter.dart';

class PaypalPayment extends StatefulWidget {
  final double amount;

  const PaypalPayment({Key? key, required this.amount}) : super(key: key);

  @override
  State<PaypalPayment> createState() => _PaypalPaymentState();
}

class _PaypalPaymentState extends State<PaypalPayment> {
  late final Map<String, dynamic> _transaction;

  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();

    // Initialize transaction
    _transaction = {
      "amount": {
        "total": widget.amount,
        "currency": "USD",
        "details": {
          "subtotal": widget.amount,
          "shipping": '0',
          "shipping_discount": 0
        }
      },
      "description": "The payment transaction description.",
      "item_list": {
        "items": [
          {
            "name": "A demo product",
            "quantity": 1,
            "price": widget.amount,
            "currency": "USD"
          }
        ],
        "shipping_address": {
          "recipient_name": "Jane Foster",
          "line1": "Travis County",
          "line2": "",
          "city": "Austin",
          "country_code": "US",
          "postal_code": "73301",
          "phone": "+00000000",
          "state": "Texas"
        },
      }
    };
  }

  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  @override
  Widget build(BuildContext context) {
    return UsePaypal(
      sandboxMode: true,
      clientId:
          "AcztVs_jeeUTCVRK2XbrFV5THWGt6H5pqu0X5vjcTNMX1c-_w6ZwDv-FZyewzYfqcAS7rz_Guh5cJQaG",
      secretKey:
          "EFkRbHPUtY5qAslFjnEaSONQxZIJfifTmcJ7m2CEXM_C2yeK-wn0olMRC7jPIC-9EqeSnT3auGPK-bLf",
      returnURL: "https://solvers-a41b9.firebaseapp.com/return",
      cancelURL: "https://solvers-a41b9.firebaseapp.com/cancel",
      transactions: [_transaction],
      note: "Contact us for any questions on your order.",
      onSuccess: (Map params) async {
        if (mounted) {
          setState(() {
            _scaffoldKey.currentState?.showSnackBar(
              DefaultSnackbar(
                text: Text('Payment is successful'),
                backGroundColor: Colors.green,
              ),
            );
          });
        }
        print("Payment successful! Payment ID: $params");
      },
      onError: (error) {
        _scaffoldKey.currentState?.showSnackBar(
          DefaultSnackbar(
            text: Text('An error occurred ${error.toString()}'),
            backGroundColor: Colors.yellow,
          ),
        );
        print("Payment error: $error");
      },
      onCancel: (params) {
        _scaffoldKey.currentState?.showSnackBar(
          DefaultSnackbar(
            text: const Text('Payment is cancelled'),
            backGroundColor: Colors.yellow,
          ),
        );
        print("Payment cancelled by user: $params");
      },
    );
  }
}
