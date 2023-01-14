class Items {
  String id;
  String title;
  int color;
  String imagePath;
  Items(
      {required this.title,
      required this.color,
      required this.imagePath,
      required this.id});

  static List<Items> getCategory() {
    /// business entertainment general health science sports technology

    return [
      Items(
          title: 'Entertainment',
          color: 0xff4882CF,
          imagePath: 'assets/images/environment.png',
          id: 'entertainment'),
      Items(
          title: 'General',
          color: 0xff003E90,
          imagePath: 'assets/images/Politics.png',
          id: 'general'),
      Items(
          title: 'Health',
          color: 0xffED1E79,
          imagePath: 'assets/images/health.png',
          id: 'health'),
      Items(
          title: 'Science',
          color: 0xffF2D352,
          imagePath: 'assets/images/science.png',
          id: 'science'),
      Items(
          title: 'Sports',
          color: 0xffC91C22,
          imagePath: 'assets/images/ball.png',
          id: 'sports'),
      Items(
          title: 'Technology',
          color: 0xffF2D352,
          imagePath: 'assets/images/technology.png',
          id: 'technology'),
    ];
  }
}
