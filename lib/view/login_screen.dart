import 'package:bloodlink_app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreenUi extends StatefulWidget {
  const new({super.key});

  @override
  State<LoginScreenUi> createState() => _LoginScreenUiState();
}

class _LoginScreenUiState extends State<LoginScreenUi> {
  @override
  Widget build(BuildContext context) {
    final screenH = MediaQuery.of(context).size.height;
    final screenW = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(
          horizontal: screenW * 0.04,
          vertical: screenH * 0.05,
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage("assets/Au&OnIcon/drop.png"),
                    height: screenH * 0.07,
                    width: screenH * 0.07,
                  ),
                  SizedBox(height: screenH * 0.010),
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
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: screenH * 0.045,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFFD62339).withValues(alpha: 0.5),
                      ),
                      borderRadius: BorderRadius.circular(19.0),
                    ),

                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFD62339),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.poppins(
                          fontSize: screenW * 0.032,
                          fontWeight: FontWeight.w500,
                          color: AppColors.darkThPrimaryTxt,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: screenW * 0.02),
                Expanded(
                  child: Container(
                    height: screenH * 0.045,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.silverBorder),
                      borderRadius: BorderRadius.circular(17.0),
                    ),

                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFF8FAFC),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.poppins(
                          fontSize: screenW * 0.032,
                          fontWeight: FontWeight.w500,
                          color: AppColors.lightThPrimaryTxt,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenH * 0.03),

            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email_outlined,
                size: screenW*0.06,
                ),
                hintText: "Email",
                hintStyle: GoogleFonts.poppins(
                  color: AppColors.lightThPrimaryTxt,
                  fontSize: screenW*0.033,
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
            SizedBox(height: screenH * 0.02),
           TextField(
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: GoogleFonts.poppins(
                  color: AppColors.lightThPrimaryTxt,
                  fontSize: screenW*0.033,
                ),
                prefixIcon: Icon(Icons.lock_outline,
                size: screenW*0.06,
                ),
                suffixIcon: Icon(Icons.visibility_off_outlined),
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
          ],
        ),
      ),
    );
  }
}
