import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class SignatureCanvas extends StatelessWidget {
  const SignatureCanvas({
    Key key,
    @required SignatureController signatureController,
  })  : _signatureController = signatureController,
        super(key: key);

  final SignatureController _signatureController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 300,
      padding: EdgeInsets.all(0),
      child: Signature(
        height: 190,
        width: 280,
        controller: _signatureController,
        backgroundColor: Colors.white,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.black,
        ),
        color: Colors.white,
      ),
    );
  }
}
