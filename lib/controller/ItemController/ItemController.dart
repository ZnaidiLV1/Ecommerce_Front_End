import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontendproject/controller/refreshTokenController.dart';
import 'package:frontendproject/core/constant/ClientSingleton.dart';
import 'package:frontendproject/core/constant/Urls.dart';

Future<bool> toggleFavorite(
      int itemId, bool currentStatus, String email_user) async {
    try {
      if (!currentStatus) {
        final response = await HttpClientManager.client.post(
            Urls.create_favorite(),
            body: {"email": email_user, "item_id": itemId.toString()});
        if (response.statusCode == 200) {
          return !currentStatus;
        } else {
          throw Exception('Failed to update favorite status');
        }
      } else {
        final response = await HttpClientManager.client.delete(
            Urls.delete_favorite(),
            body: {"fav_item": itemId.toString()});
        if (response.statusCode == 200) {
          return !currentStatus;
        } else {
          throw Exception('Failed to update favorite status');
        }
      }
    } catch (e) {
      throw Exception('Failed to update favorite status: $e');
    }
  }

   String get_email_user(BuildContext context) {
    String email = "";
    final tokenBloc = context.read<TokenBloc>();
    if (tokenBloc.state is AccessToken) {
      String refresh = (tokenBloc.state as AccessToken).refreshToken;
      final jwt = JWT.decode(refresh);
      final payload = jwt.payload;
      email = payload["email"];
    }
    return email;
  }