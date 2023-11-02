import 'package:dart_ipify/dart_ipify.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ip_address.g.dart';

@riverpod
Future<String?> ipAddress(Ref ref) {
  return Ipify.ipv4();
}
