class MyAssets {
  // Common UI icons

  static String logo = "logo".jpeg;
  static String splashShape = "splash_shape".png;
  static String google = "google".png;
}

extension Photo on String {
  String get png => "assets/icons/$this.png";

  String get jpg => "assets/icons/$this.jpg";

  String get jpeg => "assets/icons/$this.jpeg";

  String get gif => "assets/gif/$this.gif";
}
