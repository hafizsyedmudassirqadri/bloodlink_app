import 'package:bloodlink_app/constants/app_colors.dart';
import 'package:bloodlink_app/constants/app_media_query.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoleSelectionUi extends StatefulWidget {
  const new({super.key});

  @override
  State<RoleSelectionUi> createState() => _RoleSelectionUiState();
}

class _RoleSelectionUiState extends State<RoleSelectionUi> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final media = AppMediaQuery.of(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: media.width * 0.06,
          vertical: media.height * 0.07,
        ),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Text(
                    "How would you like to",
                    style: GoogleFonts.poppins(
                      fontSize: media.width * 0.050,
                      fontWeight: FontWeight.w900,
                      color: AppColors.black,
                    ),
                  ),
                  Text(
                    "use BloodLink?",
                    style: GoogleFonts.poppins(
                      fontSize: media.width * 0.050,
                      fontWeight: FontWeight.w900,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: media.height * 0.01),
                  Text(
                    "You can donate blood, request",
                    style: GoogleFonts.poppins(
                      fontSize: media.width * 0.030,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                    ),
                  ),
                  Text(
                    "blood, or do both anytime.",
                    style: GoogleFonts.poppins(
                      fontSize: media.width * 0.030,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: media.width * 0.05),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: media.width * 0.04,
                      vertical: media.height * 0.02,
                    ),
                    decoration: BoxDecoration(
                      border: isChecked ? Border.all(color: AppColors.primary, width: 2): Border.all(color: AppColors.silver, width: 2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/role_sel/heart.png",
                          height: media.height * 0.05,
                          width: media.width * 0.10,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(width: media.width * 0.03),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Donate Blood",
                                style: GoogleFonts.poppins(
                                  fontSize: media.width * 0.040,
                                  fontWeight: FontWeight.w900,
                                  color: AppColors.black,
                                ),
                              ),
                              Text(
                                "Help patients in need by donating blood.",
                                style: GoogleFonts.poppins(
                                  fontSize: media.width * 0.035,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Checkbox(
                            shape: CircleBorder(),
                            value: isChecked,
                            activeColor: const Color(0xFFD62339),
                            onChanged: (bool? newValue) {
                              setState(() {
                                isChecked = newValue ?? false;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: media.width * 0.03),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: media.width * 0.04,
                      vertical: media.height * 0.02,
                    ),
                    decoration: BoxDecoration(
                      border: isChecked ? Border.all(color: AppColors.primary, width: 2): Border.all(color: AppColors.silver, width: 2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/role_sel/drop.png",
                          height: media.height * 0.05,
                          width: media.width * 0.10,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(width: media.width * 0.03),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Request Blood",
                                style: GoogleFonts.poppins(
                                  fontSize: media.width * 0.040,
                                  fontWeight: FontWeight.w900,
                                  color: AppColors.black,
                                ),
                              ),
                              Text(
                                "Create blood requests for yourself or family.",
                                style: GoogleFonts.poppins(
                                  fontSize: media.width * 0.035,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Checkbox(
                            shape: CircleBorder(),
                            value: isChecked,
                            activeColor: const Color(0xFFD62339),
                            onChanged: (bool? newValue) {
                              setState(() {
                                isChecked = newValue ?? false;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: media.width * 0.03),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: media.width * 0.04,
                      vertical: media.height * 0.02,
                    ),
                    decoration: BoxDecoration(
                      border: isChecked ? Border.all(color: AppColors.primary, width: 2): Border.all(color: AppColors.silver, width: 2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/role_sel/users.png",
                          height: media.height * 0.05,
                          width: media.width * 0.10,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(width: media.width * 0.03),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Both (Recommended)",
                                style: GoogleFonts.poppins(
                                  fontSize: media.width * 0.040,
                                  fontWeight: FontWeight.w900,
                                  color: AppColors.black,
                                ),
                              ),
                              Text(
                                "Donate blood and also create blood requests when needed.",
                                style: GoogleFonts.poppins(
                                  fontSize: media.width * 0.035,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Checkbox(
                            shape: CircleBorder(),
                            value: isChecked,
                            activeColor: const Color(0xFFD62339),
                            onChanged: (bool? newValue) {
                              setState(() {
                                isChecked = newValue ?? false;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
