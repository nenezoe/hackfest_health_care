import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hackfest_health_care/screens/dash_board.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hackfest_health_care/screens/sign_in.dart';

import '../widgets/custom_text_field.dart';


class SignUp extends StatefulWidget {

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _firstNameController = new TextEditingController();

  TextEditingController _lastNameController = new TextEditingController();

  TextEditingController _emailController = new TextEditingController();

  TextEditingController _phoneNumberController = new TextEditingController();

  TextEditingController _addressController = new TextEditingController();

  TextEditingController _passwordController = new TextEditingController();

  TextEditingController _reEnterPasswordController = new TextEditingController();

  final box = GetStorage();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                controller: _firstNameController,
                onSaved: (value) {},
                labelText: "First Name",
                isObscure: false,
                onTap: (value) {  },
              ),

              CustomTextField(
                controller: _lastNameController,
                onSaved: (value) {},
                labelText: "Last Name",
                isObscure: false,
                onTap: (value) {  },
              ),
              CustomTextField(
                controller: _emailController,
                onSaved: (value) {},
                labelText: "Enter Email",
                isObscure: false,
                onTap: (value) {  },
              ),
              CustomTextField(
                controller: _phoneNumberController,
                onSaved: (value) {},
                labelText: "Enter Phone Number",
                isObscure: false,
                onTap: (value) {  },
              ),
              CustomTextField(
                controller: _addressController,
                onSaved: (value) {},
                labelText: "Enter Address",
                isObscure: false,
                onTap: (value) {  },
              ),
              CustomTextField(
                controller: _passwordController,
                onSaved: (value) {},
                labelText: "Enter Password",
                isObscure: false,
                onTap: (value) {  },
              ),
              CustomTextField(
                controller: _reEnterPasswordController,
                onSaved: (value) {},
                labelText: "ReEnter Password",
                isObscure: false,
                onTap: (value) {  },
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Text('As a'),
                  SizedBox(width: 10,),
                  Container(
                    height: 40,
                    width: 180,
                    child: Center(child: Text('Health care Professional', style: TextStyle(color: Colors.deepPurple),)),
                    decoration: BoxDecoration(
                      color: Color(0xff999999),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
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
              // Spacer(),
              SizedBox(height: 40,),
              InkWell(
                onTap: () {
                  formValidation();

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
                      child: Text('Sign In', style: TextStyle(color: Colors.red),)),

                ],
              ),
              SizedBox(height: 30,)
            ],
          ),
        ),
      ),
    );
  }

  formValidation(){

    if(_firstNameController.text.isEmpty)
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
      Registration(_firstNameController.text, _lastNameController.text, _emailController.text, _phoneNumberController.text, _addressController.text,_passwordController.text, _reEnterPasswordController.text );
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

  //
  // void main() async {
  //   http.Response response = await createUser("Bob", "engineer");
  //
  //   print(response.body);
  // }
  //
  // Future<http.Response> createUser(String name, String job) {
  //   return http.post(
  //     Uri.parse('https://reqres.in/api/users'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, String>{
  //       'name': name,
  //       'job': job
  //     }),
  //   );
  // }






  /**login authentication**/
  Registration(_firstNameController,_lastNameController, _emailController, _phoneNumberController, _addressController, _passwordController, _reEnterPasswordController) async {
    print('brejhreffbrhe');

    Map data = {
      "firstName":  _firstNameController,
      "lastName":  _lastNameController,
      "email":  _emailController,
      "phoneNumber":  _phoneNumberController,
      "address":  _addressController,
      "password":   _passwordController,
      "rtPassword":   _reEnterPasswordController
    };

    http.Response  response= await http.post(
        Uri.parse('http://jpapa555-001-site1.btempurl.com/api/Account/register'),
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
    if(responseData["responseMessage"] != "Successful"){
      Fluttertoast.showToast(msg: "Registration Failed");
      throw HttpException(responseData["Result"]["Message"]);
    } else {
      // box.write('authorization',  response.headers['authorization']);
      // box.write('username', _firstNameController);
      // box.write('email', responseData['Result']['Result']['email_address']);
      // box.write('phonenumber', responseData['Result']['Result']['phone_number']);
      print("${responseData['responseMessage']}");
      // print(box.read('authorization'));
      // pref.saveUser();

      Fluttertoast.showToast(msg: "Registration successful");
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
