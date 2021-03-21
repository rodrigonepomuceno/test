import 'package:challenge/shared/models/avatar_model.dart';
import 'package:challenge/shared/models/emoji_model.dart';
import 'package:challenge/shared/models/google_repos.dart';
import 'package:get/get.dart';

class ApiRepository extends GetConnect {
  Future<List<Emoji>> getEmojis() async {
    try {
      final String url = 'https://api.github.com/emojis';

      var response = await get(url);

      List<Emoji> listEmoji = [];

      if (response != null) {
        var _name = response.body.keys.toList();
        var _url = response.body.values.toList();
        for (var i = 0; i < _url.length; i++) {
          Emoji emoji = Emoji();
          emoji.id = i;
          emoji.name = _name[i].toString();
          emoji.url = _url[i].toString();
          listEmoji.add(emoji);
        }
      }
      return listEmoji;
    } catch (e) {
      print('Error load getEmojis');
      return null;
    }
  }

  Future<Avatar> getAvatar({String userName}) async {
    try {
      final String url = 'https://api.github.com/users/$userName';

      var response = await get(url);

      Avatar avatar = Avatar();

      if (response != null) {
        avatar.id = response.body['id'];
        avatar.login = response.body['login'].toString().toLowerCase();
        avatar.avatar_url = response.body['avatar_url'];
        avatar.name = response.body['name'];
      }
      return avatar;
    } catch (e) {
      print('Error load getAvatar');
      return null;
    }
  }

  Future<List<GoogleRepos>> getGoogleRepos({int page}) async {
    try {
      final String url = 'https://api.github.com/users/google/repos?page=$page';

      var response = await get(url);
      List<GoogleRepos> listGoogleRepos = [];

      if (response != null) {
        listGoogleRepos.addAll(response.body
            .map<GoogleRepos>((json) => GoogleRepos.fromJson(json))
            .toList());
      }
      return listGoogleRepos;
    } catch (e) {
      print('Error load getGoogleRepos');
      return null;
    }
  }
}
