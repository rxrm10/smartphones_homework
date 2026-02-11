import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Flutter layout demo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 13, 27, 42),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 13, 27, 42),
          title: const Text(
            appTitle,
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: const [
              ImageSection(image: 'images/lake.jpg.webp'),
              Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'omar\n omaralib82@gmail.com',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              TitleSection(
                name: 'Oeschinen Lake Campground',
                location: 'Kandersteg, Switzerland',
              ),
              ButtonSection(),
              TextSection(
                description:
                    'The night sky is filled with countless stars that light up the darkness. '
                    'Many of these stars are part of distant galaxies, each containing billions '
                    'of suns. From Earth, the Milky Way appears as a bright band stretching '
                    'across the sky, a reminder of our place in the universe. Observing the '
                    'stars can take you on a journey through time, because the light you see '
                    'today may have traveled for thousands or even millions of years. With the '
                    'help of telescopes, astronomers can explore nebulae, star clusters, and '
                    'faraway galaxies, revealing the secrets of cosmic evolution. The universe '
                    'is constantly expanding, and new discoveries continue to change our '
                    'understanding of space and time.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/* -------- Image Section -------- */

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: 600,
      height: 240,
      fit: BoxFit.cover,
    );
  }
}

/* -------- Title Section -------- */

class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
    required this.name,
    required this.location,
  });

  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  location,
                  style: const TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          const FavoriteWidget(),
        ],
      ),
    );
  }
}

/* -------- Favorite Widget -------- */

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
      _favoriteCount += _isFavorited ? 1 : -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(_isFavorited ? Icons.star : Icons.star_border),
          color: Colors.red,
          onPressed: _toggleFavorite,
        ),
        SizedBox(
          width: 18,
          child: Text(
            '$_favoriteCount',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

/* -------- Button Section -------- */

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        ButtonWithText(icon: Icons.call, label: 'CALL'),
        ButtonWithText(icon: Icons.near_me, label: 'ROUTE'),
        ButtonWithText(icon: Icons.share, label: 'SHARE'),
      ],
    );
  }
}

class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.white),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

/* -------- Text Section -------- */

class TextSection extends StatelessWidget {
  const TextSection({super.key, required this.description});
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Text(
        description,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
