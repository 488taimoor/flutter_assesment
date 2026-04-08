/// Represents a mood with its display properties.
class MoodData {
  const MoodData({
    required this.name,
    required this.assetPath,
  });

  final String name;
  final String assetPath;

  /// All available moods mapped to angle quadrants.
  static const moods = [
    MoodData(name: 'Calm', assetPath: 'assets/calm.png'),
    MoodData(name: 'Content', assetPath: 'assets/content.png'),
    MoodData(name: 'Peaceful', assetPath: 'assets/peacful.png'),
    MoodData(name: 'Happy', assetPath: 'assets/happy.png'),
  ];
}
