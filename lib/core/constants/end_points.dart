enum Endpoints {
  banners(path: '/auth/send_number'),
  products(path: '/auth/send_code'),
  story(path: "/posts");

  final String path;

  const Endpoints({required this.path});
}
