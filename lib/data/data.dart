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

  NoteDb(){
    dio.options=BaseOptions(
      baseUrl: url.baseUrl,
      responseType: ResponseType.plain
    );
  }

 @override
Future<NoteModel?> createNote(NoteModel value) async {
  try {

    print("$value from data.dart");
    final _result = await dio.post( url.addNote,
        data: value.toJson());

    var _resultAsJson=jsonDecode(_result.data);
    return NoteModel.fromJson(_resultAsJson);

  } on DioException catch (e) {
    print(e.response?.data);
    print(e);
    return null;
  } catch (e) {
    print(e.toString());
    return null;
  }
}


  @override
  Future<void> deleteNote(String id) async {
    // TODO: implement deleteNote
    throw UnimplementedError();
  }

  @override
  Future<List<NoteModel>> getAllNote() async {
    final _result =await dio.get(url.baseUrl + url.getAllNote);


    if(_result.data!=null){
      final _resultAsJson= jsonDecode(_result.data);
      final getNoteResp=GetAllNotesResp.fromJson(_resultAsJson);
      print("getNoteResp=5======================");
      print(getNoteResp);
      print("getNoteResp=5======================");
      return getNoteResp.data;
    }else{
      print('result.data================');
      print(_result.data);
      print('result.data================');
    return _result.data;
  }}

  @override
  Future<NoteModel?> updateNote(NoteModel value) async {
    // TODO: implement updateNote
    throw UnimplementedError();
  }
}
