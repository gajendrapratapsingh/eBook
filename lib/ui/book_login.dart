import 'package:ebook/components/no_account_text.dart';
import 'package:ebook/components/socal_card.dart';
import 'package:ebook/controllers/LoginController.dart';
import 'package:ebook/theme/themes.dart';
import 'package:ebook/ui/book_signup.dart';
import 'package:ebook/utils/routes/routes.dart';
import 'package:ebook/widgets/sign_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  final _formSignInKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  bool rememberPassword = true;

  final _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text("Sign In"),
    //   ),
    //   body: SafeArea(
    //     child: SizedBox(
    //       width: double.infinity,
    //       child: Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: 20),
    //         child: SingleChildScrollView(
    //           child: Column(
    //             children: [
    //               const SizedBox(height: 16),
    //               const Text(
    //                 "Welcome Back",
    //                 style: TextStyle(
    //                   color: Colors.black,
    //                   fontSize: 24,
    //                   fontWeight: FontWeight.bold,
    //                 ),
    //               ),
    //               const Text(
    //                 "Sign in with your email and password  \nor continue with social media",
    //                 textAlign: TextAlign.center,
    //               ),
    //               const SizedBox(height: 16),
    //               const SignForm(),
    //               const SizedBox(height: 16),
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   SocalCard(
    //                     icon: "assets/icons/google-icon.svg",
    //                     press: () {},
    //                   ),
    //                   SocalCard(
    //                     icon: "assets/icons/facebook-2.svg",
    //                     press: () {},
    //                   ),
    //                   SocalCard(
    //                     icon: "assets/icons/twitter.svg",
    //                     press: () {},
    //                   ),
    //                 ],
    //               ),
    //               const SizedBox(height: 20),
    //               const NoAccountText(),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/bg1.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SafeArea(child: Column(
            children: [
              const Expanded(flex: 1, child: SizedBox(height: 10)),
              Expanded(
                flex: 5,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(25.0, 30.0, 25.0, 20.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formSignInKey,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.w900,
                                color: lightColorScheme.primary,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                            validator: (value) {
                              bool emailValid = RegExp("^[_A-Za-z0-9-]+(\.[_A-Za-z0-9-]+)*@[A-Za-z0-9\.]+(\.[A-Za-z0-9]+)*(\.[A-Za-z]{2,})\$").hasMatch(value!.trim());
                              //bool emailValid = RegExp("^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})\$").hasMatch(value!.trim());
                              if(value.isEmpty) {
                                return "Please enter valid email";
                              }
                              else if(!emailValid) {
                                return "Please enter valid email";
                              }
                            },
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              label: const Text('Email'),
                              hintText: 'Enter Email',
                              hintStyle: const TextStyle(
                                color: Colors.black26,
                              ),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black12, // Default border color
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black12, // Default border color
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 25.0,
                          ),
                          Obx(() => TextFormField(
                            obscureText: _loginController.isVisible,
                            obscuringCharacter: '*',
                            controller: passController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Password';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              label: const Text('Password'),
                              hintText: 'Enter Password',
                              hintStyle: const TextStyle(
                                color: Colors.black26,
                              ),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black12, // Default border color
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black12, // Default border color
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              suffixIcon: IconButton(onPressed: () {
                                _loginController.setVisibilty();
                              }, icon: _loginController.isVisible ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off)),
                            ),
                          )),
                          const SizedBox(
                            height: 25.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: rememberPassword,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        rememberPassword = value!;
                                      });
                                    },
                                    activeColor: lightColorScheme.primary,
                                  ),
                                  const Text(
                                    'Remember me',
                                    style: TextStyle(
                                      color: Colors.black45,
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: (){
                                  Get.toNamed(Routes.forgetScreen);
                                },
                                child: Text(
                                  'Forget password?',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: lightColorScheme.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 25.0),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.indigo
                              ),
                              onPressed: () {
                                if(_formSignInKey.currentState!.validate() && rememberPassword) {
                                  _loginController.login(emailController.text.trim(), passController.text.trim(), context).then((user) {
                                       if(user != null) {
                                         Get.toNamed(Routes.initScreen);
                                         // ScaffoldMessenger.of(context).showSnackBar(
                                         //   SnackBar(
                                         //     content: Text(user.email!),
                                         //   ),
                                         // );
                                       }
                                       else{
                                         ScaffoldMessenger.of(context).showSnackBar(
                                           const SnackBar(
                                             content: Text("Invalid Credentials!!"),
                                           ),
                                         );
                                       }
                                  });
                                  // ScaffoldMessenger.of(context).showSnackBar(
                                  //   const SnackBar(
                                  //     content: Text('Processing Data'),
                                  //   ),
                                  // );
                                }
                                else if(!rememberPassword) {
                                  // ScaffoldMessenger.of(context).showSnackBar(
                                  //   const SnackBar(
                                  //       content: Text(
                                  //           'Please agree to the processing of personal data')),
                                  // );
                                }
                              },
                              child: const Text('Sign in', style: TextStyle(color: Colors.white)),
                            ),
                          ),
                          const SizedBox(height: 25.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Divider(
                                  thickness: 0.7,
                                  color: Colors.grey.withOpacity(0.5),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 0,
                                  horizontal: 10,
                                ),
                                child: Text(
                                  'Sign up with',
                                  style: TextStyle(
                                    color: Colors.black45,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  thickness: 0.7,
                                  color: Colors.grey.withOpacity(0.5),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SocalCard(
                                icon: "assets/icons/google-icon.svg",
                                press: () {},
                              ),
                              SocalCard(
                                icon: "assets/icons/facebook-2.svg",
                                press: () {},
                              ),
                              SocalCard(
                                icon: "assets/icons/twitter.svg",
                                press: () {},
                              ),
                            ],
                          ),
                          const SizedBox(height: 20.0),
                          // don't have an account
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Don\'t have an account? ',
                                style: TextStyle(
                                  color: Colors.black45,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (e) => const SignUpScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Sign up',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: lightColorScheme.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
          Obx(() => _loginController.loginState == LoginState.Busy ? const Center(child: CircularProgressIndicator(strokeWidth: 3.0)) : const SizedBox())
        ],
      ),
    );
  }
}