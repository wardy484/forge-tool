import 'package:dio/dio.dart';
import 'package:forge/environment.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'verify_license.g.dart';

class VerifyLicenseResponse {
  VerifyLicenseResponse({
    required this.success,
  });

  final bool success;

  factory VerifyLicenseResponse.fromJson(Map<String, dynamic> json) =>
      VerifyLicenseResponse(
        success: json["success"],
      );
}

@riverpod
FutureOr<bool> verifyLicense(Ref ref, String licenseKey, String email) async {
  final config = await ref.read(configProvider.future);

  final response = await Dio().post(
    "${config.applicationUrl}/api/license/activate",
    data: {
      "license_key": licenseKey,
      "email": email,
    },
  );

  return VerifyLicenseResponse.fromJson(response.data).success;
}
