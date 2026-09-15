import 'package:flutter/material.dart';


class AddChildScreen extends StatelessWidget {
  const AddChildScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffdf7e7),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              
              
              const Text(
                "Who is reading today ?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff52514d),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Select your profile to continue the adventure.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xff56534c),
                ),
              ),

              const SizedBox(height: 48),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ProfileItem(
                    name: "Samuel Williams",
                    imagePath: "assets/images/imagebb.png",
                    onTap: () {},
                  ),
                  ProfileItem(
                    name: "Abessolo Bernard",
                    imagePath: "assets/images/imagebb.png",
                    onTap: () {},
                  ),
                ],
              ),

              const SizedBox(height: 48),

              
              GestureDetector(
                onTap: () {
                  // Action pour ajouter un enfant
                },
                child: Column(
                  children: [
                    CustomPaint(
                      child: const SizedBox(
                        width: 120,
                        height: 120,
                        child: Center(
                          child: Icon(
                            Icons.add,
                            size: 32,
                            color: Color(0xffc3c9c9),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Add Child",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff999186),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 56),

              // --- BOUTON PARENT MODE ---
              ElevatedButton.icon(
                onPressed: () {
                  // Action pour le mode parent
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: const Color(0xffc2c7ca),
                  elevation: 2,
                  shadowColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                icon: const Icon(Icons.settings_outlined, size: 20),
                label: const Text(
                  "PARENT MODE",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  final String name;
  final String imagePath;
  final VoidCallback onTap;

  const ProfileItem({
    Key? key,
    required this.name,
    required this.imagePath,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xfffee4ab),
                width: 2.5,
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xfffee4ab),
                  width: 2.5,
                ),
              ),
              child: CircleAvatar(
                radius: 54,
                backgroundColor: const Color(0xfffff2db),
                backgroundImage: AssetImage(imagePath),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xffffffff),
            ),
          ),
        ],
      ),
    );
  }
}
/*
// ==========================================
// PAINTER SUR MESURE : CERCLE EN POINTILLÉS
// ==========================================
class DashedCirclePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashLength;
  final double gapLength;

  DashedCirclePainter({
    required this.color,
    this.strokeWidth = 2.0,
    this.dashLength = 5.0,
    this.gapLength = 5.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width / 2;
    final Offset center = Offset(radius, radius);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
*/
