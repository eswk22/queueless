import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserFavoriteEntity extends Equatable {
  final String id;
  final String category;
  final String orgbranch;
  final String org;
  final DateTime lastvisited;
  final bool ispinned;
  final String orgbranchid;



  UserFavoriteEntity(this.id,this.category, this.orgbranchid, this.org,this.orgbranch,this.lastvisited,this.ispinned);

  Map<String, Object> toJson() {
    return {
      "id": id,
      "category": category,
      "org": org,
      "orgbranch": orgbranch,
      "lastvisited" : lastvisited,
      "ispinned": ispinned,
      "orgbranchid" : orgbranchid,
    };
  }

  @override
  List<Object> get props => [id, category, org,orgbranchid, orgbranch, lastvisited, ispinned,];

  @override
  String toString() {
    return 'UserFavoriteEntity { id: $id, category: $category, org: $org, orgbranchid:$orgbranchid, orgbranch:$orgbranch, lastvisited: $lastvisited, ispinned :$ispinned }';
  }



  static UserFavoriteEntity fromJson(Map<String, Object> json) {
    return UserFavoriteEntity(
      json["id"] as String,
      json["category"] as String,
      json["orgbranchid"] as String,
      json["org"] as String,
      json["orgbranch"] as String,
      json["lastvisited"] as DateTime,
      json["ispinned"] as bool,
    );
  }




  static UserFavoriteEntity fromSnapshot(DocumentSnapshot snap) {
    return UserFavoriteEntity(
      snap.documentID,
      snap.data['category'],
      snap.data['orgbranchid'],
      snap.data['org'],
      snap.data['orgbranch'],
      snap.data['lastvisited'],
      snap.data['ispinned'],
    );
  }

  Map<String, Object> toDocument() {
    return {
      "category": category,
      "org": org,
      "orgbranch": orgbranch,
      "orgbranchid": orgbranchid,
      "lastvisited": lastvisited,
      "ispinned": ispinned,
    };
  }
}