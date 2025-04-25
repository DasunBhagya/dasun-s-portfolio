import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ConnectWithMeSection extends StatelessWidget {
  const ConnectWithMeSection({super.key});

  // Helper function to launch URLs safely
  Future<void> _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      // Could not launch the URL, handle the error appropriately
      // (e.g., show a snackbar)
      print('Could not launch $urlString');
      // Consider showing feedback to the user here
      // Example: ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('Could not open link: $urlString')),
      // );
    }
  }

  // Helper function to build styled social media buttons
  Widget _buildSocialButton({
    required IconData icon,
    required String label,
    required String url,
    required Color backgroundColor,
    Color? foregroundColor, // Optional: Defaults based on theme
  }) {
    return ElevatedButton.icon(
      icon: FaIcon(icon, size: 20.0), // Using FontAwesome icon
      label: Text(label),
      onPressed: () => _launchURL(url),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor, // Button background color
        foregroundColor: foregroundColor ?? Colors.white, // Text and icon color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0), // Slightly rounded corners
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        elevation: 4.0, // Add some shadow
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Define colors (you can customize these)
    const Color sectionBackgroundColor = Color(0xFF2C3E50); // Dark blue-grey
    const Color titleColor = Colors.white;
    const Color githubColor = Color(0xFF333333);
    const Color linkedinColor = Color(0xFF0A66C2);
    const Color stackOverflowColor = Color(0xFFF48024);
    const Color leetCodeColor = Color(0xFFFFA116); // LeetCode orange

    return Container(
      // height: 500, // Consider making height flexible or removing it
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
      color: sectionBackgroundColor, // Background color for the section
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Section Title
            const Text(
              "Connect with me",
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: titleColor,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 30.0), // Spacing below title

            // Social Media Buttons in a Wrap layout
            Wrap(
              spacing: 15.0, // Horizontal space between buttons
              runSpacing: 15.0, // Vertical space between button rows
              alignment: WrapAlignment.center, // Center buttons horizontally
              children: [
                _buildSocialButton(
                  icon: FontAwesomeIcons.github,
                  label: 'GitHub',
                  url: 'https://github.com/DasunBhagya',
                  backgroundColor: githubColor,
                ),
                _buildSocialButton(
                  icon: FontAwesomeIcons
                      .linkedinIn, // Use linkedinIn for the icon
                  label: 'LinkedIn',
                  url: 'https://www.linkedin.com/in/dasunbhagya/',
                  backgroundColor: linkedinColor,
                ),
                _buildSocialButton(
                  icon: FontAwesomeIcons.stackOverflow,
                  label: 'Stack Overflow',
                  url: 'https://stackoverflow.com/users/23850268/dasun-bhagya',
                  backgroundColor: stackOverflowColor,
                  foregroundColor:
                      Colors.white, // Explicit white for better contrast
                ),
                // LeetCode doesn't have a direct FontAwesome icon,
                // Using a generic code icon as a placeholder
                _buildSocialButton(
                  icon: FontAwesomeIcons.code, // Placeholder icon
                  label: 'LeetCode',
                  url: 'https://leetcode.com/u/DBhagya25/',
                  backgroundColor: leetCodeColor,
                  foregroundColor:
                      Colors.black87, // Darker text for contrast on orange
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
