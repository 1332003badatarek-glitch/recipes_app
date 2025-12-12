import 'dart:io';

void main() async {
  final fontsDir = Directory('assets/fonts');
  if (!fontsDir.existsSync()) {
    print('❌ Directory assets/fonts not found.');
    return;
  }

  final buffer = StringBuffer('fonts:\n');

  for (var familyDir in fontsDir.listSync()) {
    if (familyDir is Directory) {
      final familyName = familyDir.path.split(Platform.pathSeparator).last;
      buffer.writeln('  - family: $familyName');
      buffer.writeln('    fonts:');
      for (var file in familyDir.listSync(recursive: true)) {
        if (file is File && file.path.endsWith('.ttf')) {
          buffer.writeln('      - asset: ${file.path.replaceAll('\\', '/')}');
        }
      }
    }
  }

  final outputFile = File('fonts_output.yaml');
  await outputFile.writeAsString(buffer.toString());
  print('✅ Fonts YAML generated successfully in fonts_output.yaml');
}
