
import 'package:flutter/material.dart';
import 'package:shop_app/screens/checkout/payment_succes.dart';

class PaymentForm extends StatefulWidget {
  @override
  _PaymentFormState createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
  String selectedPaymentMethod = 'Credit Card';

  // List of available payment methods
  List<String> paymentMethods = [
    'Credit Card',
    'PayPal',
    'Google Pay',
    'Apple Pay',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Select Payment Method:',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20.0),
            DropdownButton<String>(
              value: selectedPaymentMethod,
              onChanged: (String? newValue) {
                setState(() {
                  selectedPaymentMethod = newValue!;
                });
              },
              items: paymentMethods.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Handle the selected payment method
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  PaymentSucces()),
                );
              },
              child: Text('Proceed to Payment'),
            ),
          ],
        ),
      ),
    );
  }
}