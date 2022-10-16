import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'doctor_dashboard.dart';


class HealthCareConfirmation extends StatelessWidget {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  // mainAxisAlignment: MainAxisAlignment.center,
  children: [
    SizedBox(height: 50,),
    Image.asset('assets/images/circle_mark.jpg', height: 100, width: 100,),
    Text('Your interview has been scheduled successfully ', textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),),
    SizedBox(height: 20,),



    Container(
      width: 300,
      color: Colors.grey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.arrow_downward_outlined, color: Color(0xff668342) ,),
                // Text(box.read('selectedDate'), style: TextStyle(
                //   color: Color(0xff668342),
                // ),)
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Icon(Icons.home, color: Color(0xff668342) ,),
            //     Text( box.read('selectedTime'), style: TextStyle(
            //       color: Color(0xff668342),
            //     ),)
            //   ],
            // ),
          ],
        ),
      ),
    ),
    SizedBox(height: 20,),
    InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  DoctorDashboard()),
        );
      },
      child: Container(
        height: 40,
        width: 100,
        child: Center(child: Text('Ok', style: TextStyle(color: Colors.white),)),
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
      ),
    ),
  ],
),
    );
  }
}
