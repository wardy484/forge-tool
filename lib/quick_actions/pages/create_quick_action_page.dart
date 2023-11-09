import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:forge/common/widgets/bottom_full_width_button.dart';
import 'package:forge/common/widgets/ports_form.dart';
import 'package:forge/quick_actions/data/quick_action_repository.dart';
import 'package:forge/router.dart';
import 'package:forge/system_tray/app_system_tray.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class CreateQuickActionPage extends HookConsumerWidget {
  const CreateQuickActionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useState(GlobalKey<FormState>());
    final nameController = useTextEditingController();
    final ports = useState(<String>[]);
    final errorMessage = useState<String?>(null);

    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Row(
          children: [
            SizedBox(width: 10),
            IconButton(
              icon: Icon(Icons.chevron_left),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            const SizedBox(width: 8),
            const Text("Add a quick action"),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        child: Form(
          key: formKey.value,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Name",
                  hintText: "Enter your name",
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a name";
                  }

                  return null;
                },
              ),
              SizedBox(height: 12),
              PortsForm(
                errorMessage: errorMessage.value,
                ports: ports.value,
                onPortsChanged: (newPorts) {
                  errorMessage.value = null;
                  ports.value = newPorts;
                },
              ),
              BottomFullWidthButton(
                child: Text("Add quick action"),
                onPressed: ports.value.isEmpty
                    ? null
                    : _addQuickAction(
                        ref,
                        formKey.value,
                        nameController.text,
                        ports.value,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void Function()? _addQuickAction(
    WidgetRef ref,
    GlobalKey<FormState> formKey,
    String name,
    List<String> ports,
  ) {
    return () async {
      if (!formKey.currentState!.validate()) {
        return;
      }

      await ref.read(quickActionsProvider.notifier).addQuickAction(name, ports);

      ref.read(systemTrayProvider).buildLoadedMenu();
      ref.read(appRouterProvider).pop();
    };
  }
}
