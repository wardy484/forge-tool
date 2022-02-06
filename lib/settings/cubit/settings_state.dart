part of 'settings_cubit.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.loading() = _Loading;
  const factory SettingsState.loaded(Settings settings) = _Loaded;
  const factory SettingsState.error(String error) = _Error;
}