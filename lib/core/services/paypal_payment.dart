import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:webview_flutter_x5/webview_flutter.dart';

class PaypalPayment extends StatefulWidget {
  const PaypalPayment({super.key});

  @override
  State<PaypalPayment> createState() => _PaypalPaymentState();
}

class _PaypalPaymentState extends State<PaypalPayment> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

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
      transactions: const [
        {
          "amount": {
            "total": '10.12',
            "currency": "USD",
            "details": {
              "subtotal": '10.12',
              "shipping": '0',
              "shipping_discount": 0
            }
          },
          "description": "The payment transaction description.",
          // "payment_options": {
          //   "allowed_payment_method":
          //       "INSTANT_FUNDING_SOURCE"
          // },
          "item_list": {
            "items": [
              {
                "name": "A demo product",
                "quantity": 1,
                "price": '10.12',
                "currency": "USD"
              }
            ],

            // shipping address is not required though
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
        },
      ],
      note: "Contact us for any questions on your order.",
      onSuccess: (Map params) {
        print("Payment successful! Payment ID: $params");
      },
      onError: (error) {
        print("Payment error: $error");
      },
      onCancel: (params) {
        print("Payment cancelled by user: $params");
      },
    );
  }
}
