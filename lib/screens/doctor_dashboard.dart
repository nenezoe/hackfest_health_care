import 'package:flutter/material.dart';


class DoctorDashboard extends StatelessWidget {
  const DoctorDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Text('Dashboard'),


              ],
            )
          ],
        ),
      ),
    );
  }
}
