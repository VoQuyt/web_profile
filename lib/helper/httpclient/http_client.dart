import 'dart:async';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:convert';

import 'domain.dart';
import 'response.dart';

class AcceptType {
  static String json = 'application/json; charset=UTF-8';
  static String formData = 'multipart/form-data';
  static String urlEncode = 'application/x-www-form-urlencoded';
}

final Map<String, String> defaultHeader = {
  'Accept': "*/*",
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers':
      'Origin, Content-Type, Accept, Authorization, X-Request-With',
};

final Map<String, String> encodeHeader = {
  'Accept': AcceptType.json,
  'Content-Type': AcceptType.urlEncode,
};

final Map<String, String> postHeader = {
  'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
};

final Map<String, String> formHeader = {
  'Accept': AcceptType.formData,
  'Content-Type': AcceptType.formData,
};

class HttpClient {
  static const int timeOutEx = 20;
  late Map<String, String> headers;
  late Map<String, String> config;
  late int timeOut;
  late String _urlRequest;
  String? userToken;
  bool useLoading;

  HttpClient({
    required String route,
    this.useLoading = false,
    int? timeOut,
    String? url,
    String? userToken,
    bool? isEncode,
  }) {
    _urlRequest = url ?? '${Domain.baseUrl}$route';
    this.userToken = userToken ?? '';
    Map<String, String> authHeader = {
      'Authorization': 'Bearer ' + this.userToken!
    };
    config = {};
    headers = {
      ...defaultHeader,
      ...authHeader,
    };
    this.timeOut = timeOut ?? timeOutEx;
  }

  String get messageErrorDefault => 'Đã xảy ra lỗi, vui lòng thử lại!';

  Future<QAResponse?> _run(
      {required dynamic dataField, required TypeRequest type}) async {
    try {
      html.HttpRequest response;
      //debugPrint(_urlRequest);
      switch (type) {
        case TypeRequest.get:
          {
            response =
                await html.HttpRequest.request(_urlRequest, method: 'GET')
                    .timeout(Duration(seconds: timeOut));
            break;
          }
        case TypeRequest.post:
          {
            response = await html.HttpRequest.request(_urlRequest,
                    method: 'POST',
                    sendData: (dataField).body,
                    requestHeaders: postHeader)
                .timeout(Duration(seconds: timeOut));
            break;
          }
        case TypeRequest.put:
          {
            response = await html.HttpRequest.request(_urlRequest,
                    method: 'PUT',
                    sendData: (dataField as _FieldsPost).body,
                    requestHeaders: postHeader)
                .timeout(Duration(seconds: timeOut));
            break;
          }
        case TypeRequest.delete:
          {
            response = await html.HttpRequest.request(_urlRequest,
                    method: 'DELETE',
                    sendData: (dataField as _FieldsPost).body,
                    requestHeaders: postHeader)
                .timeout(Duration(seconds: timeOut));
            break;
          }
        // case TypeRequest.formData:
        //   {
        //     response = await http.HttpRequest.postFormData(
        //             _urlRequest, (dataField as _FieldsFormData).fields ?? {})
        //         .timeout(Duration(seconds: timeOut));
        //     break;
        //   }
        // case TypeRequest.formSingleData:
        //   {
        //     response = await http.HttpRequest.postFormData(
        //             _urlRequest, (dataField as _FieldsFormSingleData).fields ?? {})
        //         .timeout(Duration(seconds: timeOut));
        //     break;
        //   }
      }
      if (this.useLoading) {
        /*
          TODO: HEADLE WIDGET LOADDING
        */
        //Loading.hide();
      }

      final myResponse = jsonDecode(response.responseText ?? '{}');
      if (response.status! >= QAResponse.success && response.status! <= 299) {
        return Future.value(
          QAResponse(
            statusCode: response.status!,
            data: myResponse,
          ),
        );
      }
      throw QAException(
        error: QAResponse(
          statusCode: response.status!,
          data: myResponse,
          message: QAResponse.checkMessage(response.status!),
        ),
      );
    } on TimeoutException catch (_) {
      throw QAException(
        error: QAResponse(
          statusCode: QAResponse.requestTimeout,
          message: 'Time out exception!',
        ),
      );
    } on Error catch (e) {
      throw QAException(
        error: QAResponse(
          statusCode: QAResponse.errorServer,
          message: e.toString(),
        ),
      );
    }
  }

  Future<QAResponse?> get({Map<String, String>? query}) {
    return _run(dataField: _FieldsGet(query: query), type: TypeRequest.get);
  }

  Future<QAResponse?> post({String? body}) {
    return _run(
      dataField: _FieldsPost(body: body),
      type: TypeRequest.post,
    );
  }

  Future<QAResponse?> put({String? body}) {
    return _run(
      dataField: _FieldsPost(body: body),
      type: TypeRequest.put,
    );
  }

  Future<QAResponse?> delete({String? body}) {
    return _run(
      dataField: _FieldsPost(body: body),
      type: TypeRequest.delete,
    );
  }

  // Future<QAResponse?> postFormData({
  //   String? url,
  //   String? subUrl,
  //   required List<http.MultipartFile> files,
  //   Map<String, String>? fields,
  // }) {
  //   return this._run(
  //       dataField: new _FieldsFormData(files: files, fields: fields),
  //       type: TypeRequest.formData);
  // }

  // Future<QAResponse?> postFormSingleData({
  //   String? url,
  //   String? subUrl,
  //   required http.MultipartFile file,
  //   Map<String, String>? fields,
  // }) {
  //   return this._run(
  //       dataField: new _FieldsFormSingleData(file: file, fields: fields),
  //       type: TypeRequest.formSingleData);
  // }
}

enum TypeRequest {
  get,
  post,
  put,
  delete, /*formData, formSingleData*/
}

abstract class _Fields {
  dynamic get data;
}

class _FieldsGet extends _Fields {
  final Map<String, String>? query;
  _FieldsGet({required this.query});

  @override
  get data => query;
}

class _FieldsPost extends _Fields {
  final Object? body;
  final Map<String, String>? headers;
  _FieldsPost({this.body, this.headers});

  @override
  get data => body;
}

// class _FieldsFormData extends _Fields {
//   final List<http.MultipartFile> files;
//   final Map<String, String>? fields;

//   _FieldsFormData({required this.files, this.fields});

//   @override
//   get data => {
//         'files': files.map((e) => e.filename).toList(),
//         'fields': fields,
//       };
// }

// class _FieldsFormSingleData extends _Fields {
//   final http.MultipartFile file;
//   final Map<String, String>? fields;

//   _FieldsFormSingleData({required this.file, this.fields});

//   @override
//   get data => {
//         'file': file.filename,
//         'field': fields,
//       };
// }
