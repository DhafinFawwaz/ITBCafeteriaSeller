import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:itb_cafeteria_seller/screens/profile/profile_edit.dart';
import 'package:itb_cafeteria_seller/utils/GlobalTheme.dart';

import '../../data/StaticData.dart';
import '../../model/profile/profile_model.dart';
import '../../services/api_service.dart';
import '../../services/shared_service.dart';
import '../../widgets/settings_button.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  void getUserProfile() async {
    StaticData.profileData = await APIService.getUserProfile();
    setState(() {});
  }
  @override
  void initState() {
    super.initState();
    if(StaticData.profileData.message == "")
    {
      getUserProfile();
      
    }
  }

  void onImageEdit() async {
    print("Image Edit");

    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image == null) return;

      APIService.editUserImageProfile(image.path).then((response) => {
        setState(() {
          StaticData.profileData.data.image = response;
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Profile edited successfully"),
            ));
        }),
      });

    } catch(e) {
      print('Failed to pick image: $e');
    }
  }

  void onEditSuccess() {
    
    Navigator.pop(context);
  }

  void NavigateToProfileEdit() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => ProfileEdit(),
      ),
    ).then((_) {
      setState(() {});
    });
  }


  @override
  Widget build(BuildContext context) {
    if(StaticData.profileData.data != null) {
      Data data = StaticData.profileData.data;
      if(data.image == "") {
        data.image = 'https://i.cbc.ca/1.5359228.1577206958!/fileImage/httpImage/image.jpg_gen/derivatives/16x9_620/smudge-the-viral-cat.jpg';
      }
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('My Store',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              )),
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: ListView(
          children: <Widget>[
            Divider(
              color: Colors.grey[800],
              height: 30.0,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(GlobalTheme.padding1, 0, GlobalTheme.padding1, 0),
              child: Row(children: <Widget>[
                GestureDetector(
                  onTap: onImageEdit,
                  child: CircleAvatar(
                    radius: 40.0,
                    backgroundImage: NetworkImage(StaticData.profileData.data.image),
                  ),
                ),
                const SizedBox(width: 20.0),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '${data.username}',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17.0,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      Text(
                        '${data.email}/${data.telephone}',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13.0,
                        ),
                      ),
                      Text(
                        "${StaticData.getLocationById(data.locationId)}",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.0,
                        ),
                      ),
                      Container(
                        width: 150,
                        child: Text(
                        'Menjual berbagai makanan dan minuman',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.0,
                        ),
                      )
                      )
                    ]),
                const SizedBox(width: 20.0),
                const Spacer(),
                FloatingActionButton(
                    onPressed: NavigateToProfileEdit,
                    backgroundColor: Colors.grey[200],
                    elevation: 0.0,
                    child: const Text('Edit',
                        style: TextStyle(fontSize: 14, color: Colors.black)))
              ]),
            ),
            Divider(
              color: Colors.grey[800],
              height: 30.0,
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: GlobalTheme.padding1),
              child: const Text(
                'Pengaturan Akun',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            SettingsButton(
              icon: Icons.money_outlined,
              headerText: "Metode Pembayaran",
              descriptionText: 'E-wallet, Kredit',
              onPressed: () {}
            ),
            SettingsButton(
              icon: Icons.lock,
              headerText: "Keamanan",
              descriptionText: "Login 2FA, Password, biometrik",
              onPressed: () {}
            ),
            SettingsButton(
              icon: Icons.privacy_tip,
              headerText: "Privasi",
              descriptionText: "S & K",
              onPressed: () {}
            ),
            SettingsButton(
              icon: Icons.notifications,
              headerText: "Notifikasi",
              descriptionText: "Muted",
              onPressed: () {}
            ),
            SettingsButton(
              icon: Icons.logout,
              headerText: "Logout",
              descriptionText: "Keluar dari akun",
              onPressed: () {
                SharedService.logout(context);
              }
            )        
            ],
        ),
      );
    
    }

    return const Center(
      child: CircularProgressIndicator(),
    );
    
      
  }
}