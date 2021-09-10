import 'dart:developer';

import 'package:tmdb_app/constants/app_constants.dart';
import 'package:tmdb_app/pages/home_page.dart';
import 'package:tmdb_app/utils/size_config.dart';
import 'package:tmdb_app/widgets/app_button.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: must_be_immutable
class LoginPage extends ConsumerWidget {
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  SizeConfig _sizeConfig = SizeConfig();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    _sizeConfig.context = context;
    return Scaffold(
      backgroundColor: AppConstants.colors.primaryColor,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Login",
          style: TextStyle(
            color: AppConstants.colors.secondaryColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppConstants.colors.primaryColor,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(
          new FocusNode(),
        ),
        child: SizedBox(
          height: _sizeConfig.height,
          width: _sizeConfig.width,
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: AppConstants.colors.secondaryColor,
                          ),
                        ),
                        labelText: "Username",
                        prefixIcon: Icon(
                          Icons.person,
                          color: AppConstants.colors.secondaryColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: AppConstants.colors.secondaryColor,
                          ),
                        ),
                        labelText: "Password",
                        prefixIcon: Icon(
                          Icons.lock,
                          color: AppConstants.colors.secondaryColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      AppButton(
                        onPressed: () {},
                        text: "Sign Up",
                        color: AppConstants.colors.primaryColor,
                        borderColor: AppConstants.colors.secondaryColor,
                        textColor: AppConstants.colors.secondaryColor,
                      ),
                      AppButton(
                        onPressed: () {},
                        text: "Login",
                        color: AppConstants.colors.secondaryColor,
                        borderColor: AppConstants.colors.secondaryColor,
                        textColor: AppConstants.colors.primaryColor,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
