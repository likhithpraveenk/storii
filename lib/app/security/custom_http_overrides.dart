import 'dart:io';

class CustomHttpOverrides extends HttpOverrides {
  final bool Function() shouldTrust;
  CustomHttpOverrides({required this.shouldTrust});

  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (_, _, _) => shouldTrust();
  }
}
