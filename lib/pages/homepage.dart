import 'package:flutter/material.dart';
import 'package:myworkflow/constants/colors.dart';
import 'package:myworkflow/constants/size.dart';
import 'package:myworkflow/constants/skill_items.dart';
import 'package:myworkflow/widgets/connctwithme.dart';
import 'package:myworkflow/widgets/custom_text_field.dart';
import 'package:myworkflow/widgets/drawer_mobile.dart';
import 'package:myworkflow/widgets/educationsectio.dart';
import 'package:myworkflow/widgets/experience.dart';
import 'package:myworkflow/widgets/header_desktop.dart';
import 'package:myworkflow/widgets/header_mobile.dart';
import 'package:myworkflow/widgets/project_section.dart';

import 'package:myworkflow/widgets/skills_desktop.dart';
import 'package:url_launcher/url_launcher.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(4, (index) => GlobalKey());

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: CustomColor.scaffoldBg,
          endDrawer: constraints.maxWidth >= kMinDesktopWidth
              ? null
              : DrawerMobile(onNavItemTap: (int navIndex) {
                  scaffoldKey.currentState?.closeEndDrawer();
                  scrollToSection(navIndex);
                }),
          body: SingleChildScrollView(
            controller: scrollController,
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(key: navbarKeys.first),
                // Header Section
                if (constraints.maxWidth >= kMinDesktopWidth)
                  HeaderDesktop(onNavMenuTap: (int navIndex) {
                    scrollToSection(navIndex);
                  })
                else
                  HeaderMobile(
                    onLogoTap: () {},
                    onMenuTap: () {
                      scaffoldKey.currentState?.openEndDrawer();
                    },
                  ),

                // Hero Section
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 40.0,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Hi,\nI'm Dasun ",
                              style: TextStyle(
                                fontSize: 40.0,
                                height: 1.5,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 9, 192, 243),
                              ),
                            ),
                            const Text(
                              "Undergraduate SE | Full stack | Dev \n | Cloud & Devops Enthusiast",
                              style: TextStyle(
                                fontSize: 30.0,
                                height: 1.5,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 193, 155, 220),
                              ),
                            ),
                            const SizedBox(height: 30.0),
                            ElevatedButton(
                              onPressed: () async {
                                const url =
                                    'https://drive.google.com/file/d/11uuYznUXsxpt53VZ5EjzuqNahXSEAZ7G/view?usp=drive_link';
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                              child: const Text("Download CV"),
                            ),
                          ],
                        ),
                      ),
                      if (constraints.maxWidth > 600)
                        Expanded(
                          child: Image.asset(
                            "assets/DP.png",
                            fit: BoxFit.contain,
                            height: 400,
                            width: 409,
                          ),
                        ),
                    ],
                  ),
                ),

                // Skills Section
                Container(
                  key: navbarKeys[1],
                  width: double.maxFinite,
                  padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                  color: CustomColor.bglight1,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Title
                      const Text(
                        "What can I do",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: CustomColor.whitePrimary,
                        ),
                      ),
                      const SizedBox(height: 50),
                      // Platform and skills section
                      if (constraints.maxWidth >= kMinDesktopWidth)
                        const SkillsDesktop()
                      else
                        Column(
                          children: [
                            // Platform section for mobile
                            Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: [
                                for (int i = 0; i < platformItems.length; i++)
                                  Container(
                                    width: constraints.maxWidth * 0.4,
                                    decoration: BoxDecoration(
                                      color: CustomColor.bglight2,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: ListTile(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        horizontal: 15.0,
                                        vertical: 8.0,
                                      ),
                                      leading: Image.asset(
                                        platformItems[i]["img"],
                                        width: 26.0,
                                      ),
                                      title: Text(platformItems[i]["title"]),
                                    ),
                                  ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            // Skills section for mobile
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                for (int i = 0; i < skillItems.length; i++)
                                  Chip(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10.0,
                                      horizontal: 14.0,
                                    ),
                                    label: Text(skillItems[i]["title"]),
                                    avatar: Image.asset(skillItems[i]["img"]),
                                  ),
                              ],
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
                //ExperienceSection
                const ExperienceSection(),
                //ExperienceSection
                const SizedBox(height: 30),
                const EducationSection(),
                // Projects Section
                ProjectSection(key: navbarKeys[2]),
                const SizedBox(height: 30),

                // Connect with me Section
                ConnectWithMeSection(
                  key: navbarKeys[3],
                ),

                // Contact Section
                Container(
                  padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                  color: CustomColor.scaffoldBg,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Title
                      const Text(
                        "Get in touch",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: CustomColor.whitePrimary,
                        ),
                      ),
                      const SizedBox(height: 50),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 700),
                        child: Row(
                          children: [
                            //name
                            Flexible(
                              child: CustomTextField(
                                controller: _nameController,
                                hintText: "Your Name",
                                maxLines: 1,
                              ),
                            ),
                            const SizedBox(width: 15),
                            //email
                            Flexible(
                              child: CustomTextField(
                                controller: _emailController,
                                hintText: "Your Email",
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      // message
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 700,
                        ),
                        child: CustomTextField(
                          controller: _messageController,
                          hintText: "Your Message",
                          maxLines: 5,
                        ),
                      ),
                      const SizedBox(height: 20),
                      //send button
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 700,
                        ),
                        child: SizedBox(
                          width: double.maxFinite,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text("Proceed..."),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 300,
                        ),
                        child: const Divider(),
                      ),
                      //SNS icon button links
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void scrollToSection(int navIndex) {
    if (navIndex == 4) {
      //open a blog page
      return;
    }

    final key = navbarKeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
