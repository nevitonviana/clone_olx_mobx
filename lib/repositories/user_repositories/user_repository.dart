import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '/models/user/user.dart';
import '/repositories/parse_errors/parse_errors.dart';
import '/repositories/table_keys.dart';

class UserSignUpRepositories {
  Future<User?> signUp({required User user}) async {
    final parseUser = ParseUser(user.email, user.password, user.email);
    parseUser.set<String?>(keyUserName, user.name);
    parseUser.set<String?>(keyUserPhone, user.phone);
    parseUser.set(keyUserType, user.type!.index);

    final response = await parseUser.signUp();
    if (response.success) {
      return mapParseToUser(parseUser);
    } else {
      return Future.error(
          ParseErrors.getDescription(response.error!.code).toString());
    }
  }

  User mapParseToUser(ParseUser parseUser) {
    return User(
      id: parseUser.objectId,
      name: parseUser.get(keyUserName),
      phone: parseUser.get(keyUserPhone),
      email: parseUser.get(keyUserEmail),
      type: UserType.values[parseUser.get(keyUserType)],
      createdAt: parseUser.get(keyUserCreatedAt),
    );
  }

  Future<User> loginWithToUser(
      {required String email, required String password}) async {
    final parseUser = ParseUser(email, password, null);
    final response = await parseUser.login();

    if (response.success) {
      return mapParseToUser(parseUser);
    } else {
      return Future.error(
          ParseErrors.getDescription(response.error!.code).toString());
    }
  }

  Future<User?> currentUser() async {
    final parseUser = await ParseUser.currentUser();
    if (parseUser != null) {
      final response =
          await ParseUser.getCurrentUserFromServer(parseUser.sessionToken);
      if (response!.success) {
        return mapParseToUser(response.result);
      } else {
        await parseUser.logout();
      }
    } else {
      return null;
    }
  }

  Future<void> save(User user) async {
    final ParseUser parserUSer = await ParseUser.currentUser();
    if (parserUSer != null) {
      parserUSer.set<String>(keyUserName, user.name!);
      parserUSer.set<String>(keyUserPhone, user.phone!);
      parserUSer.set<int>(keyUserType, user.type!.index);
      if (user.password != null) {
        parserUSer.password = user.password;
      }
    }

    final response = await parserUSer.save();
    if (!response.success)
      return Future.error(
          ParseErrors.getDescription(response.error!.code).toString());

    if (user.password != null) {
      await parserUSer.logout();
      final loginResponse =
          await ParseUser(user.email, user.password, user.email).login();

      if (!loginResponse.success)
        return Future.error(
            ParseErrors.getDescription(response.error!.code).toString());
    }
  }
}
