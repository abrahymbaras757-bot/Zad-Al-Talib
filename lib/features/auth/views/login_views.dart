import 'package:flutter/material.dart';
import 'package:zad_altalib/features/auth/widgets/custom_button.dart';
import 'package:zad_altalib/features/auth/widgets/custom_radio_list.dart';
import 'package:zad_altalib/features/home/views/home_views.dart';
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
  final TextEditingController nemaController = TextEditingController();
  final TextEditingController pasController = TextEditingController();
  final List<String> items = ['الاولى', 'الثانية', 'الثالثة', 'الرابعة'];
  final GlobalKey<FormState> _formkey = GlobalKey();

  void dispose() {
    nemaController.dispose();
    pasController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  Container(width: 280, child: Image.asset('assets/zad.png')),
                  // نص
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
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
                                controller: nemaController,
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
                                color: Theme.of(context).colorScheme.secondary,
                                text: 'دخول',
                                onTap: () {
                                  if (_formkey.currentState!.validate()) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => HomeViews(),
                                      ),
                                    );
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
  }
}
