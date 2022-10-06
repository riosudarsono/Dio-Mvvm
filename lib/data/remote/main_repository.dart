import 'package:retrofit/retrofit.dart';
import 'package:dio_mvvm/data/remote/episode_service.dart';
import 'package:dio_mvvm/data/remote/response/episode/episode_info.dart';
import 'package:dio_mvvm/data/remote/response/episode/episode_response.dart';

class MainRepository {
  final EpisodeService _episodeService;

  MainRepository(this._episodeService);

  Future<HttpResponse<EpisodeResponse>> getEpisodes(
    int page,
    Map<String, String>? options,
  ) => _episodeService.getEpisodes(page, options);

  Future<HttpResponse<EpisodeInfo>> getEpisode(int id) =>
      _episodeService.getEpisode(id);
}