import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddChildScreen extends StatelessWidget {
  const AddChildScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffdf7e7),
      body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: GoogleFonts.plusJakartaSans(color: const Color(0xff777872)),
                  children: [
                    TextSpan(
                      text: 'Who is reading today?\n',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        height: 1.5,
                      ),
                    ),
                    TextSpan(
                      text: 'Select your profile to continue the adventure.',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 15,
                        color: const Color(0xffb5b9c2),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 50),

              // Grille des profils (Josue et Abigail)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildProfileAvatar(
                    name: 'Josue',
                    imagePath: 'assets/images/child_avatar.png',
                  ),
                  _buildProfileAvatar(
                    name: 'Abigail',
                    imagePath: 'assets/images/child_avatar.png',
                  ),
                ],
              ),

              const SizedBox(height: 40),

              
              Column(
                children: [
                  Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xfff8e4bf),
                        width: 2,
                        style: BorderStyle.solid, 
                      ),
                    ),
                    child: Icon(
                      Icons.add,
                      size: 32,
                      color: const Color(0xff557790),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Add Child',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff69726d),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 80),

              // Bouton du bas "PARENT MODE"
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.settings_outlined, color: Color(0xFF475569)),
                label: Text(
                  'PARENT MODE',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.1,
                    color: const Color(0xFF8d9095),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 1,
                  padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }

  // Widget réutilisable pour afficher un avatar de profil
  Widget _buildProfileAvatar({required String name, required String imagePath}) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFFe8cb91), width: 3), // Bordure dorée/jaune
          ),
          child: CircleAvatar(
            radius: 48,
            backgroundImage: AssetImage(imagePath),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          name,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1E293B),
          ),
        ),
      ],
    );
  }
}