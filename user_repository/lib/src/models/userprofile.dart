import 'package:meta/meta.dart';
import '../entities/entities.dart';

@immutable
class UserProfile {
  final String id;
  final String firstname;
  final String lastname;
  final String address1;
  final String address2;
  final String city;
  final String state;
  final String country;
  final String phoneno;
  final String email;
  final String zipcode;


  UserProfile({String id, String firstname, String lastname, String address1,String address2, String city, String state,
               String country, String phoneno, String email, String zipcode})
      : this.firstname = firstname, this.lastname = lastname, this.address1 = address1, this.address2 = address2,
        this.city = city, this.state = state, this.country = country, this.phoneno = phoneno, this.email = email,
        this.zipcode = zipcode, this.id = id;


  UserProfile copyWith({String id, String firstname, String lastname, String address1,String address2, String city, String state,
               String country, String phoneno, String email, String zipcode}) {
    return UserProfile(
      id: id ?? this.id,
      firstname : firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      address1: address1 ?? this.address1,
      address2: address2 ?? this.address2,
      city: city ?? this.city,
      state: state ?? this.state,
      country: country ?? this.country,
      phoneno: phoneno ?? this.phoneno,
      email: email ?? this.email,
      zipcode: zipcode ?? this.zipcode,
    );
  }

  @override
  int get hashCode =>
      id.hashCode ^ firstname.hashCode ^ lastname.hashCode ^ address1.hashCode ^ address2.hashCode ^ city.hashCode 
      ^ state.hashCode ^ country.hashCode ^ phoneno.hashCode ^ email.hashCode ^ zipcode.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserProfile &&
          runtimeType == other.runtimeType &&
          firstname == other.firstname &&
          lastname == other.lastname &&
          address1 == other.address1 &&
          address2 == other.address2 &&
          city == other.city &&
          state == other.state &&
          country == other.country &&
          phoneno == other.phoneno &&
          email == other.email &&
          zipcode == other.zipcode &&
          id == other.id;

  @override
  String toString() {
    return 'UserProfile { firstname: $firstname, id: $id, lastname: $lastname, address1:$address1, address2:$address2, city: $city, state :$state, country: $country,zipcode : $zipcode, phoneno: $phoneno, email: $email }';
  }

  UserProfileEntity toEntity() {
    return  UserProfileEntity(id,firstname, lastname,address1,address2,city,state,country,zipcode, phoneno, email);
  }

  static UserProfile fromEntity(UserProfileEntity entity) {
    return UserProfile(
      id : entity.id,
      firstname: entity.firstname,
      lastname: entity.lastname,
      address1: entity.address1,
      address2: entity.address2,
      city: entity.city,
      state: entity.state,
      country: entity.country,
      zipcode: entity.zipcode,
      phoneno: entity.phoneno,
      email: entity.email,
    );
  }
}