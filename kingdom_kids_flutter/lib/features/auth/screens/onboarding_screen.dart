import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
        return Scaffold(
      backgroundColor: const Color(0xfff3f3f3),
      appBar: AppBar(
        backgroundColor: Color(0xfffafafc),
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(   
              Icons.castle_outlined,
              color: Color(0xFF0F172A),
              size: 24,
            ),
            const SizedBox(width: 8),
            Text(
              "Kingdom Kids",
              style: GoogleFonts.plusJakartaSans(
                color: Color(0xFF0F172A),
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xfffafafc),
              borderRadius: BorderRadius.circular(24.0),
              border: Border.all(color: const Color(0xFFE2E8F0)),
               boxShadow: [
                BoxShadow(
                  color:  const Color(0xFFE2E8F0),
                ),
              ],
            ),
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                decoration: BoxDecoration(
                  color: Color(0xfff3f4f4),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(Icons.security_rounded,
                size: 40,
                color: Color(0xFF0F172A),
                ),
                ),
                const SizedBox(height: 16),
                Text(
                  "Your Child's Privacy &\nSafety",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF0F172A),
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 12),

                // Subtitle
                Text(
                  "We take your family's trust seriously. Here is what you need to know before we begin.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 14,
                    color: const Color(0xFF475569),
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 32),

                InfoRow(
                  description: 'We only collect basic progress data, such as reading milestones, completed books, and time spent in stories.', 
                  titre: 'What We Collect', iconebg: Color(0xfff6d8a5), iconecolor: Color(0xff363f4b), icone: Icons.storage_rounded,),
                InfoRow(
                  description: "To personalize your child's journey, celebrate their achievements, and suggest the next best adventure in their Storybook.", 
                  titre: 'Why We Collect It', iconebg: Color(0xffd0e4ff), iconecolor: Color(0xff2f3241), icone: Icons.auto_awesome_rounded,),
                InfoRow(
                  description: "We will never show ads to your child, and we will never sell or share their data with third parties.", 
                  titre: 'Our Commitment', iconebg: Color(0xffffdbda), iconecolor: Color(0xffa3261d), icone: Icons.block_rounded,),
                const SizedBox(height: 32),
                const Divider(height: 32, thickness: 1, color: Color(0xFFF1F5F9)),
                // Buttons
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF030A16),
                    minimumSize: const Size(double.infinity, 52),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    "I Consent and Continue",
                    style: GoogleFonts.plusJakartaSans(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 52),
                    side: const BorderSide(color: Color(0xFF030A16), width: 1.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Read Full Privacy Policy",
                    style: GoogleFonts.plusJakartaSans(
                      color: const Color(0xFF030A16),
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 

class InfoRow extends StatelessWidget {
  final IconData icone;
  final String description;
  final String titre;
  final Color iconebg;
  final Color iconecolor;

  const InfoRow({
    super.key,
    required this.icone,
    required this.description,
    required this.titre,
    required this.iconebg,
    required this.iconecolor,
  });



   @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icône circulaire
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: iconebg,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                icone,
                color: iconecolor,
                size: 24,
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Titre et Description
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titre,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF0F172A),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 14,
                    height: 1.4,
                    color: const Color(0xFF475569),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
