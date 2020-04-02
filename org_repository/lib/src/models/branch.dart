import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import '../entities/entities.dart';

@immutable
class Branch {
  final String id;
  final String category;
  final int defaultmin;
  final int defaultmax;
  final String description;
  final double latitude;
  final double longitude;
  
  final String name;
  final String orgname;
  final int ratings;
  final String zipcode;

  final Map<dynamic, dynamic> address;
  final Map<dynamic, dynamic> businesshours;
  final Map<dynamic, dynamic> services;

  Branch({String id,String category,int defaultmin, int defaultmax, String description, double latitude,
          double longitude, String name, String orgname,int ratings,String zipcode, Map<dynamic, dynamic> address,
          Map<dynamic, dynamic> businesshours,Map<dynamic, dynamic> services,})
      : this.category = category,
        this.id = id,
        this.defaultmin = defaultmin,
        this.defaultmax = defaultmax,
        this.description = description,
        this.latitude = latitude,
        this.longitude = longitude,
        this.name = name,
        this.orgname = orgname,
        this.ratings = ratings,
        this.zipcode = zipcode,
        this.address = address,
        this.businesshours = businesshours,
        this.services = services;

  Branch copyWith({String id,String category,int defaultmin, int defaultmax, String description, double latitude,
          double longitude, String name, String orgname,int ratings,String zipcode, Map<dynamic, dynamic> address,
          Map<dynamic, dynamic> businesshours,Map<dynamic, dynamic> services}) {
    return Branch(
      id: id ?? this.id,
      category: category ?? this.category,
      defaultmin: defaultmin ?? this.defaultmin,
      defaultmax: defaultmax ?? this.defaultmax,
      description: description ?? this.description,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      name: name ?? this.name,
      orgname: orgname ?? this.orgname,
      ratings: ratings ?? this.ratings,
      zipcode: zipcode ?? this.zipcode,
      address: address ?? this.address,
      businesshours: businesshours ?? this.businesshours,
      services: services ?? this.services,
    );
  }

  @override
  int get hashCode =>
      category.hashCode ^ id.hashCode ^ defaultmin.hashCode ^ defaultmax.hashCode ^ description.hashCode ^
      latitude.hashCode ^ longitude.hashCode ^ name.hashCode ^ orgname.hashCode ^ ratings.hashCode ^
      zipcode.hashCode ^ address.hashCode ^ businesshours.hashCode ^ services.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Branch &&
          runtimeType == other.runtimeType &&
          category == other.category &&
          id == other.id &&
          defaultmin == other.defaultmin &&
          description == other.description &&
          latitude == other.latitude &&
          longitude == other.longitude &&
          name == other.name &&
          orgname == other.orgname &&
          ratings == other.ratings &&
          zipcode == other.zipcode &&
          address == other.address &&
          businesshours == other.businesshours &&
          services == other.services && 
          defaultmax == other.defaultmax;

  @override
  String toString() {
    return 'Branch { id: $id, name: $name, zipcode: $zipcode, orgname: $orgname }';
  }



  BranchEntity toEntity() {
    return BranchEntity(category, id, defaultmin, defaultmax,description,latitude, longitude,name, orgname,
                        ratings, zipcode, address, businesshours, services);
  }


  static Branch fromEntity(BranchEntity entity) {
    return Branch(
      category: entity.category,
      id: entity.id ?? false,
      defaultmin: entity.defaultmin,
      defaultmax: entity.defaultmax,
      description: entity.description,
      latitude: entity.latitude,
      longitude: entity.longitude,
      name: entity.name,
      orgname: entity.orgname,
      ratings: entity.ratings,
      zipcode: entity.zipcode,
      address: entity.address,
      businesshours: entity.businesshours,
      services: entity.services,
    );
  }
}