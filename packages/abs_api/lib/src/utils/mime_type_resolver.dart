import 'package:mime/mime.dart';

final mimeTypeResolver = MimeTypeResolver()
  ..addExtension('m4b', 'audio/mp4')
  ..addExtension('opus', 'audio/opus')
  ..addExtension('aac', 'audio/aac')
  ..addExtension('wav', 'audio/wav')
  ..addExtension('webma', 'audio/webm')
  ..addExtension('azw3', 'application/vnd.amazon.mobi8-ebook')
  ..addExtension('abs', 'text/plain')
  ..addExtension('audiobookshelf', 'application/zip');
