import 'package:equatable/equatable.dart';
import 'package:mission_timer/src/clients/dio_clients.dart';

abstract class NetworkClient<T, Params> {
  Future<T> call(Params params);
  Future<bool> uploadFile(String path,
      {required String endpoint, required String field});
}

class NoParameters extends Equatable {
  @override
  List<Object> get props => [];
}
