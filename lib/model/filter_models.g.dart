// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterResponse _$FilterResponseFromJson(Map<String, dynamic> json) =>
    FilterResponse(
      filters: (json['filters'] as List<dynamic>)
          .map((e) => FilterGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FilterResponseToJson(FilterResponse instance) =>
    <String, dynamic>{
      'filters': instance.filters,
      'items': instance.items,
    };

FilterGroup _$FilterGroupFromJson(Map<String, dynamic> json) => FilterGroup(
      name: json['name'] as String,
      type: json['type'] as String,
      categories: (json['categories'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FilterGroupToJson(FilterGroup instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'categories': instance.categories,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      section: json['section'] as String,
      name: json['name'] as String,
      city: json['city'] as String,
      type: json['type'] as String,
      images: (json['images'] as List<dynamic>)
          .map((e) => ImageData.fromJson(e as Map<String, dynamic>))
          .toList(),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => ItemCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
      openingHours: json['openingHours'] as Map<String, dynamic>,
      accessibleForGuestPass: json['accessibleForGuestPass'] as bool,
      overviewText: (json['overviewText'] as List<dynamic>)
          .map((e) => OverviewText.fromJson(e as Map<String, dynamic>))
          .toList(),
      coordinates: json['coordinates'] == null
          ? null
          : Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>),
      thingsToDo: (json['thingsToDo'] as List<dynamic>?)
              ?.map((e) => ThingsToDo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'section': instance.section,
      'name': instance.name,
      'city': instance.city,
      'type': instance.type,
      'images': instance.images,
      'categories': instance.categories,
      'openingHours': instance.openingHours,
      'accessibleForGuestPass': instance.accessibleForGuestPass,
      'overviewText': instance.overviewText,
      'thingsToDo': instance.thingsToDo,
      'coordinates': instance.coordinates,
    };

ImageData _$ImageDataFromJson(Map<String, dynamic> json) => ImageData(
      url: json['url'] as String?,
    );

Map<String, dynamic> _$ImageDataToJson(ImageData instance) => <String, dynamic>{
      'url': instance.url,
    };

ItemCategory _$ItemCategoryFromJson(Map<String, dynamic> json) => ItemCategory(
      id: json['id'] as String,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ItemCategoryToJson(ItemCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

OverviewText _$OverviewTextFromJson(Map<String, dynamic> json) => OverviewText(
      type: json['type'] as String,
      text: json['text'] as String,
      spans: json['spans'] as List<dynamic>,
    );

Map<String, dynamic> _$OverviewTextToJson(OverviewText instance) =>
    <String, dynamic>{
      'type': instance.type,
      'text': instance.text,
      'spans': instance.spans,
    };

Coordinates _$CoordinatesFromJson(Map<String, dynamic> json) => Coordinates(
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CoordinatesToJson(Coordinates instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

ThingsToDo _$ThingsToDoFromJson(Map<String, dynamic> json) => ThingsToDo(
      title: json['title'] as String,
      subtitle: json['subtitle'] as String?,
      badge: json['badge'] as String?,
      content: (json['content'] as List<dynamic>?)
          ?.map((e) => (e as List<dynamic>)
              .map((e) => ContentItem.fromJson(e as Map<String, dynamic>))
              .toList())
          .toList(),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => ThingsToDoItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ThingsToDoToJson(ThingsToDo instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'badge': instance.badge,
      'content': instance.content,
      'items': instance.items,
    };

ContentItem _$ContentItemFromJson(Map<String, dynamic> json) => ContentItem(
      type: json['type'] as String,
      text: json['text'] as String,
      spans: json['spans'] as List<dynamic>,
      direction: json['direction'] as String?,
    );

Map<String, dynamic> _$ContentItemToJson(ContentItem instance) =>
    <String, dynamic>{
      'type': instance.type,
      'text': instance.text,
      'spans': instance.spans,
      'direction': instance.direction,
    };

ThingsToDoItem _$ThingsToDoItemFromJson(Map<String, dynamic> json) =>
    ThingsToDoItem(
      image: json['image'] == null
          ? null
          : ImageInfo.fromJson(json['image'] as Map<String, dynamic>),
      title: json['title'] as String?,
    );

Map<String, dynamic> _$ThingsToDoItemToJson(ThingsToDoItem instance) =>
    <String, dynamic>{
      'image': instance.image,
      'title': instance.title,
    };

ImageInfo _$ImageInfoFromJson(Map<String, dynamic> json) => ImageInfo(
      url: json['url'] as String?,
    );

Map<String, dynamic> _$ImageInfoToJson(ImageInfo instance) => <String, dynamic>{
      'url': instance.url,
    };
