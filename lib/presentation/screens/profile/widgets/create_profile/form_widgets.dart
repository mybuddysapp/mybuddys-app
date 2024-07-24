// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// // import 'package:form_builder_validators/form_builder_validators.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// Widget buildTextField({
//   required String key,
//   String? initialValue,
//   String? hintText,
//   bool isPassword = false,
//   Icon? prefixIcon,
//   Function()? onTap,
//   //controller is optional
//   required TextEditingController controller,
//   Icon? suffixIcon,
//   int? maxLines = 1,
//   List<FormFieldValidator<String>>? validators,
// }) {
//   return FormBuilderTextField(
//     // key: UniqueKey(),
//     onTap: onTap,
//     maxLines: maxLines,
//     name: key,
//     initialValue: initialValue,
//     obscureText: isPassword,
//     controller: controller,
//     style: TextStyle(
//       color: Colors.black,
//       letterSpacing: 2.0,
//       fontFamily: GoogleFonts.abel().fontFamily,
//       overflow: TextOverflow.ellipsis,
//       decoration: TextDecoration.none,
//     ),
//     decoration: MyInputDecoration(
//       hintText: hintText,
//       prefixIcon: prefixIcon,
//       suffixIcon: suffixIcon,
//     ),
//     // validator: FormBuilderValidators.compose(validators ?? []),
//   );
// }
//
// class MyInputDecoration extends InputDecoration {
//   final String? hintText;
//   final Icon? prefixIcon;
//   final Icon? suffixIcon;
//
//   MyInputDecoration({
//     this.hintText,
//     this.prefixIcon,
//     this.suffixIcon,
//   }) : super(
//           contentPadding:
//               const EdgeInsets.symmetric(horizontal: 6.0, vertical: 1.0),
//           labelStyle: const TextStyle(color: Colors.teal),
//           floatingLabelAlignment: FloatingLabelAlignment.start,
//           floatingLabelBehavior: FloatingLabelBehavior.auto,
//           floatingLabelStyle: const TextStyle(color: Colors.teal),
//           prefixIconColor: Colors.grey[600],
//           prefixIcon: prefixIcon,
//           suffixIcon: suffixIcon,
//           suffixIconColor: Colors.grey[600],
//           filled: true,
//           fillColor: Colors.grey[200],
//           hintText: hintText,
//           hintStyle: const TextStyle(color: Colors.grey),
//           helperMaxLines: 3,
//           errorMaxLines: 3,
//           border: InputBorder.none,
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(16),
//             borderSide: const BorderSide(color: Colors.transparent),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(16),
//             borderSide: const BorderSide(color: Colors.transparent),
//           ),
//           errorBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(16),
//             borderSide: const BorderSide(color: Colors.red),
//           ),
//           focusedErrorBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(16),
//             borderSide: const BorderSide(color: Colors.red),
//           ),
//         );
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildTextField({
  required String key,
  String? initialValue,
  String? hintText,
  bool isPassword = false,
  Icon? prefixIcon,
  Function()? onTap,
  Function(String)? onSubmitted,
  required TextEditingController controller,
  Icon? suffixIcon,
  int? maxLines = 1,
  // String? Function(String?)? validator,
  List<String? Function(String?)>? validators,
}) {
  return TextFormField(
    key: ValueKey(key),
    onTap: onTap,
    onFieldSubmitted: onSubmitted,
    maxLines: maxLines,
    initialValue: initialValue,
    obscureText: isPassword,
    controller: controller,
    style: MyTextStyle(),
    // decoration: InputDecoration(
    //   // labelText: labelText,
    //   filled: true,
    //   fillColor: Colors.grey[200],
    //   border: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(16),
    //     borderSide: BorderSide.none,
    //   ),
    //   errorBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(16),
    //     borderSide: BorderSide(color: Colors.red),
    //   ),
    //   focusedErrorBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(16),
    //     borderSide: BorderSide(color: Colors.red),
    //   ),
    //   prefixIcon: prefixIcon,
    //   prefixIconColor: Colors.grey[600],
    // ),
    decoration: MyInputDecoration(
      hintText: hintText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
    ),
    // validator: validator,
    validator: (value) {
      if (validators != null) {
        for (var validator in validators) {
          final result = validator(value);
          if (result != null) return result;
        }
      }
      return null;
    },
  );
}

class MyTextStyle extends TextStyle {
  MyTextStyle()
      : super(
          color: Colors.black,
          letterSpacing: 2.0,
          fontFamily: GoogleFonts.abel().fontFamily,
          overflow: TextOverflow.ellipsis,
          decoration: TextDecoration.none,
        );
}


class MyInputDecoration extends InputDecoration {
  final String? hintText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;

  MyInputDecoration({
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 6.0, vertical: 6.0),
          labelStyle: const TextStyle(color: Colors.teal),
          floatingLabelAlignment: FloatingLabelAlignment.start,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          floatingLabelStyle: const TextStyle(color: Colors.teal),
          prefixIconColor: Colors.grey[600],
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          suffixIconColor: Colors.grey[600],
          filled: true,
          fillColor: Colors.grey[200],
          hintText: hintText,
          hintStyle: MyTextStyle(),
          helperMaxLines: 3,
          errorMaxLines: 3,
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.red),
          ),
        );
}
