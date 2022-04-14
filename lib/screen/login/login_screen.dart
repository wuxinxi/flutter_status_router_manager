import 'package:fluroDemo/screen/login/widget_loading.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lib_router/app_router.dart';
import 'package:provider/provider.dart';

import '../../model/app_login_status_model.dart';
import '../../utils/app_constants.dart';
import '../../utils/font_utils.dart';
import '../../utils/sp_utils.dart';
import 'widget_user_text_field.dart';

///
/// @date: 2022/4/8 23:25
/// @author: TangRen
/// @remark:
///
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var userNameController = TextEditingController();
  var userPwdController = TextEditingController();
  final loading = const LoadingDialog();

  late TapGestureRecognizer _gestureRecognizer;

  @override
  void initState() {
    super.initState();
    _gestureRecognizer = TapGestureRecognizer();
  }

  @override
  void dispose() {
    _gestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.only(left: 20.0.w, right: 20.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(top: 10.0.w, bottom: 8.0.w)),
            UserTextField(
              controller: userNameController,
              hintText: "Email Address",
              icon: Icon(Icons.email, size: 24.h),
            ),
            UserTextField(
              controller: userPwdController,
              hintText: "Password",
              obscureText: true,
              icon: Icon(Icons.lock, size: 24.h),
              suffixIcon: true,
            ),
            Container(
                height: 56.0.h,
                width: double.infinity,
                margin: EdgeInsets.only(top: 28.0.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(7.0.r)),
                    gradient: const LinearGradient(
                        colors: [Colors.lightBlueAccent, Colors.lightBlue])),
                child: ElevatedButton(
                    onPressed: () async {
                      showDialog(
                          context: context,
                          builder: (_) => loading,
                          barrierDismissible: false);
                      await Future.delayed(const Duration(seconds: 1));
                      SpUtils.setBool(AppConstants.spKeyLogin, true);
                      context.read<AppLoginStatusModel>().login = true;
                      AppRouter
                        ..pop(context)
                        ..pop(context);
                    },
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.transparent)),
                    child: Text("LOGIN",
                        style: TextStyle(
                            fontFamily: Font.quicksandMedium,
                            fontSize: 19.sp)))),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 35.0.h),
              child: Text(
                'Forgot password?',
                style: TextStyle(
                    fontSize: 17.0.sp,
                    fontFamily: Font.quicksandMedium,
                    decoration: TextDecoration.underline),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 28.0.h),
              child: Text.rich(
                TextSpan(text: "By continuing, you agree to ", children: [
                  const TextSpan(
                      text: 'Terms of Service',
                      style: TextStyle(decoration: TextDecoration.underline)),
                  const TextSpan(text: ' and '),
                  TextSpan(
                      recognizer: _gestureRecognizer..onTap = () {},
                      text: 'Privacy Policy',
                      style: const TextStyle(
                          decoration: TextDecoration.underline)),
                ]),
                textAlign: TextAlign.center,
                style: TextStyle(
                    height: 1.5,
                    fontSize: 15.0.sp,
                    color: const Color(0xFFb7b7b7),
                    fontFamily: Font.quicksandMedium),
              ),
            ),
            const Spacer(),
            Container(
              alignment: Alignment.center,
              child: Text('Not a part of a component yet?',
                  style: TextStyle(fontSize: 17.sp)),
            ),
            InkWell(
              onTap: () => {},
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(bottom: 54.0.h, top: 3.0.h),
                child: Text('Create a lidl account',
                    style: TextStyle(
                        fontSize: 17.sp,
                        color: const Color(0xFF0151aa),
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
