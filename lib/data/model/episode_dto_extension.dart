import 'package:dio_mvvm/data/model/episode_dto.dart';
import 'package:dio_mvvm/data/remote/response/episode/episode_info.dart';

extension EpisodeInfoExtension on EpisodeInfo {
  EpisodeDto toEpisodeDto() {
    return EpisodeDto(id, name, url, airDate, created, episode, characters);
  }
}

extension EpisodeInfoListExtension on List<EpisodeInfo>? {
  List<EpisodeDto> toEpisodeDtoList() {
    if (this != null || this!.isNotEmpty) {
      return this!.map((e) => e.toEpisodeDto()).toList();
    }
    return List.empty();
  }
}
