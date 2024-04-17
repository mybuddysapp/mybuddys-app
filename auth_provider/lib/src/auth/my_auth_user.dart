import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'my_auth_user.freezed.dart';
part 'my_auth_user.g.dart';

@freezed
class MyAuthUser with _$MyAuthUser {
  const factory MyAuthUser({
    required String uid,
    required String email,
    String? displayName,
    String? photoUrl,
  }) = _MyAuthUser;

  factory MyAuthUser.fromJson(Map<String, Object?> json) =>
      _$MyAuthUserFromJson(json);

  factory MyAuthUser.fromSession(Session? session) => session == null
      ? empty
      : MyAuthUser(
    uid: session.user.id,
    email: session.user.email ?? '',
    displayName: session.user.userMetadata?['name'],
    photoUrl: session.user.userMetadata?['avatar_url'],
  );

  static MyAuthUser empty = const MyAuthUser(
    uid: '',
    email: '',
  );
}

extension UserX on MyAuthUser {
  bool get isEmpty => this == MyAuthUser.empty;
}
