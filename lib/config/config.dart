class Config {
  static const String appName = "ITBCafeteria";
  // static const String apiURL = "https://itb-cafeteria-server.vercel.app";
  static const String apiURL = "http://192.168.191.18:3000";
  // static const String apiURL = "https://10.0.2.2:3000";
  static const String loginURL = apiURL + "/shop/login";
  static const String registerURL = apiURL + "/shop/register";
  static const String profileURL = apiURL + "/shop/profile";
  static const String editProfileURL = apiURL + "/shop/profile/edit";
  static const String editProfileImageURL = apiURL + "/shop/profile/edit/image";
  
  static const String ownedProductURL = apiURL + "/product/shop/product";
  static const String cartOrderURL = apiURL + "/cart/shop";
  static const String addProductURL = apiURL + "/product/add";

  static const String editCartStatusURL = apiURL + "/cart/edit/cartstatus";
}
