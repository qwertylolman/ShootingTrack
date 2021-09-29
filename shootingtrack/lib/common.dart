class Common {
  static const String defaultBoxName = "DefaultBox";

  static const int maxWeaponNameLength = 50;
  static const int maxWeaponModelLength = 50;
}

bool equalsIgnoreCase(String? string1, String? string2)
  => string1?.toUpperCase() == string2?.toUpperCase();
