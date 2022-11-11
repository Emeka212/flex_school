import 'package:hive/hive.dart';

//======================================================================
// RUN FUNCTION EVERYTIME PAGE BUILD
//======================================================================
class PublicVariables {
  static late Box<bool> parentDB;
  static late Box<bool> schoolUserDB;
  static late Box<Map> schoolDetails;
  static late Box<bool> isDarkThemeDB;
  static late Map<String, dynamic> loginPageApiData;
}
