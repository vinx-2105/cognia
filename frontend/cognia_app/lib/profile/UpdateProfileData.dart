class UpdateProfileData{
  String _role;
  String _gender;
  String _phone;
  String _home_address;

  // UpdateProfileData(role, gender){
  //   this._role = role;
  //   this._gender = gender;
  // }

  String getRole(){
    return _role;
  }
  String getGender(){
    return _gender;
  }
  String getPhone(){
    return _phone;
  }
  String getHomeAddress(){
    return _home_address;
  }
  setRole(role){
    this._role = role;
  }
  setGender(gender){
    this._gender = gender;
  }
  setPhone(phone){
    this._phone = phone;
  }
  setHomeAddress(home_address){
    this._home_address = home_address;
  }
}