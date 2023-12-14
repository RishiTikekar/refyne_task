import 'package:flutter/material.dart';
import 'package:testassign/constants/enums.dart';
import 'package:testassign/feature/respository_screen/models/repository_model.dart';
import 'package:testassign/feature/respository_screen/repo/repository_repo.dart';
import 'package:testassign/utils/pvd_helper_mixin.dart';
import 'package:testassign/utils/utility_methods.dart';

class RepoListPvd with ChangeNotifier, StateNotifier {
  final RepositoriesRepo _repo = RepositoriesRepo();

  RepoListPvd() {
    init();
  }

  List<RepositoryModel> repositories = [];

  Future<void> init() async {
    try {
      currentState = States.loading;

      final responseList = await _repo.getRepositoryList();

      if (UtilityMethod.isValidList(responseList)) {
        responseList?.take(10).forEach((response) {
          repositories.add(RepositoryModel.fromMap(response));
        });

        currentState = States.success;
      } else {
        currentState = States.empty;
      }
    } catch (err) {
      currentState = States.error;
    }
  }
}
