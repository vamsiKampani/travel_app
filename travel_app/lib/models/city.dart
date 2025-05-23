class City {
  final String name;
  final String imageUrl; // <-- this was imagePath earlier
  final String description;
  final List<String> placesToVisit;
  final List<String> famousFoods;
  final int averageCost;

  City({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.placesToVisit,
    required this.famousFoods,
    required this.averageCost,
  });
}


