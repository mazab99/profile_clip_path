import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TopSection(),
            Expanded(
              child: BodySection(),
            ),
          ],
        ),
      ),
    );
  }
}

class TopSection extends StatelessWidget {
  const TopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: TopClipper(),
            child: Container(
              color: const Color.fromRGBO(44, 62, 80, 1.0),
              height: 180,
              width: double.maxFinite,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: ImageClipper(),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                color: Colors.red,
                height: 155,
                width: 125,
                child: ClipPath(
                  clipper: ImageClipper(),
                  child: Image.asset(
                    'assets/mahmoud.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;

    final path = Path();
    path.moveTo(width * 0.18, 0.0);
    path.lineTo(width, 0.0);
    path.lineTo(width, height * 0.94);
    path.lineTo(width * 0.98, height);
    path.lineTo(width * 0.5, height);
    path.lineTo(width * 0.16, height * 0.08);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class ImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;
    final path = Path();

    path.moveTo(width / 2, 0.0);
    path.lineTo(width, height * 0.25);
    path.lineTo(width, height * 0.75);
    path.lineTo(width / 2, height);
    path.lineTo(0.0, height * 0.75);
    path.lineTo(0, height * 0.25);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class BodySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Bottom left Clip
        Align(
          alignment: Alignment.bottomLeft,
          child: ClipPath(
            clipper: BottomLeftClipper(),
            child: Container(
              color: Colors.red,
              height: 120,
              width: 80,
              padding: const EdgeInsets.only(top: 13, right: 12),
              child: ClipPath(
                clipper: BottomLeftClipper(),
                child: Container(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class BottomLeftClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;
    final path = Path();

    path.lineTo(width, height * 0.3);
    path.lineTo(width, height);
    path.lineTo(0, height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
