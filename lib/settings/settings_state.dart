import 'package:forge/settings/data/settings.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_state.freezed.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.initial() = _Initial;
  const factory SettingsState.loading() = _Loading;
  const factory SettingsState.loaded(Settings settings) = _Loaded;
  const factory SettingsState.valid(Settings settings) = _Valid;
  const factory SettingsState.error(Settings settings, String error) = _Error;
}
