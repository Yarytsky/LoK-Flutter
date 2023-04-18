import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_to_byte/image_to_byte.dart';
import 'package:lok/constants/colors.dart';
import 'package:lok/constants/userSave.dart';
import 'package:lok/constants/models/user.dart';
import 'package:lok/constants/services/lokApiManager.dart';

class BaseOvalImg extends StatefulWidget {
  final double width;
  final double height;
  final double borderWidth;
  const BaseOvalImg({Key? key,required this.width, required this.height,required this.borderWidth,}) : super(key: key);

  @override
  State<BaseOvalImg> createState() => _BaseOvalImgState();
}

class _BaseOvalImgState extends State<BaseOvalImg> {
  List<User> userInfo = MoviesApiService().userInfo;

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  void getUserInfo() async {
    var dio = Dio();
    var response = await dio.get(
      '${MoviesApiService().dio.options.baseUrl}/user/getuser/${userId}',
      options: Options(
          headers: {
            'Authorization' : 'Bearer $accesstoken',
          }
      ),
    );
    print(response.statusCode);
    final decoded = response.data['user'] as Map<String, dynamic>;
    final user = User.fromJson(decoded);
    setState(() {
      userInfo.add(user);
    });
    firstName = user.firstName;
    lastName = user.lastname;
    phone = user.normalizedUserName;
    email = user.email;
    gender = user.gender;
    country = user.country;
    photo = user.photo;
  }
  @override
  Widget build(BuildContext context) {
    return _buildGridView();
  }

  Widget _buildGridView() {
    if(userInfo.isEmpty){
      return Center(child: CircularProgressIndicator());
    } else{
      return FutureBulderAppBar(user: userInfo.first, width: widget.width,height: widget.height, borderWidth: widget.borderWidth,);
    }
  }
}

class FutureBulderAppBar extends StatelessWidget {
  const FutureBulderAppBar({Key? key, required this.user, required this.width, required this.height, required this.borderWidth}) : super(key: key);
  final User user;
  final double width;
  final double height;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

        Uint8List a(b){
          Uint8List bytesImage = const Base64Decoder().convert(b);
          return bytesImage;
        }

        Uint8List test() {
          if(photo == null){
            return a(b64);
          } else {
            return a(user.photo);
          }
        }

        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(90.0)),
            border: Border.all(width: borderWidth,color: AdditionalRed),
            color: Colors.redAccent,
          ),
          child: Image.memory(test(),
            fit: BoxFit.cover,
            scale: 1.0,
          ),
        );
      },
    );
  }
}
