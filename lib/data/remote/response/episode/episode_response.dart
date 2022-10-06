import 'package:dio_mvvm/data/remote/response/episode/page_info.dart';
import 'package:dio_mvvm/data/remote/response/episode/episode_info.dart';

class EpisodeResponse {
  PageInfo? info;
  List<EpisodeInfo>? results;

  EpisodeResponse({this.info, this.results});

  EpisodeResponse.fromJson(dynamic json) {
    info = json['info'] != null ? PageInfo.fromJson(json['info']) : null;
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(EpisodeInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (info != null) {
      map['info'] = info?.toJson();
    }
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
