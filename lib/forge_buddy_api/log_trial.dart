import 'package:dio/dio.dart';
import 'package:forge/environment.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'log_trial.g.dart';

@riverpod
FutureOr<void> logTrial(Ref ref) async {
  final config = await ref.read(configProvider.future);

  Dio().post(
    "${config.applicationUrl}/api/license/free-trial",
  );
}
