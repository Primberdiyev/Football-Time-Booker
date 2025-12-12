import 'package:auth/auth.dart';
import 'package:common_base/common_base.dart';

class CheckIsRegisteredUseCase extends UseCase<bool, EmptyUseCaseParams> {
  CheckIsRegisteredUseCase({required AuthRepository repository})
      : _repository = repository;

  final AuthRepository _repository;
  @override
  bool makeRequest(EmptyUseCaseParams params) => _repository.isRegistered();
}
