// import 'dart:io';

// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:storii/app/init.dart';
// import 'package:storii/app/logs/log_service.dart';
// import 'package:storii/app/providers/settings_provider.dart';
// import 'package:storii/shared/widgets/app_bottom_sheet.dart';

// class StorageTile extends ConsumerWidget {
//   const StorageTile({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final path = ref.watch(externalDownloadPathProvider);

//     return ListTile(
//       trailing: const Icon(Icons.chevron_right),
//       leading: const Icon(Icons.storage),
//       title: Text(l10n.storage),
//       subtitle: Text(path ?? l10n.internalStorage),
//       onTap: () {
//         AppBottomSheet.show(
//           context,
//           title: l10n.storage,
//           body: Consumer(
//             builder: (context, ref, _) {
//               final externalPath = ref.watch(externalDownloadPathProvider);
//               final isExternal = externalPath != null;
//               final theme = Theme.of(context);

//               return Column(
//                 children: [
//                   Padding(
//                     padding: const .symmetric(horizontal: 24),
//                     child: Text(
//                       l10n.storageSubDirsNote,
//                       style: theme.textTheme.labelLarge?.copyWith(
//                         color: theme.colorScheme.onSurfaceVariant.withValues(
//                           alpha: 0.7,
//                         ),
//                       ),
//                     ),
//                   ),
//                   ListTile(
//                     title: Text(l10n.downloadLocation),
//                     subtitle: Text(externalPath ?? l10n.internalStorage),
//                     trailing: TextButton(
//                       onPressed: () async {
//                         try {
//                           final result = await FilePicker.getDirectoryPath();
//                           if (result != null) {
//                             final dir = Directory(result);
//                             if (await dir.exists()) {
//                               await ref
//                                   .read(appSettingsProvider.notifier)
//                                   .setExternalDownloadPath(result);
//                             }
//                           }
//                         } catch (e) {
//                           LogService.log(
//                             'Error setting storage location',
//                             level: .error,
//                             originalError: e,
//                             source: 'StorageTile',
//                           );
//                         }
//                       },
//                       child: Text(l10n.changeLocation),
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   if (isExternal)
//                     TextButton(
//                       onPressed: () async {
//                         await ref
//                             .read(appSettingsProvider.notifier)
//                             .setExternalDownloadPath(null);
//                       },
//                       child: Text(l10n.resetToInternal),
//                     ),
//                 ],
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }
