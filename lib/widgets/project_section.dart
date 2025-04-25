import 'package:flutter/material.dart';
import 'package:myworkflow/constants/colors.dart';
import 'package:myworkflow/utils/projects_utils.dart';
import 'package:myworkflow/widgets/project_card.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 1900,
      color: CustomColor.scaffoldBg,
      width: double.maxFinite,
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      child: Column(
        children: [
          // Work project title
          const Text(
            "Work Projects",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),

          const SizedBox(height: 50),
          // Work projects cards
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1300),
            child: Wrap(
              spacing: 25,
              runSpacing: 25,
              children: [
                for (int i = 0; i < workProjectUtils.length; i++)
                  ProjectCard(
                    project: workProjectUtils[i],
                  ),
              ],
            ),
          ),

          const SizedBox(height: 40),
          // Industrial project title
          const Text(
            "Industrial Projects",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),

          const SizedBox(height: 50),
          // Industrial projects cards
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1300),
            child: Wrap(
              spacing: 25,
              runSpacing: 25,
              children: [
                for (int i = 0; i < industrialProjectUtils.length; i++)
                  ProjectCard(
                    project: industrialProjectUtils[i],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
