import 'package:flutter/material.dart';
import 'package:hackfest_health_care/screens/sign_in.dart';
import 'package:hackfest_health_care/screens/sign_up.dart';

import 'healthcare_credientials.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Get Started', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                Image.asset('assets/images/medical.jpg', ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text('As a'),
                    SizedBox(width: 10,),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const HealthCareCredential()),
                        );
                      },
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  HealthCareCredential()),
                          );
                        },
                        child: Container(
                          height: 40,
                          width: 180,
                          child: Center(child: Text('Health care Professional', style: TextStyle(color: Colors.deepPurple),)),
                          decoration: BoxDecoration(
                            color: Color(0xff999999),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      width: 100,
                      height: 40,
                      child: Center(child: Text('Patient', style: TextStyle(color: Colors.deepPurple),)),
                      decoration: BoxDecoration(
                        color: Color(0xff999999),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                    )
                  ],
                ),
                SizedBox(height: 30,),
                Container(
                  height: 40,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Continue with apple'),
                      SizedBox(height: 10,),
                      Icon(Icons.apple)
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xff9EB3C2),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 40,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Continue with GMail'),
                      SizedBox(width: 10,),
                      Icon(Icons.email)
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Color(0xff9EB3C2),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                ),
                SizedBox(height: 20,),
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUp()),
                    );
                  },
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    child: Center(child: Text('Sign up', style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Colors.white),)),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?', style: TextStyle(color: Color(0xff9EB3C2)),),
                    SizedBox(width: 10,),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignIn()),
                        );
                      },
                        child: Text('Sign In', style: TextStyle(color: Colors.red),))
                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
