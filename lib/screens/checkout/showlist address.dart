import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Bloc/screen_event.dart';
import 'package:shop_app/Bloc/screen_state.dart';
import 'package:shop_app/Bloc/user_detail_bloc.dart';
import '../../constants.dart';

class ShowAddress extends StatelessWidget {
  const ShowAddress({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserDetailsBloc()..add(FetchDataEventForUserDetails()),
      child:  BlocBuilder<UserDetailsBloc, DataState>(
        builder: (context, state) {
          // Handle different states and update UI accordingly
          if (state is LoadedDataStateForUserDetails) {
            // Use data from state to update UI
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text("Address List", style: headingStyle),

                Container(
                  height: 450,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const ScrollPhysics(),
                    itemCount: state.addressList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                            color: kSecondaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: [
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Text(
                                          "Address:",
                                          style: Theme.of(context).textTheme.bodyLarge,
                                          maxLines: 7,
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(width: 40),
                                        Text(
                                            "${state.addressList[index].address}",
                                          style: Theme.of(context).textTheme.bodyMedium,
                                          maxLines: 7,
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Street:",
                                          style: Theme.of(context).textTheme.bodyLarge,
                                          maxLines: 7,
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(width: 40),
                                        Text(
                                          "${state.addressList[index].street}",
                                          style: Theme.of(context).textTheme.bodyMedium,
                                          maxLines: 7,
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),

                                    const SizedBox(
                                      height: 10,
                                    ),

                                    Row(
                                      children: [
                                        Text(
                                          "City:",
                                          style: Theme.of(context).textTheme.bodyLarge,
                                          maxLines: 7,
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(width: 40),
                                        Text(
                                          "${state.addressList[index].city}",
                                          style: Theme.of(context).textTheme.bodyMedium,
                                          maxLines: 7,
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 10),
                                  ],

                                ),
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    child: Container(
                                      height: 40,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        color: kPrimaryColor,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Delete",
                                          style: Theme.of(context).textTheme.bodyLarge,
                                          maxLines: 7,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    onTap: (){},
                                  ),
                                  InkWell(
                                    child: Container(
                                      height: 40,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        color: kPrimaryColor,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Update",
                                          style: Theme.of(context).textTheme.bodyLarge,
                                          maxLines: 7,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    onTap: (){
                                    },
                                  ),
                                ],
                              )

                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );

          }
          else if (state is ErrorDataState) {
            // Handle error state
            return const Text('Error: Something went wrong');
          }
          else {
            // Handle other states if needed
            return Center(child: CircularProgressIndicator(),);
          }
        },
      ),


    );
  }
}
