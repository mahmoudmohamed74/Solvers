import 'dart:convert';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:solvers/Auth/presentation/widgets/default_snack_bar.dart';

Future<void> initPayment({
  required String email,
  required String orderId,
  required double amount,
  required BuildContext context,
  bool? earnestIsPaid,
  bool? priceIsPaid,
}) async {
  try {
    // 1. Create a payment intent on the server
    final response = await http.post(
        Uri.parse(
          'https://us-central1-solvers-a41b9.cloudfunctions.net/stripePaymentIntentRequest',
        ),
        body: {
          'email': email,
          'amount': amount.toString(),
        });

    final jsonResponse = jsonDecode(response.body);
    log(jsonResponse.toString());
    // 2. Initialize the payment sheet
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
      paymentIntentClientSecret: jsonResponse['paymentIntent'],
      merchantDisplayName: 'solvers payment',
      customerId: jsonResponse['customer'],
      customerEphemeralKeySecret: jsonResponse['ephemeralKey'],
    ));
    await Stripe.instance.presentPaymentSheet();
    FirebaseFirestore.instance.collection("order").doc(orderId).update({
      if (earnestIsPaid == true) "earnestIsPaid": "true",
      if (priceIsPaid == true) "priceIsPaid": "true",
      if (priceIsPaid == true) "status": "solved",
    });

    ScaffoldMessenger.of(context).showSnackBar(
      DefaultSnackBar(
        text: const Text('Payment is successful'),
        backGroundColor: Colors.green,
      ),
    );
  } catch (error) {
    if (error is StripeException) {
      ScaffoldMessenger.of(context).showSnackBar(
        DefaultSnackBar(
          text: Text('An error occurred ${error.error.localizedMessage}'),
          backGroundColor: Colors.red,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occured $error'),
        ),
      );
    }
  }
}
