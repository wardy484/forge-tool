import 'package:dart_ipify/dart_ipify.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge/settings/data/settings_model.dart';
import 'package:forge/settings/settings_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ip_address.g.dart';

@riverpod
Future<String?> ipAddress(Ref ref) {
  return Ipify.ipv4();
}

@riverpod
Future<IPAddressAndSettings> ipAddressAndSettings(Ref ref) async {
  final ipAddress = await ref.read(ipAddressProvider.future);
  final settings = await ref.read(fetchSettingsProvider.future);

  return IPAddressAndSettings(
    ipAddress: ipAddress,
    settings: settings,
  );
}

class IPAddressAndSettings {
  final String? ipAddress;
  final SettingsModel settings;

  IPAddressAndSettings({
    required this.ipAddress,
    required this.settings,
  });
}
