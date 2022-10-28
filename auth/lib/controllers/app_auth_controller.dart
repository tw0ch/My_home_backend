import 'package:auth/models/response_model.dart';
import 'package:auth/models/user.dart';
import 'package:conduit/conduit.dart';

class AppAuthController extends ResourceController {
  final ManagedContext managedContext;

  AppAuthController(this.managedContext);

  @Operation.post()
  Future<Response> signIn(@Bind.body() User user) async {
    if (user.password==null || user.username == null) {
      return Response.badRequest(body: ResponseModel(
        message: "Поля password username обязательны"
      ));
    }
    
  final fetchedUser = User();
  
  // connect to DB
  // find user
  // check password
  // fetch user 

    return Response.ok(ResponseModel(data: {
      "id": fetchedUser.id,
      "refreshToken": fetchedUser.refreshToken,
      "accessToken": fetchedUser.accessToken,
    },
    message: "Успешная авторизация"
    ).toJson());
  }

  @Operation.put()
  Future<Response> signUp(@Bind.body() User user) async {
    if (user.password==null || user.username == null || user.email == null) {
      return Response.badRequest(body: ResponseModel(
        message: "Поля password username обязательны"
      ));
    }
    
  final fetchedUser = User();
  
  // connect to DB
  // create user
  // fetch user 

    return Response.ok(ResponseModel(data: {
      "id": fetchedUser.id,
      "refreshToken": fetchedUser.refreshToken,
      "accessToken": fetchedUser.accessToken,
    },
    message: "Успешная регистрация"
    ).toJson());
  }

  @Operation.post("refresh")
  Future<Response> refreshToken(@Bind.path("refresh") String refreshToken) async {
    final fetchedUser = User();

    // connect to db
    // find user 
    // check token 
    // fetch user 
    
    return Response.ok(ResponseModel(data: {
      "id": fetchedUser.id,
      "refreshToken": fetchedUser.refreshToken,
      "accessToken": fetchedUser.accessToken,
    },
    message: "Успешное обновление токенов"
    ).toJson());
  }
}