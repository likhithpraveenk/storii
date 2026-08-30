import 'package:flutter_test/flutter_test.dart';
import 'package:storii/shared/helpers/local_network.dart';

void main() {
  group('Uri.isLocal', () {
    test('localhost variants', () {
      expect(Uri.parse('http://localhost:8080').isLocal, true);
      expect(Uri.parse('http://127.0.0.1').isLocal, true);
      expect(Uri.parse('http://[::1]').isLocal, true);
    });

    test('mDNS', () {
      expect(Uri.parse('http://myserver.local').isLocal, true);
    });

    test('RFC1918 ranges', () {
      expect(Uri.parse('http://10.0.0.5').isLocal, true);
      expect(Uri.parse('http://172.16.0.1').isLocal, true);
      expect(Uri.parse('http://172.31.255.255').isLocal, true);
      expect(Uri.parse('http://172.32.0.1').isLocal, false);
      expect(Uri.parse('http://192.168.1.1').isLocal, true);
    });

    test('public', () {
      expect(Uri.parse('http://8.8.8.8').isLocal, false);
      expect(Uri.parse('https://example.com').isLocal, false);
    });

    test('bare hostname no dot', () {
      expect(Uri.parse('http://myserver').isLocal, true);
    });
  });
}
