import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final configProvider = FutureProvider<EnvConfig>((ref) async {
  await dotenv.load(fileName: ".env");
  return EnvConfig.fromMap(dotenv.env);
});

class EnvConfig {
  final String sentryDsn;
  final double? sentrySampleRate;
  final String applicationUrl;
  final bool deleteConfigOnStartup;

  EnvConfig({
    required this.sentryDsn,
    required this.sentrySampleRate,
    required this.applicationUrl,
    required this.deleteConfigOnStartup,
  });

  factory EnvConfig.fromMap(Map<String, dynamic> map) {
    return EnvConfig(
      sentryDsn: map['SENTRY_DSN'],
      sentrySampleRate: double.tryParse(map['SENTRY_SAMPLE_RATE']),
      applicationUrl: map['APPLICATION_URL'],
      deleteConfigOnStartup:
          map['DELETE_CONFIG_ON_STARTUP'].toLowerCase() != "false",
    );
  }
}
