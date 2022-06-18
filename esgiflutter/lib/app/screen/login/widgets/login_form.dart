import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class LoginForm extends StatelessWidget {
  LoginForm({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/svg/sign-in.svg',
            height: 30.h,
          ),
          SizedBox(height: 10.h),
          TextFormField(
            decoration: const InputDecoration(
                labelText: 'Email', suffixIcon: Icon(Icons.email_outlined)),
            controller: _emailController,
          ),
          SizedBox(height: 3.h),
          TextFormField(
            decoration: const InputDecoration(
                labelText: 'Password', suffixIcon: Icon(Icons.visibility_off)),
            controller: _passwordController,
          ),
          SizedBox(height: 3.h),
          const ElevatedButton(onPressed: null, child: Text('Sign in')),
          SizedBox(height: 3.h),
          const TextButton(
              onPressed: null, child: Text("Don't have an account ? Sign up"))
        ],
      ),
    );
  }
}
