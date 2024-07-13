enum Endpoints {
  banners(path: 'banners.json'),
  products(path: 'products.json'),
  story(path: "story.json");

  final String path;

  const Endpoints({required this.path});
}
