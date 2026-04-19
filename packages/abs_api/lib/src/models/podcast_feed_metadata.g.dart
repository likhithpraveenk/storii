// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'podcast_feed_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PodcastFeedMetadata _$PodcastFeedMetadataFromJson(Map<String, dynamic> json) =>
    _PodcastFeedMetadata(
      image: Uri.parse(json['image'] as String),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      feedUrl: Uri.parse(json['feedUrl'] as String),
      description: json['description'] as String,
      descriptionPlain: json['descriptionPlain'] as String,
      title: json['title'] as String,
      language: json['language'] as String,
      explicit: json['explicit'] as String,
      author: json['author'] as String,
      pubDate: json['pubDate'] as String,
      link: Uri.parse(json['link'] as String),
    );

Map<String, dynamic> _$PodcastFeedMetadataToJson(
  _PodcastFeedMetadata instance,
) => <String, dynamic>{
  'image': instance.image.toString(),
  'categories': instance.categories,
  'feedUrl': instance.feedUrl.toString(),
  'description': instance.description,
  'descriptionPlain': instance.descriptionPlain,
  'title': instance.title,
  'language': instance.language,
  'explicit': instance.explicit,
  'author': instance.author,
  'pubDate': instance.pubDate,
  'link': instance.link.toString(),
};
