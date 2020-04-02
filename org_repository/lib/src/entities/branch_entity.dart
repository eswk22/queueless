import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class BranchEntity extends Equatable {
  final String id;
  final String category;
  final int defaultmin;
  final int defaultmax;
  final String description;
  final double latitude;
  final double longitude;
  GeoPoint location;
  final String name;
  final String orgname;
  final int ratings;
  final String zipcode;

  final Map<dynamic, dynamic> address;
  final Map<dynamic, dynamic> businesshours;
  final Map<dynamic, dynamic> services;

  BranchEntity(this.category, this.id,this.defaultmin,this.defaultmax,this.description,
               this.latitude, this.longitude, this.name, this.orgname, this.ratings, this.zipcode, this.address,
               this.businesshours, this.services) :
               this.location = GeoPoint(latitude,longitude);


  Map<String, Object> toJson() {
    return {
      "category": category,
      "default_min": defaultmin,
      "default_max": defaultmax,
      "id": id,
      "description": description,
      "location" : location,
      "name" : name,
      "org_name" : orgname,
      "ratings" : ratings,
      "zipcode" : zipcode,
      "address" : address,
      "businesshours" : businesshours,
      "services" : services,
    };
  }

  @override
  List<Object> get props => [ category, id,defaultmin,defaultmax,description,location, name,
  orgname, ratings,zipcode,address, businesshours,services ];

  @override
  String toString() {
    return 'BranchEntity { id: $id, name: $name, zipcode: $zipcode, orgname: $orgname }';
  }

  static BranchEntity fromJson(Map<String, Object> json) {
    return BranchEntity(
      json["category"] as String,
      json["id"] as String,
      json["defaultmin"] as int,
      json["defaultmax"] as int,
      json["description"] as String,
      (json["location"] as GeoPoint).latitude,
      (json["location"] as GeoPoint).longitude,
      json["name"] as String,
      json["orgname"] as String,
      json["ratings"] as int,
      json["zipcode"] as String,
      json["address"] as Map,
      json["businesshours"] as Map,
      json["services"] as Map,
    );
  }

  static BranchEntity fromSnapshot(DocumentSnapshot snap) {
    return BranchEntity(
      snap.data['category'],
      snap.documentID,
      snap.data['defaultmin'],
      snap.data['defaultmax'],
      snap.data['description'],
      (snap.data['location'] as GeoPoint).latitude,
      (snap.data['location'] as GeoPoint).longitude,
      snap.data['name'],
      snap.data['orgname'],
      snap.data['ratings'],
      snap.data['zipcode'],
      snap.data['address'],
      snap.data['businesshours'],
      snap.data['services'],
    );
  }

  Map<String, Object> toDocument() {
    return {
      "category" : category,
      "default_min" : defaultmin,
      "default_max" : defaultmax,
      "description" : description,
      "location" : location,
      "name" : name,
      "org_name" : orgname,
      "ratings" : ratings,
      "zipcode" : zipcode,
      "address" : address,
      "businesshours" : businesshours,
      "services" : services,
    };
  }
}