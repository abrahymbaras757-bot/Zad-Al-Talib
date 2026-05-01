import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zad_altalib/core/services/auth_services.dart';
import 'package:zad_altalib/features/admin_dashboard/views/admin_dashboard_views.dart';
import 'package:zad_altalib/features/auth/widgets/custom_button.dart';
import 'package:zad_altalib/providers/user_provider.dart';
import 'package:zad_altalib/shared/custom_radio_list.dart';
import 'package:zad_altalib/features/teacher_dashboard/views/teacher_dashboard_views.dart';
import 'package:zad_altalib/model/user_model.dart';
import 'package:zad_altalib/root.dart';
import 'package:zad_altalib/shared/custom_dropdown.dart';
import 'package:zad_altalib/shared/custom_text.dart';
import 'package:zad_altalib/shared/custom_text_field.dart';
import 'package:zad_altalib/shared/enums/option.dart';

class LoginViews extends StatefulWidget {
  const LoginViews({super.key});

  @override
  State<LoginViews> createState() => _LoginViewsState();
}

class _LoginViewsState extends State<LoginViews> {
  Option? _selectedOption; // الاختيار المبدئي  = null
  String? loginError;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController pasController = TextEditingController();
  final List<String> items = ['الاولى', 'الثانية', 'الثالثة', 'الرابعة'];
  final GlobalKey<FormState> _formkey = GlobalKey();

  @override
  void dispose() {
    nameController.dispose();
    pasController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GestureDetector(
          // تستخدم لاخفاء الكيبور عند الضغط في اي مكان اخر
          onTap: () =>
              FocusScope.of(context).unfocus(), // هاذه الداله تقوم بالاخفاء
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.surface,

            body: Center(
              child: Form(
                key: _formkey,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 45,
                    left: 0,
                    right: 0,
                    bottom: 0,
                  ),
                  child: Column(
                    children: [
                      // شعار التطبيق
                      SizedBox(
                        width: 280,
                        child: Image.asset('assets/zad.png'),
                      ),

                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(height: 0),
                                  CustomText(
                                    text: 'تسجيل الدخول',
                                    size: 20,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.inversePrimary,
                                  ),
                                  SizedBox(height: 20),
                                  CustomTextField(
                                    hint: 'اسم المستخدم',
                                    ispassword: false,
                                    controller: nameController,
                                    sideColor: Theme.of(
                                      context,
                                    ).colorScheme.outline,
                                    hintColor: Theme.of(
                                      context,
                                    ).colorScheme.inversePrimary,
                                  ),
                                  SizedBox(height: 15),
                                  CustomTextField(
                                    hint: 'كلمة المرور',
                                    ispassword: true,
                                    controller: pasController,
                                    hintColor: Theme.of(
                                      context,
                                    ).colorScheme.inversePrimary,
                                    iconColor: Theme.of(
                                      context,
                                    ).colorScheme.tertiary,
                                    sideColor: Theme.of(
                                      context,
                                    ).colorScheme.outline,
                                  ),
                                  SizedBox(height: 15),

                                  CustomDropdown(
                                    helper: 'الرجاء تحديد السنة الحالية',
                                    labeltext: 'السنة الحالية',
                                    items: items,
                                    sideColor: Theme.of(
                                      context,
                                    ).colorScheme.outline,
                                    textColor: Theme.of(
                                      context,
                                    ).colorScheme.inversePrimary,
                                    labelColor: Theme.of(
                                      context,
                                    ).colorScheme.inversePrimary,
                                    helperColor: Theme.of(
                                      context,
                                    ).colorScheme.secondary,
                                  ),
                                  SizedBox(height: 10),

                                  Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Row(
                                      children: [
                                        CustomText(
                                          text: 'الترم الحالي :',
                                          size: 18,
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.inversePrimary,
                                        ),
                                        Expanded(
                                          child: Directionality(
                                            textDirection: TextDirection.ltr,
                                            child: CustomRadioList(
                                              title: 'الاول',
                                              value: Option.first,
                                              groupValue: _selectedOption,
                                              onChanged: (value) {
                                                setState(() {
                                                  _selectedOption = value;
                                                });
                                              },
                                              titleColor: Theme.of(
                                                context,
                                              ).colorScheme.inversePrimary,
                                            ),
                                          ),
                                        ),
                                        // Radio 2
                                        Expanded(
                                          child: Directionality(
                                            textDirection: TextDirection.ltr,
                                            child: CustomRadioList(
                                              title: 'الثاني',
                                              value: Option.second,
                                              groupValue: _selectedOption,
                                              onChanged: (value) {
                                                setState(() {
                                                  _selectedOption = value;
                                                });
                                              },
                                              titleColor: Theme.of(
                                                context,
                                              ).colorScheme.inversePrimary,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  CustomButton(
                                    width: 340,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.secondary,
                                    text: 'دخول',
                                    onTap: () {
                                      if (_formkey.currentState!.validate()) {
                                        final user = AuthServices.login(
                                          nameController.text,
                                          pasController.text,
                                        );
                                        if (user != null) {
                                          if (user.role == UserRole.student &&
                                              user.isActive == true) {
                                            final userProvider =
                                                Provider.of<UserProvider>(
                                                  context,
                                                  listen: false,
                                                );
                                            userProvider.login(user);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (_) =>
                                                    Root(currentUser: user),
                                              ),
                                            );
                                          } else if (user.role ==
                                                  UserRole.teacher &&
                                              user.isActive == true) {
                                            final userProvider =
                                                Provider.of<UserProvider>(
                                                  context,
                                                  listen: false,
                                                );
                                            userProvider.login(user);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (_) =>
                                                    TeacherDashboardViews(
                                                      currentUser: user,
                                                    ),
                                              ),
                                            );
                                          } else if (user.role ==
                                                  UserRole.admin &&
                                              user.isActive == true) {
                                            final userProvider =
                                                Provider.of<UserProvider>(
                                                  context,
                                                  listen: false,
                                                );

                                            userProvider.login(user);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (_) =>
                                                    AdminDashboardViews(),
                                              ),
                                            );
                                          }
                                        } else {
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            SnackBar(
                                              content: Text('بيانات غير صحيحة'),
                                            ),
                                          );
                                        }
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
