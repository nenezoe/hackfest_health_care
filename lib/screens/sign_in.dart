import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hackfest_health_care/screens/dash_board.dart';
import 'package:hackfest_health_care/screens/sign_up.dart';

import '../widgets/custom_text_field.dart';


class SignIn extends StatefulWidget {


  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController =  TextEditingController();

  final box = GetStorage();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('Sign In'),
            Image.asset('assets/images/pix_two.jpg'),

            CustomTextField(
              controller: _emailController,
              onSaved: (value) {},
              labelText: "Enter Your Email",
              isObscure: false,
              onTap: (value) {  },
            ),
            CustomTextField(
              controller: _passwordController,
              onSaved: (value) {},
              labelText: "Password",
              isObscure: false,
              onTap: (value) {  },
            ),
            SizedBox(height: 20,),
            Center(child: Text('Forgot Password',style: TextStyle(fontSize: 18, color: Colors.red),)),
            SizedBox(height: 20,),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DashBoard()),
                );
              },
              child: InkWell(
                onTap: () {
                  formValidation();
                },
                child: Container(
                  height: 40,
                  width: double.infinity,
                  child: Center(child: Text('Sign In', style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Colors.white),)),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?", style: TextStyle(color: Color(0xff9EB3C2)),),
                SizedBox(width: 10,),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  SignUp()),
                    );
                  },
                    child: Text('Sign Up', style: TextStyle(color: Colors.red),))
              ],
            ),
            SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }

  formValidation(){

    if(_emailController.text.isEmpty)
    {
      Fluttertoast.showToast(msg: "Provide Username!");
    }
    else if(_passwordController.text.isEmpty)
    {
      Fluttertoast.showToast(msg: "Provide Password!");
    }
    else
    {
      showLoaderDialog(context);
      Login(_emailController.text, _passwordController.text,  );
    }
  }

  showLoaderDialog(BuildContext context){
    AlertDialog alert=AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 7, right: 7),child:Text("Loading..Please Wait.." )),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }

  /**login authentication**/
  Login( _emailController, _passwordController ) async {
    print('brejhreffbrhe');

    Map data = {
      "email":  _emailController,
      "password":   _passwordController,
      "grantType": "password",
      "refreshToken": ""
    };

    http.Response  response= await http.post(
      Uri.parse('http://jpapa555-001-site1.btempurl.com/api/Account/login'),
      headers: {
        // "Accept": "application/json",
        "Content-Type": "application/json"
      },

      body: jsonEncode(data),
      // body: jsonDecode(data),
      //   encoding: Encoding.getByName("utf-8")
    );
    // print(json.decoder(response.body));
    print(data);
    print(response.body);
    print('${response.statusCode.toString()}');
    print('$response.headers.toString()}');


    final responseData = json.decode(response.body);
    print('responseData');
    if(responseData["succeeded"] != true){
      Fluttertoast.showToast(msg: "Login Failed");
      throw HttpException(responseData["Result"]["Message"]);
    } else {
      box.write('authorization',  response.headers['refreshToken']);
      print("${responseData['responseMessage']}");
      print(box.read('authorization'));
      // pref.saveUser();

      Fluttertoast.showToast(msg: "Login successful");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => DashBoard(),
        ),
      );
      // Navigator.of(context).pushReplacementNamed(
      //   TabsScreen.routeName,
      // );
    }
  }
}
