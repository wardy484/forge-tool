import 'package:forge/settings/data/settings.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'settings_state.dart';
part 'settings_cubit.freezed.dart';

final emptySettings = Settings(name: "", apiKey: "");

class SettingsCubit extends HydratedCubit<SettingsState> {
  SettingsCubit() : super(SettingsState.loaded(emptySettings));

  void updateSettings(String name, String apiKey) {
    emit(SettingsState.loaded(
      Settings(
        name: name,
        apiKey: apiKey,
      ),
    ));
  }

  @override
  SettingsState fromJson(Map<String, dynamic> json) {
    try {
      final settings = Settings.fromJson(json['value']);

      return SettingsState.loaded(settings);
    } catch (e) {
      return SettingsState.loaded(emptySettings);
    }
  }

  @override
  Map<String, Map<String, dynamic>> toJson(SettingsState state) {
    final settings = state.maybeWhen(
      loaded: (settings) => settings.toJson(),
      orElse: () => emptySettings.toJson(),
    );

    return {
      'value': settings,
    };
  }
}
