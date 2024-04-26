import "package:email_validator/email_validator.dart";
import "package:flutter/material.dart";
import "package:flutter_pw_validator/flutter_pw_validator.dart";
import "package:intl_phone_number_input/intl_phone_number_input.dart";

import "TurkishStrings.dart";

class PersonalInfos extends StatefulWidget {
  final PageStorageKey key;

  const PersonalInfos({required this.key});

  @override
  State<PersonalInfos> createState() => _PersonalInfosState();
}

class _PersonalInfosState extends State<PersonalInfos> {
  bool isPasswordObscured = true;
  bool isPasswordConfirmationObscured = true;

  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'TR');

  final FocusNode _focusNode1 = FocusNode();

  final _outerFormKey = GlobalKey<FormState>();
  final GlobalKey<FlutterPwValidatorState> validatorKey =
      GlobalKey<FlutterPwValidatorState>();

  final TextEditingController controller = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final TextEditingController adSoyadController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final TextEditingController tcNoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool _passwordsMatch = false;

    void _checkPasswords() {
      setState(() {
        if (_passwordController.text == _confirmPasswordController.text) {
          _passwordsMatch = true;
        } else {
          _passwordsMatch = false;
        }
      });
    }

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _outerFormKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: tcNoController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      errorStyle: TextStyle(color: Colors.red),
                      border: OutlineInputBorder(),
                      labelText: "TC NO giriniz",
                      hintText: "TC-NO"),
                  onSaved: (tcNo) {
                    tcNo = "";
                  },
                  validator: (tcNo) {
                    if (tcNo!.length != 11) {
                      return "TC NO 11 karakterden oluşmalıdır.";
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: adSoyadController,
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      errorStyle: TextStyle(color: Colors.red),
                      border: OutlineInputBorder(),
                      labelText: "Ad-Soyad",
                      hintText: "Tam Adınız"),
                  onSaved: (name) {},
                  validator: (name) {
                    if (name!.isEmpty) {
                      return "Bu alan boş olamaz";
                    }
                    String pattern = r'^[a-zA-ZüşçöÜŞÇİı\s]+$';
                    RegExp regex = RegExp(pattern);
                    if (!regex.hasMatch(name)) {
                      return 'Sadece harf ve boşluk kullanın';
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: emailController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      errorStyle: TextStyle(color: Colors.red),
                      border: OutlineInputBorder(),
                      labelText: "Email adresini giriniz",
                      hintText: "Email adresinizi giriniz"),
                  onSaved: (mailAdres) {},
                  validator: (mailAdres) {
                    if (!EmailValidator.validate(mailAdres!)) {
                      return "Geçerli formatta bir email adresi giriniz";
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _passwordController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  obscureText: isPasswordObscured,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isPasswordObscured = !isPasswordObscured;
                          });
                        },
                        icon: Icon(isPasswordObscured
                            ? Icons.visibility_off
                            : Icons.visibility)),
                    border: OutlineInputBorder(),
                    labelText: "Şifre",
                    hintText: "Şifrenizi giriniz",
                  ),
                  onSaved: (parola) {},
                  validator: (parola) {
                    if (parola!.isEmpty) {
                      return "Bu alan boş olamaz.";
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  focusNode: _focusNode1,
                  controller: _confirmPasswordController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  obscureText: isPasswordConfirmationObscured,
                  decoration: InputDecoration(
                      errorStyle: TextStyle(color: Colors.red),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isPasswordConfirmationObscured =
                                  !isPasswordConfirmationObscured;
                            });
                          },
                          icon: Icon(isPasswordConfirmationObscured
                              ? Icons.visibility_off
                              : Icons.visibility)),
                      border: OutlineInputBorder(),
                      labelText: "Şifrenizi Onaylayın",
                      hintText: "Şifrenizi tekrar giriniz",
                      errorText: _passwordController.text !=
                              _confirmPasswordController.text
                          ? "parolalar eşleşmiyor"
                          : null),
                  onSaved: (parola) {},
                  validator: (parola) {
                    if (parola!.isEmpty) {
                      return "Bu alan boş olamaz.";
                    }
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                new FlutterPwValidator(
                  strings: TurkishStrings(),
                  key: validatorKey,
                  controller: _passwordController,
                  minLength: 8,
                  uppercaseCharCount: 1,
                  lowercaseCharCount: 1,
                  numericCharCount: 1,
                  specialCharCount: 1,
                  normalCharCount: 4,
                  width: 400,
                  height: 200,
                  onSuccess: () {
                    print("kuvvetli parola");
                  },
                  onFail: () {
                    print("zayıf parola");
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                InternationalPhoneNumberInput(
                  onInputChanged: (PhoneNumber number) {
                    print(number.phoneNumber);
                  },
                  errorMessage: "Geçersiz telefon numarası",
                  onInputValidated: (bool value) {
                    print(value);
                  },
                  selectorConfig: SelectorConfig(
                    selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                    useBottomSheetSafeArea: true,
                  ),
                  ignoreBlank: false,
                  autoValidateMode: AutovalidateMode.disabled,
                  selectorTextStyle: TextStyle(color: Colors.black),
                  initialValue: number,
                  textFieldController: controller,
                  formatInput: true,
                  keyboardType: TextInputType.numberWithOptions(
                      signed: true, decimal: true),
                  inputBorder: OutlineInputBorder(),
                  onSaved: (PhoneNumber number) {
                    print('On Saved: $number');
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      bool _validate = _outerFormKey.currentState!.validate();
                      if (_validate) {
                        _outerFormKey.currentState!.save();

                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Center(
                              child: SingleChildScrollView(
                                child: AlertDialog(
                                  title: Text("Form Tamamlandı"),
                                  content: Column(
                                    children: [
                                      Text("TC-NO -> ${tcNoController.text}"),
                                      Text(
                                          "Ad-Soyad -> ${adSoyadController.text}"),
                                      Text("Email -> ${emailController.text}"),
                                      Text(
                                          "Şifre -> ${_passwordController.text}"),
                                      Text("TEL -> ${controller.text}"),
                                    ],
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("Tamam"),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                    child: Text("Formu Doğrula"))
              ]),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    adSoyadController.dispose();
    emailController.dispose();
    tcNoController.dispose();
  }
}
