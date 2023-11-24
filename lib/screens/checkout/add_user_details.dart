import 'package:flutter/material.dart';
import 'package:shop_app/screens/checkout/components/user_from.dart';
import '../../components/socal_card.dart';
import '../../constants.dart';
import '../sign_up/components/sign_up_form.dart';

class AddUserDetails extends StatelessWidget {
  static String routeName = "/sign_up";

  const AddUserDetails({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details Page"),
      ),
      body: const  SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                   SizedBox(height: 16),
                   Text("Add Your Detail Here", style: headingStyle),
                   Text(
                    "Complete your details or continue",
                    textAlign: TextAlign.center,
                  ),
                   SizedBox(height: 16),
                   UserForm(),
                   SizedBox(height: 16),
                   SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
