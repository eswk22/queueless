import 'package:meta/meta.dart';
import '../entities/entities.dart';

@immutable
class UserFavorite {
  final String id;
  final String category;
  final String orgbranch;
  final String org;
  final DateTime lastvisited;
  final bool ispinned;
  final String orgbranchid;


  UserFavorite({String id, String category, String org, String orgbranch,String orgbranchid,
                DateTime lastvisited, bool ispinned,})
      : this.id = id, this.category = category, this.org = org, this.orgbranch = orgbranch,
        this.orgbranchid = orgbranchid, this.lastvisited = lastvisited, this.ispinned = ispinned;


  UserFavorite copyWith({String id, String category, String org, String orgbranch,String orgbranchid, 
                         DateTime lastvisited, bool ispinned,}) {
    return UserFavorite(
      id: id ?? this.id,
      category : category ?? this.category,
      org: org ?? this.org,
      orgbranch: orgbranch ?? this.orgbranch,
      orgbranchid: orgbranchid ?? this.orgbranchid,
      lastvisited: lastvisited ?? this.lastvisited,
      ispinned: ispinned ?? this.ispinned,
    );
  }

  @override
  int get hashCode =>
      id.hashCode ^ category.hashCode ^ org.hashCode ^ orgbranch.hashCode 
      ^ orgbranchid.hashCode ^ lastvisited.hashCode ^ ispinned.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserFavorite &&
          runtimeType == other.runtimeType &&
          category == other.category &&
          org == other.org &&
          orgbranch == other.orgbranch &&
          orgbranchid == other.orgbranchid &&
          lastvisited == other.lastvisited &&
          ispinned == other.ispinned &&
          id == other.id;

  @override
  String toString() {
    return 'UserFavorite { id: $id, category: $category, org: $org, orgbranchid:$orgbranchid, orgbranch:$orgbranch, lastvisited: $lastvisited, ispinned :$ispinned }';
  }

  UserFavoriteEntity toEntity() {
    return  UserFavoriteEntity(id,category, orgbranchid, org,orgbranch,lastvisited,ispinned);
  }

  static UserFavorite fromEntity(UserFavoriteEntity entity) {
    return UserFavorite(
      id : entity.id,
      category: entity.category,
      orgbranchid: entity.orgbranchid,
      org: entity.org,
      orgbranch: entity.orgbranch,
      lastvisited: entity.lastvisited,
      ispinned: entity.ispinned,
    );
  }
}