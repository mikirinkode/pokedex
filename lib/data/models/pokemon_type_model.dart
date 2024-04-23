class PokemonTypeModel {
  final TypeInfo type;

  PokemonTypeModel({required this.type});

  factory PokemonTypeModel.fromJson(Map<String, dynamic> json) {
    return PokemonTypeModel(
      type: TypeInfo.fromJson(json['type']),
    );
  }
}

class TypeInfo {
  final String typeName;

  TypeInfo({required this.typeName});

  factory TypeInfo.fromJson(Map<String, dynamic> json) {
    return TypeInfo(
      typeName: json['name'],
    );
  }
}