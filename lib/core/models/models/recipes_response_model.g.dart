// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipes_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipesResponseModel _$RecipesResponseModelFromJson(
  Map<String, dynamic> json,
) => RecipesResponseModel(
  recipes: (json['recipes'] as List<dynamic>)
      .map((e) => RecipesModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$RecipesResponseModelToJson(
  RecipesResponseModel instance,
) => <String, dynamic>{'recipes': instance.recipes};
