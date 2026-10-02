import 'package:material_ui/material_ui.dart';
import 'package:storii/shared/widgets/app_slider.dart';

class SettingSlider extends StatelessWidget {
  const new({
    required this.title,
    this.subtitle,
    required this.trailing,
    required this.value,
    required this.min,
    required this.max,
    required this.divisions,
    this.labelBuilder,
    this.onChangeEnd,
    super.key,
  });

  final String title;
  final String? subtitle;
  final String trailing;
  final double value;
  final double min;
  final double max;
  final int divisions;
  final String Function(double)? labelBuilder;
  final void Function(double)? onChangeEnd;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const .symmetric(horizontal: 16, vertical: 12),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.bodyLarge,
                      softWrap: true,
                    ),
                    if (subtitle != null)
                      Text(
                        subtitle!,
                        style: theme.textTheme.bodyMedium,
                        softWrap: true,
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Text(
                trailing,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: .bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          AppSlider(
            value: value,
            min: min,
            max: max,
            divisions: divisions,
            labelBuilder: labelBuilder,
            onChangeEnd: onChangeEnd,
          ),
        ],
      ),
    );
  }
}
