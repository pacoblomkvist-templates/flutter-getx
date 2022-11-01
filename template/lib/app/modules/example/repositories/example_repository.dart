import 'package:template/app/common/base/base_api_repository.dart';

import '../models/example_model.dart';

class ExampleRepository extends BaseApiRepository {
  ExampleRepository();

  Future<ExampleModel> getExample() async {
    // var result = await apiService.get(endpoint: "example");
    await Future.delayed(Duration(seconds: 5));
    return ExampleModel('Example');
  }
}
