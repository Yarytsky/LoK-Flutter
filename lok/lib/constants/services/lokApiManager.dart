import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:lok/App/MainPage.dart';
import 'package:lok/App/Proposal.dart';
import 'package:lok/L&R/Login.dart';
import 'package:lok/constants/colors.dart';
import 'package:lok/constants/models/proposal.dart';
import 'package:lok/constants/models/subject.dart';
import 'package:lok/constants/models/user.dart';
class MoviesApiService {
  final dio = Dio();
  late User movies;
  late Proposall anaconda;
  List<User> userInfo = [];


  MoviesApiService() {
    dio.options.baseUrl = 'https://localhost:7203';
  }

  Future<List<Subject>> getSubjects() async {
    var dio = Dio();
    var response = await dio.get(
      '${MoviesApiService().dio.options.baseUrl}/subject/getsubjectforstudent/${userId}',
      options: Options(
          headers: {
            'Authorization' : 'Bearer $accesstoken',
          }
      ),
    );
    print(response.statusCode);
    return parseMovies(response);
  }

  Future<List<Proposall>> getProposal() async {
    var dio = Dio();
    var response = await dio.get(
      '${MoviesApiService().dio.options.baseUrl}/proposal/getproposals',
      options: Options(
          headers: {
            'Authorization' : 'Bearer $accesstoken',
          }
      ),
    );
    print(response.statusCode);
    return parseProposal(response);
  }

  Future<List<Subject>> getSubject(subjectId) async {
    var dio = Dio();
    var response = await dio.get(
      '${MoviesApiService().dio.options.baseUrl}/subject/getsubjectbyid/${subjectId}',
      options: Options(
          headers: {
            'Authorization' : 'Bearer $accesstoken',
          }
      ),
    );
    print(response.statusCode);
    return parseMovie(response);
  }

  List<Subject> parseMovies(dynamic response) {
    final results = List<Map<String, dynamic>>.from(response.data['subjects']);
    List<Subject> movies =
    results.map((movieData) => Subject.fromJson(movieData)).toList(growable: false);
    return movies;
  }

  List<Subject> parseMovie(dynamic response) {
    final results = List<Map<String, dynamic>>.from(response.data['subject']);
    List<Subject> movies =
    results.map((movieData) => Subject.fromJson(movieData)).toList(growable: false);
    return movies;
  }

  List<Proposall> parseProposal(dynamic response) {
    final results = List<Map<String, dynamic>>.from(response.data['proposals']);
    List<Proposall> anaconda = results.map((e) => Proposall.fromJson(e)).toList(growable: true);
    return anaconda;
  }
}
