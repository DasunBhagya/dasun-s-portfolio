import 'package:flutter/material.dart';
import 'package:myworkflow/constants/colors.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 25.0),
      width: double.maxFinite,
      color: CustomColor.bglight1, // Or choose a suitable background color
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Experience",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),
          const SizedBox(height: 30),

          // Java SE Developer Entry
          _buildExperienceEntry(
            title: "Java SE developer",
            company:
                "Finakle ERP Solution - Restaurant and Vine Store Erp System",
            location: "Naranwala, Gampaha",
            date: "Oct. 2024 – Dec. 2024",
            descriptionPoints: [
              "Build Payroll System",
              "Learning and understanding and effectively using the system's processes to track, manage, and analyze information.",
            ],
          ),
          const SizedBox(height: 25), // Spacing between entries

          // AIP Position Entry
          _buildExperienceEntry(
            title: "AIP position",
            company: "OREL IT",
            location: "Maharagama, Colombo",
            date: "Jul 2020 - Feb 2021",
            descriptionPoints: [
              "The Associate Image Processor is responsible for processing and analyzing images for ai based software developing using a variety of software and hardware tools.",
              "I experience how SOFTWARE DEV company environment work as it is fast-paced and dynamic", // Corrected typo from "experiance"
            ],
          ),
          const SizedBox(height: 20), // Bottom padding for the section
        ],
      ),
    );
  }

  Widget _buildExperienceEntry({
    required String title,
    required String company,
    required String location,
    required String date,
    required List<String> descriptionPoints,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: CustomColor.whitePrimary,
                ),
              ),
            ),
            const SizedBox(width: 15),
            Text(
              date,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 14,
                color:
                    CustomColor.whiteSecondary, // Assuming you have this color
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
                company,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: CustomColor.whiteSecondary, // Adjust color if needed
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
        const SizedBox(height: 10),
        for (String point in descriptionPoints)
          Padding(
            padding:
                const EdgeInsets.only(bottom: 5.0, left: 10.0), // Indent points
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "• ",
                  style: TextStyle(color: CustomColor.whiteSecondary),
                ),
                Expanded(
                  child: Text(
                    point,
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.4,
                      color: CustomColor.whiteSecondary,
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
