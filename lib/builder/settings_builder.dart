// ignore_for_file: depend_on_referenced_packages

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

Builder settingsBuilder(BuilderOptions options) => SharedPartBuilder([
  _AppSettingsGenerator(),
  _UserSettingsGenerator(),
], 'settings_generator');

class _AppSettingsGenerator extends Generator {
  @override
  String generate(LibraryReader library, BuildStep buildStep) {
    ClassElement? settingsClass;
    for (final c in library.classes) {
      if (c.name == 'AppSettings') {
        settingsClass = c;
        break;
      }
    }
    if (settingsClass == null) return '';

    ConstructorElement? factoryConstructor;
    for (final c in settingsClass.constructors) {
      if (c.isFactory) {
        factoryConstructor = c;
        break;
      }
    }
    if (factoryConstructor == null) return '';

    final setters = StringBuffer();
    final providers = StringBuffer();

    setters.writeln('''
extension AppSettingsSetters on AppSettingsNotifier {
''');

    for (final param in factoryConstructor.formalParameters) {
      if (_isNoCodeGen(param)) continue;

      final name = param.displayName;
      final type = param.type;
      final methodName = 'set${name[0].toUpperCase()}${name.substring(1)}';
      final providerName = '${name}Provider';

      setters.writeln('''
  Future<void> $methodName($type value) => _save(state.copyWith($name: value));
''');
      providers.writeln('''
final $providerName = Provider<$type>(
  (ref) => ref.watch(appSettingsProvider.select((s) => s.$name))
);
''');
    }

    setters.writeln('}');

    final output = StringBuffer()
      ..writeln(setters.toString())
      ..writeln(providers.toString());

    return output.toString();
  }
}

class _UserSettingsGenerator extends Generator {
  @override
  String generate(LibraryReader library, BuildStep buildStep) {
    ClassElement? settingsClass;
    for (final c in library.classes) {
      if (c.name == 'UserSettings') {
        settingsClass = c;
        break;
      }
    }
    if (settingsClass == null) return '';

    ConstructorElement? factoryConstructor;
    for (final c in settingsClass.constructors) {
      if (c.isFactory) {
        factoryConstructor = c;
        break;
      }
    }
    if (factoryConstructor == null) return '';

    final setters = StringBuffer();
    final providers = StringBuffer();

    setters.writeln('''
  extension UserSettingsSetters on UserSettingsNotifier {
''');

    for (final param in factoryConstructor.formalParameters) {
      if (_isNoCodeGen(param)) continue;

      final name = param.name;
      final type = param.type;
      final methodName = 'set${name?[0].toUpperCase()}${name?.substring(1)}';
      final providerName = '${name}Provider';

      setters.writeln('''
  Future<void> $methodName($type value) => _save(state.copyWith($name: value));
''');
      providers.writeln('''
final $providerName = Provider<$type>(
  (ref) => ref.watch(userSettingsProvider.select((s) => s.$name)),
);
''');
    }

    setters.writeln('}');

    final output = StringBuffer()
      ..writeln(setters.toString())
      ..writeln(providers.toString());

    return output.toString();
  }
}

bool _isNoCodeGen(FormalParameterElement param) {
  for (final m in param.metadata.annotations) {
    final value = m.computeConstantValue();
    if (value == null) continue;

    final type = value.type;
    if (type == null) continue;

    if (type.getDisplayString() == 'NoCodeGen') {
      return true;
    }
  }
  return false;
}
