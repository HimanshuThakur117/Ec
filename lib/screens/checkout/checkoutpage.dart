
import 'package:flutter/material.dart';
import 'package:shop_app/screens/checkout/add_user_details.dart';
import 'package:shop_app/screens/checkout/paymentpage.dart';
import 'package:shop_app/screens/checkout/showlist%20address.dart';

import '../../constants.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({super.key});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 const  Text("Check out page",style: TextStyle( fontSize: 18),),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AddUserDetails()),
                      );
                    },
                    child: Container(
                      height: 30,
                      width: 160,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Padding(
                        padding:  EdgeInsets.fromLTRB(20,0,20,0),
                        child:  Center(
                            child:  Text("Add your details",style: TextStyle(color: Colors.white),)),
                      ),
                    ),
                  ),
                ],
              ),

              ShowAddress(),

              const SizedBox(
                height: 60,
              ),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  PaymentForm()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    elevation: 10.0,
                    textStyle: const TextStyle(color: Colors.white)),
                child: const Text('Continue to pay'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


