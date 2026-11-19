import 'package:bloodlink_app/constants/app_colors.dart';
import 'package:bloodlink_app/constants/app_media_query.dart';
import 'package:bloodlink_app/view/forgot_screen.dart';
import 'package:bloodlink_app/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreenUi extends StatefulWidget {
  const SignupScreenUi({super.key});

  @override
  State<SignupScreenUi> createState() => _SignupScreenUiState();
}

class _SignupScreenUiState extends State<SignupScreenUi> {
  bool isChecked = false;
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    final media = AppMediaQuery.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: media.width * 0.04,
            vertical: media.height * 0.05,
          ),
          child: Column(
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
                      height: media.height * 0.07,
                      width: media.height * 0.07,
                    ),
                    SizedBox(height: media.height * 0.009),
                    Text(
                      "Create Account",
                      style: GoogleFonts.poppins(
                        fontSize: media.width * 0.045,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                    SizedBox(height: media.height * 0.009),
                    Text(
                      "Join BloodLink and be a part of a life-saving community.",
                      style: GoogleFonts.poppins(
                        fontSize: media.width * 0.030,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: media.height * 0.02),

              // Toggle Buttons (Login / Sign Up)
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: media.height * 0.050,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.silver),
                        borderRadius: BorderRadius.circular(17.0),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF8FAFC),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17.0),
                          ),
                        ),
                        onPressed: () {
                          var route = MaterialPageRoute(
                            builder: (context) => LoginScreenUi(),
                          );

                          Navigator.push(context, route);
                        },
                        child: Text(
                          "Log in",
                          style: GoogleFonts.poppins(
                            fontSize: media.width * 0.032,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: media.width * 0.02),
                  Expanded(
                    child: Container(
                      height: media.height * 0.050,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFFD62339).withValues(alpha: 0.5),
                        ),
                        borderRadius: BorderRadius.circular(19.0),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFD62339),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(19.0),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Sign Up",
                          style: GoogleFonts.poppins(
                            fontSize: media.width * 0.032,
                            fontWeight: FontWeight.w500,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: media.height * 0.03),

              TextField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person, size: media.width * 0.06),
                  hintText: "Full Name",
                  hintStyle: GoogleFonts.poppins(
                    color: AppColors.black,
                    fontSize: media.width * 0.033,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.silver.withValues(alpha: 0.5),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.silver, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              SizedBox(height: media.height * 0.014),

              // Email TextField
              TextField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    size: media.width * 0.06,
                  ),
                  hintText: "Email",
                  hintStyle: GoogleFonts.poppins(
                    color: AppColors.black,
                    fontSize: media.width * 0.033,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.silver.withValues(alpha: 0.5),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.silver, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              SizedBox(height: media.height * 0.02),

              // Password TextField
              TextField(
                obscureText: isObscure,
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: GoogleFonts.poppins(
                    color: AppColors.black,
                    fontSize: media.width * 0.033,
                  ),
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    size: media.width * 0.06,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      isObscure
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                    onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.silver.withValues(alpha: 0.5),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.silver, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              SizedBox(height: media.height * 0.01),
              TextField(
                obscureText: isObscure,
                decoration: InputDecoration(
                  hintText: "Confirm Password",
                  hintStyle: GoogleFonts.poppins(
                    color: AppColors.black,
                    fontSize: media.width * 0.033,
                  ),
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    size: media.width * 0.06,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      isObscure
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                    onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.silver.withValues(alpha: 0.5),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.silver, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              SizedBox(height: media.height * 0.01),

              // Remember Me & Forgot Password Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        shape: CircleBorder(),
                        value: isChecked,
                        activeColor: const Color(0xFFD62339),
                        onChanged: (bool? newValue) {
                          setState(() {
                            isChecked = newValue ?? false;
                          });
                        },
                      ),
                      Text(
                        "Remember me",
                        style: GoogleFonts.poppins(
                          fontSize: media.width * 0.030,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      var route = MaterialPageRoute(
                        builder: (context) => ForgotScreenUi(),
                      );

                      Navigator.push(context, route);
                    },
                    child: Text(
                      "Forgot Password?",
                      style: GoogleFonts.poppins(
                        fontSize: media.width * 0.030,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFFD62339),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: media.height * 0.01),

              // Main Submit Button
              SizedBox(
                width: double.infinity,
                height: media.height * 0.055,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD62339),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Create an account",
                    style: GoogleFonts.poppins(
                      fontSize: media.width * 0.038,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: media.height * 0.03),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Or continue with",
                    style: GoogleFonts.poppins(
                      fontSize: media.width * 0.038,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: media.height * 0.02),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: [
                      Expanded(
                        child: Container(
                          height: media.height * 0.07,
                          width: media.width * 0.35,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.withValues(alpha: 0.3),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage(
                                  "assets/Au&OnIcon/google.png",
                                ),
                                height: media.height * 0.13,
                                width: media.width * 0.13,
                              ),
                              Text("Google"),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: media.width * 0.03),
                      Expanded(
                        child: Container(
                          height: media.height * 0.07,
                          width: media.width * 0.35,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.withValues(alpha: 0.3),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                              Image(
                                image: AssetImage("assets/Au&OnIcon/apple.png"),
                                height: media.height * 0.13,
                                width: media.width * 0.13,
                              ),
                              Text("Apple"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
