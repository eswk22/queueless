import 'package:meta/meta.dart';
import '../entities/entities.dart';

@immutable
class Organization {
  final String id;
  final String name;
  final bool isactive;

  Organization({bool isactive = true, String name, String id})
      : this.name = name ?? '',
        this.isactive = isactive ?? true,
        this.id = id;


  Organization copyWith({String id, String name, bool isactive}) {
    return Organization(
      name : name ?? this.name,
      isactive: isactive ?? this.isactive,
      id: id ?? this.id,
    );
  }

  @override
  int get hashCode =>
      name.hashCode ^ isactive.hashCode ^ id.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Organization &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          isactive == other.isactive &&
          id == other.id;

  @override
  String toString() {
    return 'Organization{name: $name, active: $isactive, id: $id}';
  }

  OrgEntity toEntity() {
    return OrgEntity(name, id, isactive);
  }

  static Organization fromEntity(OrgEntity entity) {
    return Organization(
      name : entity.name,
      isactive: entity.isactive ?? false,
      id: entity.id,
    );
  }
}