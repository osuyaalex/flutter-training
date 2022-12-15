import 'package:intl/intl.dart';
class Util{
  //static String appId= 'Add your own appid';
  static String appId = '253fb00c330f4fcc9243bea80ae3dcfb';

  //the date (dt) in the api needs to be formatted in order to be readable and used. this is how we do it;

  static String getFormattedDate(DateTime dateTime){
// in the pubspec.yaml, intl was called and this gives us access to the DateFormat function below
    return DateFormat("EEE, MMM d, y").format(dateTime);
  }
}