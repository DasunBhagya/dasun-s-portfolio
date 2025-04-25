// Place this class definition either in homepage.dart or a separate file
import 'package:flutter/material.dart';
import 'package:myworkflow/constants/colors.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 25.0),
      width: double.maxFinite,
      // Use same color as Experience or a different one if desired
      color: CustomColor.scaffoldBg, // Or CustomColor.bglight1 etc.
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Education",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),
          const SizedBox(height: 30),

          // Moratuwa University
          _buildEducationEntry(
            institution: "Moratuwa University",
            degree: "Bsc IT, Faculty of IT",
            location: "Moratuwa, Colombo",
            year: "2024",
          ),
          const SizedBox(height: 25),

          // Sri Lanka Institute Of Advance Technological Education
          _buildEducationEntry(
            institution:
                "Sri Lanka Institute Of Advance Technological Education",
            degree: "HND IT, IT Department",
            location: "Dehiwala, Colombo",
            year: "2022 - 2024",
          ),
          const SizedBox(height: 25),

          // Mahanama College
          _buildEducationEntry(
            institution: "Mahanama College",
            degree: "Maths Steam", // Corrected typo from "Steam"
            location: "Kollupitiya, Colombo",
            year: "2019",
          ),
          const SizedBox(height: 20), // Bottom padding for the section
        ],
      ),
    );
  }

  Widget _buildEducationEntry({
    required String institution,
    required String degree,
    required String location,
    required String year,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                institution,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: CustomColor.whitePrimary,
                ),
              ),
            ),
            const SizedBox(width: 15),
            Text(
              location,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 14,
                color: CustomColor.whiteSecondary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                degree,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: CustomColor.whiteSecondary, // Adjust color if needed
                ),
              ),
            ),
            const SizedBox(width: 15),
            Text(
              year,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 14,
                color: CustomColor.whiteSecondary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
