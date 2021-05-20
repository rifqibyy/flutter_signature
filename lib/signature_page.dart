import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class SignaturePage extends StatefulWidget {
  @override
  _SignaturePageState createState() => _SignaturePageState();
}

class _SignaturePageState extends State<SignaturePage> {
  final SignatureController _signatureController = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.black,
  );

  void _clearSignature() => _signatureController.clear();

  void _sendSignature() async {
    Uint8List _signatureBytes = await _signatureController.toPngBytes();
    String _signatuteBase64 = base64Encode(_signatureBytes);
    Clipboard.setData(ClipboardData(text: _signatuteBase64));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 200,
            width: 300,
            padding: EdgeInsets.all(0),
            child: Signature(
              height: 200,
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
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: _clearSignature,
                child: Text('Clear'),
              ),
              TextButton(
                onPressed: _sendSignature,
                child: Text('Submit'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
