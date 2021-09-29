class Common {
  static const int maxWeaponNameLength = 200;
  static const int maxWeaponManufacturerLength = 50;
  static const int maxWeaponModelLength = 50;
  static const int maxWeaponGaugeLength = 50;
}

bool equalsIgnoreCase(String? string1, String? string2)
  => string1?.toUpperCase() == string2?.toUpperCase();
