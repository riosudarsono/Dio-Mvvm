import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio_mvvm/data/remote/main_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:dio_mvvm/data/model/episode_dto.dart';
import 'package:dio_mvvm/di/dio/data_state.dart';
import 'package:dio_mvvm/data/core/use_case.dart';
import 'package:dio_mvvm/di/dio/dio_exception.dart';
import 'package:dio_mvvm/data/model/episode_dto_extension.dart';

class GetEpisodes
    implements UseCase<DataState<List<EpisodeDto>>, GetEpisodesParams> {
  final MainRepository _episodeRepository;

  GetEpisodes(this._episodeRepository);

  @override
  Future<DataState<List<EpisodeDto>>> call(
      {required GetEpisodesParams params}) async {
    try {
      final httpResponse = await _episodeRepository.getEpisodes(
        params.page,
        params.options,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.results.toEpisodeDtoList());
      }
      return DataFailed(httpResponse.response.statusMessage);
    } on DioError catch (e) {
      final errorMessage = DioException.fromDioError(e).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      return DataFailed(errorMessage);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return DataFailed(e.toString());
    }
  }
}

class GetEpisodesParams {
  final int page;
  final Map<String, String>? options;

  GetEpisodesParams(this.page, this.options);
}
