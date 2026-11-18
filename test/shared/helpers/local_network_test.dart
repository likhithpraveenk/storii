import 'dart:io';

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

    test('IPv6 unique local and link-local', () {
      expect(Uri.parse('http://[fd12:3456:789a::1]').isLocal, true);
      expect(Uri.parse('http://[fc00::1]').isLocal, true);
      expect(Uri.parse('http://[fe80::1]').isLocal, true);
      expect(Uri.parse('http://[2001:4860:4860::8888]').isLocal, false);
    });

    test('IPv4-mapped IPv6', () {
      expect(Uri.parse('http://[::ffff:192.168.1.10]').isLocal, true);
      expect(Uri.parse('http://[::ffff:8.8.8.8]').isLocal, false);
    });
  });

  group('resolvesToLocalNetwork', () {
    HostLookup lookupReturning(List<String> ips) =>
        (_) async => ips.map(InternetAddress.new).toList();

    test('split-horizon domain on home network', () async {
      final uri = Uri.parse('https://audiobookshelf.example.com');
      expect(
        await resolvesToLocalNetwork(
          uri,
          lookup: lookupReturning(['10.10.10.60']),
        ),
        true,
      );
    });

    test('same domain away from home', () async {
      final uri = Uri.parse('https://audiobookshelf.example.com');
      expect(
        await resolvesToLocalNetwork(
          uri,
          lookup: lookupReturning(['93.184.216.34']),
        ),
        false,
      );
    });

    test('any local address counts', () async {
      final uri = Uri.parse('https://abs.example.com');
      expect(
        await resolvesToLocalNetwork(
          uri,
          lookup: lookupReturning(['93.184.216.34', 'fd00::5']),
        ),
        true,
      );
    });

    test('lookup failure is not local', () async {
      final uri = Uri.parse('https://abs.example.com');
      expect(
        await resolvesToLocalNetwork(
          uri,
          lookup: (_) async => throw const SocketException('no dns'),
        ),
        false,
      );
    });

    test('literal addresses skip lookup', () async {
      Future<List<InternetAddress>> fail(String _) =>
          throw StateError('lookup should not be called');
      expect(
        await resolvesToLocalNetwork(
          Uri.parse('http://192.168.1.5'),
          lookup: fail,
        ),
        true,
      );
      expect(
        await resolvesToLocalNetwork(Uri.parse('http://8.8.8.8'), lookup: fail),
        false,
      );
    });
  });
}
