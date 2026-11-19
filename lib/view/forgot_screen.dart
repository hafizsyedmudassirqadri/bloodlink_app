import 'package:bloodlink_app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotScreenUi extends StatefulWidget {
  const new({super.key});

  @override
  State<ForgotScreenUi> createState() => _ForgotScreenUiState();
}

class _ForgotScreenUiState extends State<ForgotScreenUi> {
  @override
  Widget build(BuildContext context) {
    final screenH = MediaQuery.of(context).size.height;
    final screenW = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenW * 0.08,
          vertical: screenH * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // Logo and Tagline Section
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    image: const AssetImage("assets/Au&OnIcon/drop.png"),
                    height: screenH * 0.07,
                    width: screenH * 0.07,
                  ),
                  SizedBox(height: screenH * 0.009),
                  Text(
                    "BloodLink",
                    style: GoogleFonts.poppins(
                      fontSize: screenW * 0.045,
                      fontWeight: FontWeight.bold,
                      color: AppColors.lightThPrimaryTxt,
                    ),
                  ),
                  SizedBox(height: screenH * 0.009),
                  Text(
                    "Connecting Donors, Saving Lives.",
                    style: GoogleFonts.poppins(
                      fontSize: screenW * 0.030,
                      fontWeight: FontWeight.w500,
                      color: AppColors.lightThPrimaryTxt,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenH * 0.02),

            Text(
              "Forgot Password?",
              style: GoogleFonts.poppins(
                fontSize: screenW * 0.045,
                fontWeight: FontWeight.bold,
                color: AppColors.lightThPrimaryTxt,
              ),
            ),
            SizedBox(height: screenH * 0.01),

            Text(
              "No worries! Enter your E-mail & we'll send you a link to reset your password.",
              style: GoogleFonts.poppins(
                fontSize: screenW * 0.033,
                fontWeight: FontWeight.w500,
                color: AppColors.lightThPrimaryTxt,
              ),
            ),
            SizedBox(height: screenH * 0.023),

            TextField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email_outlined, size: screenW * 0.06),
                hintText: "Email",
                hintStyle: GoogleFonts.poppins(
                  color: AppColors.lightThPrimaryTxt,
                  fontSize: screenW * 0.033,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.silverBorder.withValues(alpha: 0.5),
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.silverBorder,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
            SizedBox(height: screenH * 0.025),

            // Main Submit Button
            SizedBox(
              width: double.infinity,
              height: screenH * 0.055,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD62339),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Send Reset Link",
                  style: GoogleFonts.poppins(
                    fontSize: screenW * 0.038,
                    fontWeight: FontWeight.w600,
                    color: AppColors.darkThPrimaryTxt,
                  ),
                ),
              ),
            ),
            SizedBox(height: screenH * 0.01),
            SizedBox(
              width: double.infinity,
              child: Image.asset(
                'assets/Au&OnIcon/secureforg.png',
                width: 230,
                height: 230,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
