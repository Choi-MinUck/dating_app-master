class Profile {
  const Profile({
    required this.name,
    required this.distance,
    required this.imageAsset,
  });
  final String name;
  final String distance;
  final String imageAsset;
}

class MyCard {
  const MyCard({
    required this.cardCount,
    required this.cardContent,
    required this.cardName,
  });
  final int cardCount;

  final String cardContent;
  final String cardName;
}
