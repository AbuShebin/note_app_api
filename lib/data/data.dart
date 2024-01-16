import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:note_app_api/data/get_all_notes_resp/get_all_notes_resp.dart';
import 'package:note_app_api/data/note_model/note_model.dart';
import 'package:note_app_api/data/url.dart';

abstract class Apicalls {
  Future<NoteModel?> createNote(NoteModel value);
  Future<List<NoteModel?>> getAllNote();
  Future<NoteModel?> updateNote(NoteModel value);
  Future<void> deleteNote(String id);
}

class NoteDb extends Apicalls {
  final Dio dio = Dio();
  final Url url = Url();

 @override
Future<NoteModel?> createNote(NoteModel value) async {
  try {
    print("$value from data.dart");
    final _result = await dio.post(url.baseUrl + url.addNote, data: value.toJson());
    var _resultAsJson=jsonDecode(_result.data);
    return NoteModel.fromJson(_resultAsJson);

  } on DioException catch (e) {
    if (e.response != null) {
      // The server responded with a non-200 status code.
      print('DioError response: ${e.response}');
      print('DioError response data: ${e.response?.data}');
    } else {
      // Something else went wrong.
      print('DioError: $e');
    }
  } catch (e) {
    print(e.toString());
  }
}


  @override
  Future<void> deleteNote(String id) async {
    // TODO: implement deleteNote
    throw UnimplementedError();
  }

  @override
  Future<List<NoteModel>> getAllNote() async {
    final _result =await dio.get<GetAllNotesResp>(url.baseUrl + url.getAllNote);
    if(_result.data==null){
      return [];
    }else{
    return _result.data!.data;
  }}

  @override
  Future<NoteModel?> updateNote(NoteModel value) async {
    // TODO: implement updateNote
    throw UnimplementedError();
  }
}
