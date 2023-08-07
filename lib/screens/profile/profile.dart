import 'package:flutter/material.dart';
import '../../widgets/custom_menu_base.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return CustomMenuBase(
      hoveringChild: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('My Store', style: TextStyle(
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
          ),
          Divider(
            color: Colors.grey[800],
            height: 30.0,
          ),
          Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 40.0,
                ),
                SizedBox(width: 20.0),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Nama toko',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                      ),
                      Text(
                        'alamat email/no telp',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15.0,
                        ),
                      )
                    ]),
                SizedBox(width: 20.0),
                FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: Colors.grey[200],
                    elevation: 0.0,
                    child: Text(
                        'Edit',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black
                        )
                    )
                )
              ]
          ),
          Divider(
            color: Colors.grey[800],
            height: 30.0,
          ),
          SizedBox(height: 10.0),
          Text(
            'Pengaturan Akun',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 20.0),
        ],
      ),
      child: Padding(
      padding: const EdgeInsets.fromLTRB(30.0, 150.0, 30.0, 0),
      child: Column(
        children: [
          Row(
            children: <Widget>[
              Icon(
                Icons.money,
                color: Colors.black,
              ),
              SizedBox(width: 10.0),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Pembayaran',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.5,
                      ),
                    ),
                    Text(
                      'Ewallet, kredit',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15.0,
                      ),
                    )
                  ]),
            ],
          ),
          SizedBox(height: 20.0),
          Row(
            children: <Widget>[
              Icon(
                Icons.location_city,
                color: Colors.black,
              ),
              SizedBox(width: 10.0),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Lokasi Kantin',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.5,
                      ),
                    ),
                    Text(
                      'GKUB',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15.0,
                      ),
                    )
                  ]),
            ],
          ),
          SizedBox(height: 20.0),
          Row(
            children: <Widget>[
              Icon(
                Icons.security,
                color: Colors.black,
              ),
              SizedBox(width: 10.0),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Keamanan',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.5,
                      ),
                    ),
                    Text(
                      'Login 2FA, password, biometrik',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15.0,
                      ),
                    )
                  ]),
            ],
          ),
          SizedBox(height: 20.0),
          Row(
            children: <Widget>[
              Icon(
                Icons.privacy_tip,
                color: Colors.black,
              ),
              SizedBox(width: 10.0),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Privasi',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.5,
                      ),
                    ),
                    Text(
                      'S&K',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15.0,
                      ),
                    )
                  ]),
            ],
          ),
          SizedBox(height: 20.0),
          Row(
            children: <Widget>[
              Icon(
                Icons.notification_add,
                color: Colors.black,
              ),
              SizedBox(width: 10.0),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Notifikasi',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.5,
                      ),
                    ),
                    Text(
                      'Muted',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15.0,
                      ),
                    )
                  ]),
            ],
          ),
          SizedBox(height: 20.0),
          Row(
            children: <Widget>[
              Icon(
                Icons.logout,
                color: Colors.red,
              ),
              SizedBox(width: 10.0),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.5,
                      ),
                    ),
                    Text(
                      'keluar dari akun',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 15.0,
                      ),
                    )
                  ]),
            ],
          ),
          Spacer(),
        ],
      ),
    )
    );
  }
}