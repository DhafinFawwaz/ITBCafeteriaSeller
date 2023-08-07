import '../model/profile/profile_model.dart';

class StaticData {
  static ProfileResponse profileData = ProfileResponse(message: "", data: Data(
    id: 0,
    locationId: 1,
    username: "",
    password: "",
    email: "",
    description: "",
    image: "",
    telephone: "",
    createdAt: DateTime.now(),
    modifiedAt: DateTime.now(),
  ));

  static getLocationById(int id) {
    if(id == 0) return "GKUB";
    return locationById[id-1];
  }

  static const locationById = [
    'GKUB', 
    'GKUT', 
    'Depan',
    'Borju',
    'SBM',
    'CRCS', 
    'Saraga'
  ];

  static const categoryById = [
    'Makanan', 
    'Minuman', 
    'Lainnya',
  ];
}