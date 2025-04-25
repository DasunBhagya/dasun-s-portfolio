import 'package:flutter/material.dart';
import 'package:myworkflow/constants/colors.dart';
import 'package:myworkflow/utils/projects_utils.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.project,
  });

  final ProjectUtils project;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 450,
        width: 390,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: CustomColor.bglight2,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          //project image
          children: [
            Image.asset(
              project.image,
              height: 190,
              width: 310,
              fit: BoxFit.cover,
            ),

            //title

            Padding(
              padding: const EdgeInsets.fromLTRB(12, 15, 12, 12),
              child: Text(
                project.title,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: CustomColor.whitePrimary,
                ),
              ),
            ),

            //subtitle

            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
              child: Text(
                project.subtitle,
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 10,
                    color: CustomColor.whiteSecondary),
              ),
            ),

            const Spacer(),

            // footer

            Container(
                color: CustomColor.bglight1,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    const Text(
                      "Available on : ",
                      style: TextStyle(
                        color: CustomColor.yellowSecondary,
                        fontSize: 10,
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: InkWell(
                        onTap: () {},
                        child: Image.asset(
                          "assets/web_icon.png",
                          width: 17,
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ));
  }
}
