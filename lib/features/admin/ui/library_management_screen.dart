import 'package:abs_api/abs_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/admin/logic/library_actions_provider.dart';
import 'package:storii/features/admin/logic/task_stream_provider.dart';
import 'package:storii/features/library/logic/user_libraries_provider.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/error_retry.dart';
import 'package:storii/shared/widgets/waveform.dart';

extension on Task {
  String? get snackBarMessage => isFailed ? error : data?.scanResults?.text;
}

class LibraryManagementTile extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.library_books_outlined),
      trailing: const Icon(Icons.chevron_right),
      title: Text(l10n.libraries),
      onTap: () => context.push(AppRoute.adminLibraries.path),
    );
  }
}

class LibraryManagementScreen extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;
    final librariesAsync = ref.watch(userLibrariesProvider);
    final scanningLibs = ref.watch(scanLibraryProvider).value ?? {};

    ref.listen(taskCompleteProvider, (_, next) {
      final task = next.value;
      if (task?.snackBarMessage != null) {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showAppSnackBar(task!.snackBarMessage!, isError: task.isFailed);
      }
    });

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(l10n.libraries, style: textTheme.titleLarge),
      ),
      body: librariesAsync.when(
        data: (libs) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: .circular(kRadius),
              color: scheme.surfaceContainerLowest,
              border: .all(width: 1, color: scheme.outlineVariant),
            ),
            margin: const .symmetric(horizontal: 16, vertical: 12),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: libs.length,
              itemBuilder: (context, index) {
                final lib = libs[index];
                final isScanning = scanningLibs.contains(lib.id);
                return DecoratedBox(
                  key: ValueKey(lib.id),
                  decoration: BoxDecoration(borderRadius: .circular(kRadius)),
                  child: ListTile(
                    contentPadding: const .symmetric(
                      horizontal: 16,
                      vertical: 4,
                    ),
                    visualDensity: .compact,
                    leading: Icon(
                      lib.mediaType == .book
                          ? Icons.auto_stories_rounded
                          : Icons.podcasts_rounded,
                    ),
                    title: Text(
                      lib.name,
                      style: textTheme.bodyLarge?.copyWith(
                        fontWeight: .w600,
                        color: scheme.onSurface,
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: .min,
                      children: [
                        IconButton(
                          onPressed: isScanning
                              ? null
                              : () => AppBottomSheet.show(
                                  context,
                                  title: lib.name,
                                  body: Column(
                                    children: [
                                      ListTile(
                                        leading: const Icon(Icons.refresh),
                                        title: Text(l10n.scan),
                                        onTap: () {
                                          ref
                                              .read(
                                                scanLibraryProvider.notifier,
                                              )
                                              .scan(lib.id);
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      const SizedBox(height: 48),
                                    ],
                                  ),
                                ),
                          icon: isScanning
                              ? const SizedBox.square(
                                  dimension: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Icon(Icons.expand_more),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
        loading: () =>
            const SizedBox(height: 120, child: Center(child: RandomWaveform())),
        error: (e, _) => ErrorRetryWidget(
          '$e',
          onRetry: () => ref.invalidate(userLibrariesProvider),
        ),
      ),
    );
  }
}
