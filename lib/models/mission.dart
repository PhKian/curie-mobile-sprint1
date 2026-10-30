class Mission {
  const Mission({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.iconCode,
    required this.points,
    required this.duration,
  });

  final String id;
  final String title;
  final String subtitle;
  final String description;
  final int iconCode;
  final int points;
  final String duration;
}
