import 'package:flutter/material.dart';


class DoctorDashboard extends StatelessWidget {
  const DoctorDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Dashboard', style: TextStyle(fontSize: 18),),
                ],
              ),
              SizedBox(height: 10,),
              Text('Upcoming visit'),
              SizedBox(height: 10,),
              Center(
                child: Container(
                  height: 90,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
