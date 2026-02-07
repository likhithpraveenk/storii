import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/storage/local/font_service.dart';

part 'user_fonts.g.dart';

@Riverpod(keepAlive: true)
Future<List<String>> userFonts(Ref ref) async {
  final families = await FontService.groupByFamily();
  return families.keys.toList()..sort();
}
