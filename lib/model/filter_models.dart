// filter_models.dart

import 'package:json_annotation/json_annotation.dart';

part 'filter_models.g.dart';

@JsonSerializable()
class FilterResponse {
  final List<FilterGroup> filters;
  final List<Item>? items;
  FilterResponse({required this.filters, required this.items});
  factory FilterResponse.fromJson(Map<String, dynamic> json) =>
      _$FilterResponseFromJson(json);
}

@JsonSerializable()
class FilterGroup {
  final String name;
  final String type;
  final List<Category> categories;
  FilterGroup({
    required this.name,
    required this.type,
    required this.categories,
  });
  factory FilterGroup.fromJson(Map<String, dynamic> json) =>
      _$FilterGroupFromJson(json);
}

@JsonSerializable()
class Category {
  final String id;
  final String name;
  @JsonKey(includeFromJson: false)
  bool? selected;
  Category({required this.id, required this.name,  bool? selected });
  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

// @JsonSerializable()
// class Item {
//   final String section;
//   final String name;
//   final String city;
//   final String type;
//   @JsonKey(name: 'images')
//   final List<ImageData> images;
//   @JsonKey(name: 'categories')
//   final List<ItemCategory> categories;
//   Item({
//     required this.section,
//     required this.name,
//     required this.city,
//     required this.type,
//     required this.images,
//     required this.categories,
//   });
//   factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
// }

// @JsonSerializable()
// class ImageData {
//   final String url;
//   ImageData({required this.url});
//   factory ImageData.fromJson(Map<String, dynamic> json) =>
//       _$ImageDataFromJson(json);
// }

// @JsonSerializable()
// class ItemCategory {
//   final String id;
//   // (you can add other fields here if needed)
//   ItemCategory({required this.id});
//   factory ItemCategory.fromJson(Map<String, dynamic> json) =>
//       _$ItemCategoryFromJson(json);
// }




@JsonSerializable()
class Item {
  final String section;
  final String name;
  final String city;
  final String type;
  @JsonKey(name: 'images')
  final List<ImageData> images;
  @JsonKey(name: 'categories')
  final List<ItemCategory> categories;
  @JsonKey(name: 'openingHours')
  final Map<String, dynamic> openingHours; // Or a more specific type if known
  final bool accessibleForGuestPass;
  @JsonKey(name: 'overviewText')
  final List<OverviewText> overviewText;
  @JsonKey(name: 'thingsToDo',defaultValue: <ThingsToDo>[])
  final List<ThingsToDo> thingsToDo;

  @JsonKey(name: 'coordinates')
  final Coordinates? coordinates;

  Item({
    required this.section,
    required this.name,
    required this.city,
    required this.type,
    required this.images,
    required this.categories,
    required this.openingHours,
    required this.accessibleForGuestPass,
    required this.overviewText,
    required this.coordinates,
    required this.thingsToDo,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}

@JsonSerializable()
class ImageData {
  // Define the properties of ImageData based on your JSON structure
  final String? url;
  // Add other properties of ImageData

  ImageData({this.url});

  factory ImageData.fromJson(Map<String, dynamic> json) => _$ImageDataFromJson(json);
}

@JsonSerializable()
class ItemCategory {
  final String id;
  final String? name;
  // Add other properties of ItemCategory

  ItemCategory({required this.id, required this.name});

  factory ItemCategory.fromJson(Map<String, dynamic> json) => _$ItemCategoryFromJson(json);
}

@JsonSerializable()
class OverviewText {
  final String type;
  final String text;
  final List<dynamic> spans; // Adjust type if 'spans' has a specific structure

  OverviewText({required this.type, required this.text, required this.spans});

  factory OverviewText.fromJson(Map<String, dynamic> json) => _$OverviewTextFromJson(json);
}
@JsonSerializable()
class Coordinates {
  final double? lat;
  final double? lng;


  Coordinates({required this.lat,required this.lng});
  factory Coordinates.fromJson(Map<String, dynamic> json) => _$CoordinatesFromJson(json);

}

@JsonSerializable()
class ThingsToDo {
  final String title;
  final String? subtitle;
  final String? badge;
  final List<List<ContentItem>>? content;
  final List<ThingsToDoItem>? items; // For the "Pool & beach" and "Restaurants"

  ThingsToDo({
    required this.title,
    this.subtitle,
    this.badge,
    this.content,
    this.items,
  });

  factory ThingsToDo.fromJson(Map<String, dynamic> json) => _$ThingsToDoFromJson(json);
}

@JsonSerializable()
class ContentItem {
  final String type;
  final String text;
  final List<dynamic> spans;
  final String? direction;

  ContentItem({required this.type, required this.text, required this.spans, this.direction});

  factory ContentItem.fromJson(Map<String, dynamic> json) => _$ContentItemFromJson(json);
}

@JsonSerializable()
class ThingsToDoItem {
  final ImageInfo? image;
  final String? title;

  ThingsToDoItem({this.image, this.title});

  factory ThingsToDoItem.fromJson(Map<String, dynamic> json) => _$ThingsToDoItemFromJson(json);
}

@JsonSerializable()
class ImageInfo {
  final String? url;

  ImageInfo({this.url});

  factory ImageInfo.fromJson(Map<String, dynamic> json) => _$ImageInfoFromJson(json);
}


