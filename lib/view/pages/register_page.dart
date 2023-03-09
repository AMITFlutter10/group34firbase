import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group34firbase/controller/data/app_cubit.dart';
import 'package:group34firbase/utilities/app_string.dart';
import 'package:group34firbase/utilities/theme.dart';
import '../widgets/default_form_field.dart';
import 'home_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  bool? isPassword;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    AppCubit cubit =AppCubit.get(context);
    return
       BlocConsumer<AppCubit, AppState>(
  listener: (context, state) {
  if(state is SaveUsersState){

  }
  },
  builder: (context, state) {
    return Scaffold(
              body: SafeArea(
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(20),
                            width: w,
                            height: h * 0.70,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(100),
                                // bottomRight: Radius.circular(50),
                                // topLeft: Radius.circular(50),
                                topRight: Radius.circular(100),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Form(
                                key: formKey,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                     AppStrings.registerTitle,
                                      //   title_Register.tr(),
                                      style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold,

                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    DefaultFormField(
                                        labelText: AppStrings.name,
                                        controller: nameController,
                                        keyboardType: TextInputType.name,
                                        validator: (value) {
                                          if (value!.length == 0) {
                                            return "Email cannot be empty ";
                                          } else {
                                            return null;
                                          }
                                        }),
                                     SizedBox(
                                      height: 20,
                                    ),
                                    DefaultFormField(
                                        labelText: AppStrings.email,
                                        controller: emailController,
                                        keyboardType: TextInputType.emailAddress,
                                        // prefix: Icon(Icons.email),
                                        validator: (value) {
                                          if (value!.length == 0) {
                                            return "Email cannot be empty ";
                                          }
                                          if (!RegExp(
                                              "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+.[a-z]")
                                              .hasMatch(value)) {
                                            return ("please enter valid email");
                                          } else {
                                            return null;
                                          }
                                        }),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    DefaultFormField(
                                      labelText: AppStrings.password,
                                      keyboardType: TextInputType.text,
                                      controller: passwordController,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width: w * .5,
                                      child: ElevatedButton(
                                        onPressed: () async {
                                   cubit.registerByEmailAndPassword(emailController.text,
                                       nameController.text, passwordController.text);
                                        },
                                        child: Text("register"),
                                        style: ElevatedButton.styleFrom(
                                          //primary: kSecondaryColor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(30)),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        GoogleAuthButton(

                                          // onPressed: () async {
                                          //   await  ChatCubit.get(context).SignInByGoogle();
                                          //   // await ChatCubit.get(context).SignInByGoogle();
                                          //   // Navigator.push(
                                          //   //     context,
                                          //   //     MaterialPageRoute(
                                          //   //       builder: (context) => const HomeScreen(),
                                          //   //     ));

                                          style: const AuthButtonStyle(
                                            buttonType: AuthButtonType.icon,
                                            iconType: AuthIconType.secondary,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        FacebookAuthButton(
                                          onPressed: () {},
                                          style: const AuthButtonStyle(
                                            //textStyle: TextStyle(color: Colors.black12),
                                              buttonType: AuthButtonType.icon,
                                              iconType: AuthIconType.secondary),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    ElevatedButton(
                                        onPressed: () async{
                                         await AppCubit.get(context).Image("cam");
                                        },
                                        child: Text(
                                         "choose photo",
                                          style: const TextStyle(color: Colors.white),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: Row(
                          //     children: [
                          //       Text(
                          //         LocaleKeys.have_account.tr(),
                          //         style: const TextStyle(color: Colors.white),
                          //       ),
                          //       InkWell(
                          //         onTap: () {
                          //           Navigator.of(context).pushReplacement(
                          //               MaterialPageRoute(
                          //                   builder: (context) => LoginScreen()));
                          //         },
                          //         child: Text(
                          //           LocaleKeys.Login_bottom.tr(),
                          //           style: const TextStyle(
                          //               fontWeight: FontWeight.bold,
                          //               fontSize: 15,
                          //               color: Colors.white
                          //           ),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // ElevatedButton(onPressed: ()async{
                          //   await context.setLocale(const Locale('ar'));
                          // }, child:const Text("Arabic")),
                          //
                          // ElevatedButton(onPressed: ()async{
                          //   await context.setLocale(const Locale('en'));
                          // }, child:const Text("English")),
                        ],
                      ),
                    ),
                  )),
            );
  });
  }
}