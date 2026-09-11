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
  });

  final Widget? title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool showDefaultActions;

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

    return AppBar(
      leading: leading,
      title: title ?? const LibrarySwitcher(),
      actions: [...defaultActions, ...?actions],
    );
  }
}
