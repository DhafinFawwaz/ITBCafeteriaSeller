import 'package:flutter/material.dart';
import 'package:itb_cafeteria_seller/data/StaticData.dart';
import 'package:itb_cafeteria_seller/model/profile/profile_edit_model.dart';
import 'package:itb_cafeteria_seller/utils/GlobalTheme.dart';

import '../../services/api_service.dart';
import '../../widgets/normal_button.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({super.key});


  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? username = StaticData.profileData.data.username;
  String? telephone = StaticData.profileData.data.telephone;
  String? description = StaticData.profileData.data.description;
  int? locationId = StaticData.profileData.data.locationId;

  void onSubmit() async
  {
    if(validateAndSave()) {

      ProfileEditRequest model = ProfileEditRequest(
        username: username!, telephone: telephone!, description: description!, locationId: locationId!
      );

      APIService.editUserProfile(model).then((response) => {

        if(response.message != "success") {
          onEditFailed(response)
        }
        else {
          onEditSuccess()
        }
      });
    }
  }

  void onEditFailed(ProfileEditResponse response) {
    var snackBar = SnackBar(
      content: Text(response.message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void onEditSuccess() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Profile edited successfully"),
    ));

    StaticData.profileData.data.username = username!;
    StaticData.profileData.data.telephone = telephone!;
    StaticData.profileData.data.locationId = locationId!;
    StaticData.profileData.data.description = description!;
    Navigator.pop(context);
  }

  bool validateAndSave() {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: TextStyle(
            color: Colors.black,
          )
        ),
        elevation: 0,
        backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
      ),

      body: Container(
        color: GlobalTheme.slate100,
        child: Padding(
          padding: EdgeInsets.all(GlobalTheme.padding1),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                const SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.emailAddress, // Use email input type for emails.
                  decoration: InputDecoration(
                    hintText: 'Your name',
                    labelText: 'Username'
                  ),
                  initialValue: StaticData.profileData.data.username,
                  onSaved: (value) => username = value,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: '0812345678',
                    labelText: 'Telephone Number'
                  ),
                  initialValue: StaticData.profileData.data.telephone,
                  onSaved: (value) => telephone = value,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Description',
                    labelText: 'Description'
                  ),
                  initialValue: StaticData.profileData.data.description,
                  onSaved: (value) => description = value,
                ),
                const SizedBox(height: 20),
                DropdownButton<String?>(
                  value: StaticData.locationById[StaticData.profileData.data.locationId-1],
                  elevation: 0,
                  hint: Text("Location"),
                  items: StaticData.locationById.map((location) {
                    return DropdownMenuItem(
                      value: location,
                      child: Text(location),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      locationId = StaticData.locationById.indexOf(value!) + 1;
                  });
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: onSubmit,
                  
                  style: ElevatedButton.styleFrom(
                    backgroundColor: GlobalTheme.primaryColor,
                    shadowColor: Colors.transparent,
                    elevation: 0.0,
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  ).copyWith(
                      elevation: ButtonStyleButton.allOrNull(0.0)
                  ),
                  child: Text(
                    "Apply",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                )
                
              ],
            ),
          ),
        )
      ),
    );
  }
}