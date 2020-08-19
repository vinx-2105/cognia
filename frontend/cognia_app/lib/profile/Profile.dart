class Profile{
  final String first_name ;
  final String last_name ;
  final String username ;
  final String gender ;
  final String role ;
  final List<String> caretakers ;
  final String phone;
  final String home_address;
  

  Profile({this.first_name, this.last_name, this.username, this.gender, this.role, this.caretakers, this.phone, this.home_address});

  factory Profile.fromJSON(Map<String, dynamic> json){

    return Profile(
      first_name: json['first_name'],
      last_name: json['last_name'],
      username: json['username'],
      gender: json['gender'],
      role: json['role'],
      caretakers: json['caretakers']!=null ? List.from(json['caretakers']):null,
      phone: json['phone'],
      home_address: json['home_address']
    );
  }
}