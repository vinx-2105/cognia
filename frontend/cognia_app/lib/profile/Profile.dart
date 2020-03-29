class Profile{
  final String first_name ;
  final String last_name ;
  final String username ;
  final String gender ;
  final String role ;
  final List<String> caretakers ;

  Profile({this.first_name, this.last_name, this.username, this.gender, this.role, this.caretakers});

  factory Profile.fromJSON(Map<String, dynamic> json){

    return Profile(
      first_name: json['first_name'],
      last_name: json['last_name'],
      username: json['username'],
      gender: json['gender'],
      role: json['role'],
      caretakers: json['caretakers']!=null ? List.from(json['caretakers']):null,
    );
  }
}