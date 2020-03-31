class UpdateProfileData{
  String _role;
  String _gender;

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
  setRole(role){
    this._role = role;
  }
  setGender(gender){
    this._gender = gender;
  }
}