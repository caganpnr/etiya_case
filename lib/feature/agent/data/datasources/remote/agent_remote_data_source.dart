import 'package:dio/dio.dart';
import 'package:etiya_case/core/manager/network/network_manager.dart';
import 'package:etiya_case/feature/agent/data/models/agent/agent_model.dart';
import 'package:etiya_case/product/constants/api_constants.dart';
import 'package:etiya_case/product/exceptions/api_exceptions.dart';

class AgentRemoteDataSource {
  /// Interacts with the Valorant Api for getting data
  AgentRemoteDataSource({required NetworkManager networkManager}) : _networkManager = networkManager;

  final NetworkManager _networkManager;

  /// Fetches the list of agents from the api
  Future<List<AgentModel>> fetchAgents() async {
    try {
      final response = await _networkManager.get<Map<String, dynamic>>(
        ApiConstants.agents,
        queryParameters: {'isPlayableCharacter': true},
      );
      final model = response.data?['data'] as List?;
      if (model == null) {
        // throw NullResponseException in case of null data
        throw NullResponseException();
      } else {
        return model.map((e) => AgentModel.fromJson(e as Map<String, dynamic>)).toList();
      }
    } on DioException catch (e) {
      // throw DioException in case of DioException
      throw DioException(requestOptions: e.requestOptions, message: e.message);
    } catch (_) {
      // throw UnknownException if its not defined exception
      throw UnknownException();
    }
  }
}
