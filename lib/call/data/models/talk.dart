class Talk {
  final String name;
  final String phone;
  final String imageUrl;

  Talk({required this.name, required this.phone, required this.imageUrl});
}

final List<Talk> recentTalks = [
  Talk(
    name: 'Stephanie J. Terry',
    phone: '+1 952-808-9082',
    imageUrl: 'https://randomuser.me/api/portraits/men/32.jpg',
  ),
  Talk(
    name: 'Doyle J. Ackerson',
    phone: '+1 952-808-9083',
    imageUrl: 'https://randomuser.me/api/portraits/men/32.jpg',
  ),
  Talk(
    name: 'Juanita R. Wagner',
    phone: '+1 952-808-9084',
    imageUrl: 'https://randomuser.me/api/portraits/men/32.jpg',
  ),
  Talk(
    name: 'Jacqueline Jones',
    phone: '+1 952-808-9085',
    imageUrl: 'https://randomuser.me/api/portraits/men/32.jpg',
  ),
];
