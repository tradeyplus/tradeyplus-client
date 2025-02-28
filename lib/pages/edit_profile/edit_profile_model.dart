import '/flutter_flow/flutter_flow_util.dart';
import 'edit_profile_widget.dart' show EditProfileWidget;
import 'package:flutter/material.dart';

class EditProfileModel extends FlutterFlowModel<EditProfileWidget> {
  ///  Local state fields for this page.

  DateTime? dob;

  bool isChanged = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for name widget.
  FocusNode? nameFocusNode1;
  TextEditingController? nameTextController1;
  String? Function(BuildContext, String?)? nameTextController1Validator;
  String? _nameTextController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'sewuq6ez' /* Name is required */,
      );
    }

    return null;
  }

  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for phonenumber widget.
  FocusNode? phonenumberFocusNode;
  TextEditingController? phonenumberTextController;
  String? Function(BuildContext, String?)? phonenumberTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for name widget.
  FocusNode? nameFocusNode2;
  TextEditingController? nameTextController2;
  String? Function(BuildContext, String?)? nameTextController2Validator;
  // State field(s) for address widget.
  FocusNode? addressFocusNode;
  TextEditingController? addressTextController;
  String? Function(BuildContext, String?)? addressTextControllerValidator;
  String? _addressTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'qqnardpe' /* Address is required */,
      );
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    nameTextController1Validator = _nameTextController1Validator;
    addressTextControllerValidator = _addressTextControllerValidator;
  }

  @override
  void dispose() {
    nameFocusNode1?.dispose();
    nameTextController1?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    phonenumberFocusNode?.dispose();
    phonenumberTextController?.dispose();

    nameFocusNode2?.dispose();
    nameTextController2?.dispose();

    addressFocusNode?.dispose();
    addressTextController?.dispose();
  }
}
