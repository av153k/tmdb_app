import 'package:tmdb_app/models/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authBloc = StateNotifierProvider(
  (ref) => AuthBloc(
    User(id: -1),
  ),
);

class AuthBloc extends StateNotifier<User> {
  AuthBloc(User user) : super(user);

  login() async {}
}
