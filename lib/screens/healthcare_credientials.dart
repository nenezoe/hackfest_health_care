import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import '../widgets/custom_text_field.dart';
import 'health_care_confirmation.dart';


class HealthCareCredential extends StatefulWidget {
  const HealthCareCredential({Key? key}) : super(key: key);

  @override
  State<HealthCareCredential> createState() => _HealthCareCredentialState();
}

class _HealthCareCredentialState extends State<HealthCareCredential> {
  TextEditingController _pickDate = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  TextEditingController _selectedTimeController = TextEditingController();
  final box = GetStorage();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dateinput.text = "";
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color(0xffD9D9D9),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30,),
                Container(
                  width: double.infinity,
                  height:  150,
                  child: Center(child: Text('Add image here')),
                  color: Colors.grey,

                ),
                SizedBox(height: 10,),
                CustomTextField(
                  // controller: _otherNameController,
                  onSaved: (value) {},
                  labelText: "First Name ",
                  isObscure: false,
                  onTap: (value) {  },
                ),
                CustomTextField(
                  // controller: _otherNameController,
                  onSaved: (value) {},
                  labelText: "Last Name",
                  isObscure: false,
                  onTap: (value) {  },
                ),
                CustomTextField(
                  // controller: _otherNameController,
                  onSaved: (value) {},
                  labelText: "Title",
                  isObscure: false,
                  onTap: (value) {  },
                ),
                CustomTextField(
                  // controller: _otherNameController,
                  onSaved: (value) {},
                  labelText: "Specialization",
                  isObscure: false,
                  onTap: (value) {  },
                ),
                CustomTextField(
                  // controller: _otherNameController,
                  onSaved: (value) {},
                  labelText: "Type Of Credential",
                  isObscure: false,
                  onTap: (value) {  },
                ),
                CustomTextField(
                  // controller: _otherNameController,
                  onSaved: (value) {},
                  labelText: "Upload a Pdf",
                  isObscure: false,
                  onTap: (value) {  },
                ),

                TextFormField(
                  controller:
                  _pickDate, //editing controller of this TextField
                  decoration: InputDecoration(
                    labelText: "Choose Interview Date",
                    suffixIcon:
                    Icon(Icons.calendar_today), //icon of text field
                    // labelText: "Enter Date" //label text of field
                  ),
                  readOnly:
                  true, //set it true, so that user will not able to edit text
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(
                            2000), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101));

                    if (pickedDate != null) {
                      print(
                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                      setState(() {
                        _pickDate.text = formattedDate;
                      });
                      box.write('_pickDate', 'selectedDate');
                      // final prefs = await SharedPreferences.getInstance();
                      // await prefs.setString('_familyDetailDateOfBirth', formattedDate);

                      print(
                          formattedDate); //formatted date output using intl package =>  2021-03-16
                      //you can implement different kind of Date Format here according to your requirement

                      setState(() {
                        dateinput.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {
                      print("Date is not selected");
                    }
                  },
                ),
                CustomTextField(
                  controller: _selectedTimeController,
                  onSaved: (value) {},
                  labelText: "Choose Interview Time",
                  isObscure: false,
                  onTap: (value) {  },
                ),
                CustomTextField(
                  // controller: _otherNameController,
                  onSaved: (value) {},
                  labelText: "Add Location",
                  isObscure: false,
                  onTap: (value) {  },
                ),
                SizedBox(height: 10,),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  HealthCareConfirmation()),
                    );
                  },
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    child: Center(child: Text('Confirm', style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Colors.white),)),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                  ),
                ),
                SizedBox(height: 40,),
              ],
            ),
          ),
        ),
      ),
    );
  }


}
