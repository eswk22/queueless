import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserProfileEntity extends Equatable {
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



  UserProfileEntity(this.id,this.firstname, this.lastname,this.address1,this.address2,this.city,this.state,
  this.country,this.zipcode, this.phoneno, this.email);

  Map<String, Object> toJson() {
    return {
      "id": id,
      "firstname": firstname,
      "lastname": lastname,
      "address1": address1,
      "address2" : address2,
      "city": city,
      "state" : state,
      "country" : country,
      "zipcode" : zipcode,
      "phoneno" : phoneno,
      "email" :  email
    };
  }

  @override
  List<Object> get props => [firstname, id, lastname,address1, address2, city, state, country, zipcode,phoneno, email];

  @override
  String toString() {
    return 'UserProfileEntity { firstname: $firstname, id: $id, lastname: $lastname, address1:$address1, address2:$address2, city: $city, state :$state, country: $country,zipcode : $zipcode, phoneno: $phoneno, email: $email }';
  }



  static UserProfileEntity fromJson(Map<String, Object> json) {
    return UserProfileEntity(
      json["id"] as String,
      json["firstname"] as String,
      json["lastname"] as String,
      json["address1"] as String,
      json["address2"] as String,
      json["city"] as String,
      json["state"] as String,
      json["country"] as String,
      json["zipcode"] as String,
      json["phoneno"] as String,
      json["email"] as String,
    );
  }



  static UserProfileEntity fromSnapshot(DocumentSnapshot snap) {
    return UserProfileEntity(
      snap.documentID,
      snap.data['firstname'],
      snap.data['lastname'],
      snap.data['address1'],
      snap.data['address2'],
      snap.data['city'],
      snap.data['state'],
      snap.data['country'],
      snap.data['zipcode'],
      snap.data['phoneno'],
      snap.data['email'],
    );
  }

  Map<String, Object> toDocument() {
    return {
      "firstname": firstname,
      "lastname": lastname,
      "address1": address1,
      "address2": address2,
      "city": city,
      "state": state,
      "country": country,
      "zipcode": zipcode,
      "phoneno": phoneno,
      "email": email,
    };
  }
}