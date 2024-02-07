import '/flutter_flow/flutter_flow_util.dart';
import 'edit_profile_widget.dart' show EditProfileWidget;
import 'package:flutter/material.dart';

class EditProfileModel extends FlutterFlowModel<EditProfileWidget> {
  ///  Local state fields for this page.

  DateTime? dob;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameController;
  String? Function(BuildContext, String?)? nameControllerValidator;
  String? _nameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'sewuq6ez' /* Name is required */,
      );
    }

    return null;
  }

  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  // State field(s) for phonenumber widget.
  FocusNode? phonenumberFocusNode;
  TextEditingController? phonenumberController;
  String? Function(BuildContext, String?)? phonenumberControllerValidator;
  DateTime? datePicked;
  // State field(s) for address widget.
  FocusNode? addressFocusNode;
  TextEditingController? addressController;
  String? Function(BuildContext, String?)? addressControllerValidator;
  String? _addressControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'qqnardpe' /* Address is required */,
      );
    }

    return null;
  }

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    nameControllerValidator = _nameControllerValidator;
    addressControllerValidator = _addressControllerValidator;
  }

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameController?.dispose();

    emailFocusNode?.dispose();
    emailController?.dispose();

    phonenumberFocusNode?.dispose();
    phonenumberController?.dispose();

    addressFocusNode?.dispose();
    addressController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
