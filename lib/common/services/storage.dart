import 'package:elearning/common/utils/constants.dart';
import'package:shared_preferences/shared_preferences.dart';
class StorageService{
  late final SharedPreferences _pref;

  Future<StorageService> init() async {
    _pref = await SharedPreferences.getInstance();
    return this;
  }

  Future <bool> setString (String key, String value) async {
    return await _pref.setString(key, value);
  }

  Future<bool>setBool(String key , bool value) async {
    return await _pref.setBool(key, value);
  }
//check if user had once used the app 
  bool getDeviceFirstOpen(){
    return _pref.getBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_KEY)??false;
  }
//check f user is logged in by getting the prof key
  bool isLoggedIn(){
    return _pref.getString(AppConstants.STORAGE_USER_PROFILE_KEY)!=null?true:false;
  }
}