import 'package:material_ui/material_ui.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/shared/helpers/extensions.dart';

class ErrorBadge extends StatelessWidget {
  const new({super.key, required this.message, this.size = 16});

  final String message;
  final double size;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showAppSnackBar(message, isError: true);
      },
      child: Container(
        padding: const .all(4),
        decoration: BoxDecoration(
          color: scheme.errorContainer,
          borderRadius: .circular(kRadiusSm),
        ),
        child: Icon(
          Icons.error_outline_rounded,
          size: size,
          color: scheme.onErrorContainer,
        ),
      ),
    );
  }
}

class ItemErrorBanner extends StatelessWidget {
  const new({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const .all(12),
      decoration: BoxDecoration(
        color: scheme.errorContainer,
        borderRadius: .circular(kRadius),
      ),
      child: Row(
        children: [
          Icon(
            Icons.error_outline_rounded,
            size: 20,
            color: scheme.onErrorContainer,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium
                  ?.copyWith(color: scheme.onErrorContainer),
            ),
          ),
        ],
      ),
    );
  }
}
