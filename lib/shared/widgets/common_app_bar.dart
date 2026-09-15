import 'package:material_ui/material_ui.dart';
import 'package:storii/features/downloads/ui/download_button.dart';
import 'package:storii/features/search/ui/search_button.dart';
import 'package:storii/shared/widgets/connection_status_icon.dart';
import 'package:storii/shared/widgets/library_switcher.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const new({
    super.key,
    this.title,
    this.actions,
    this.leading,
    this.showDefaultActions = true,
    this.showLoading = false,
  });

  final Widget? title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool showDefaultActions;
  final bool showLoading;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final defaultActions = showDefaultActions
        ? [
            const ConnectionStatusIcon(),
            const SearchButton(),
            const ActiveDownloadsButton(),
          ]
        : <Widget>[];

    return Stack(
      children: [
        AppBar(
          leading: leading,
          title: title ?? const LibrarySwitcher(),
          actions: [...defaultActions, ...?actions],
        ),
        if (showLoading)
          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: LinearProgressIndicator(minHeight: 3, borderRadius: .zero),
          ),
      ],
    );
  }
}
