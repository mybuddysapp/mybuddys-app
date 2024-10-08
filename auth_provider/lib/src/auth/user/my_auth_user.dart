import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_auth_user.freezed.dart';
part 'my_auth_user.g.dart';

@freezed
class MyAuthUser with _$MyAuthUser {
  const factory MyAuthUser({
    required String id,
    required String email,
  }) = _MyAuthUser;

  factory MyAuthUser.fromJson(Map<String, Object?> json) =>
      _$MyAuthUserFromJson(json);

  // factory MyAuthUser.fromSupabaseSession(Session? session) => session == null
  //     ? empty
  //     : MyAuthUser(
  //         id: session.user.id,
  //         email: session.user.email ?? '',
  //       );

  static MyAuthUser empty = const MyAuthUser(
    id: '',
    email: '',
  );

  // static MyAuthUser? fromUser(models.User response) {
  //   if (response.$id.isEmpty) {
  //     return null;
  //   }
  //   return MyAuthUser(
  //     id: response.$id,
  //     email: response.email,
  //   );
  // }
}

extension UserX on MyAuthUser {
  bool get isEmpty => this == MyAuthUser.empty;
}
