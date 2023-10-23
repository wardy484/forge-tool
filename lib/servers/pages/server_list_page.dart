import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge/forge/model/server/server.dart';
import 'package:forge/forge/model/server/server_list.dart';
import 'package:forge/mac/widgets/custom_list_tile.dart';
import 'package:forge/mac/widgets/loading.dart';
import 'package:forge/router.dart';
import 'package:forge/servers/server_list_notifier.dart';
import 'package:forge/settings/widgets/settings_page_button.dart';
import 'package:forge/system_tray/tray.dart';
import 'package:forge/whitelist/pages/whitelist_page.dart';
import 'package:macos_ui/macos_ui.dart';

@RoutePage()
class ServerListPage extends ConsumerStatefulWidget {
  const ServerListPage({super.key});

  @override
  _ServerListPageState createState() => _ServerListPageState();
}

class _ServerListPageState extends ConsumerState<ServerListPage> {
  final List<String> selectedPorts = [];

  @override
  Widget build(BuildContext context) {
    final systemTray = ref.read(systemTrayProvider);

    ref.listen(serverListProvider, (prev, AsyncValue<ServerList> next) {
      next.whenOrNull(
        data: (servers) => systemTray.addServers(servers, (
          Server server, {
          WhitelistPort? port,
        }) {
          AutoRouter.of(context).push(WhitelistRoute(
            server: server,
            ports: port,
            skipInput: true,
          ));
        }),
      );
    });

    return MacosScaffold(
      toolBar: ToolBar(
        title: const Text('Whitelist Ninja'),
        centerTitle: true,
        actions: [
          ToolBarIconButton(
            icon: const MacosIcon(CupertinoIcons.settings),
            label: 'Settings',
            showLabel: false,
            onPressed: () {
              AutoRouter.of(context).push(SettingsRoute(initialPage: false));
            },
          ),
        ],
      ),
      children: [
        ContentArea(
          builder: (context, scrollController) {
            return ref.watch(serverListProvider).when(
                  loading: () => const Loading(),
                  error: (error, stackTrace) => const Error(),
                  data: (serverList) {
                    return ListView.separated(
                      controller: scrollController,
                      padding: const EdgeInsets.all(6),
                      separatorBuilder: (context, index) {
                        return const Divider(
                          thickness: 0.2,
                          color: Colors.grey,
                        );
                      },
                      itemCount: serverList.servers.length,
                      itemBuilder: (context, index) {
                        final server = serverList.servers[index];

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomListTile(
                                leading:
                                    const Icon(CupertinoIcons.device_desktop),
                                title: server.name,
                                subtitle: server.ipAddress,
                              ),
                              SettingsPageButton(
                                label: "Whitelist",
                                onPressed: () {
                                  AutoRouter.of(context)
                                      .push(WhitelistRoute(server: server));
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                );
          },
        ),
      ],
    );
  }
}

class Error extends StatelessWidget {
  const Error({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Center(
        child: Column(
          children: [
            Text(
              "Oops, something went wrong... you likely have an invalid api key, hit the rate limit or your broke forge, that's on you!",
              style: MacosTheme.of(context).typography.headline,
            ),
          ],
        ),
      ),
    );
  }
}
