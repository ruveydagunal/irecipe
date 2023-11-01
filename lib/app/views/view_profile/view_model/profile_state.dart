abstract class ProfileState {
  final String? name;
  final String? surname;
  final String? email;

  ProfileState({this.name, this.surname, this.email});
}

class ProfileInitialState extends ProfileState {
  ProfileInitialState({this.name, this.surname, this.email})
      : super(name: name, surname: surname, email: email);

  final String? name;
  final String? surname;
  final String? email;
}
