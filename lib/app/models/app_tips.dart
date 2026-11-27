enum AppTip { widgetBinding /* futureTips */ }

class AppTips {
  const new({this.dismissed = const {}});

  final Set<AppTip> dismissed;

  bool isDismissed(AppTip tip) => dismissed.contains(tip);

  AppTips dismiss(AppTip tip) => AppTips(dismissed: {...dismissed, tip});

  Map<String, dynamic> toJson() => {
    'dismissed': dismissed.map((tip) => tip.name).toList(growable: false),
  };

  factory fromJson(Map<String, dynamic> json) {
    final raw = json['dismissed'];
    final dismissed = <AppTip>{
      if (raw is List)
        ...raw.whereType<String>().map(_tipFromName).whereType<AppTip>(),
    };
    return AppTips(dismissed: dismissed);
  }

  static AppTip? _tipFromName(String name) {
    for (final tip in AppTip.values) {
      if (tip.name == name) return tip;
    }
    return null;
  }
}
