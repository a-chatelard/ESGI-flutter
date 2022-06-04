import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign in')),
      body: Padding(
        padding: const EdgeInsets.all(35),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/svg/sign-in.svg', height: 30.h,),
            SizedBox(height: 10.h),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
                suffixIcon: Icon(Icons.email_outlined)
              ),
            ),
            SizedBox(height: 3.h),
            TextFormField(
              decoration: const InputDecoration(
                  labelText: 'Password',
                  suffixIcon: Icon(Icons.visibility_off)
              ),
            ),
            SizedBox(height: 3.h),
            const ElevatedButton(onPressed: null, child: Text('Sign in')),
            SizedBox(height: 3.h),
            const TextButton(onPressed: null, child: Text("Don't have an account ? Sign up"))

          ],

        ),
      ),
    );
  }
}
