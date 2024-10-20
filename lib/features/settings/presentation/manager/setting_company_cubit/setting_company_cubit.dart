import '/features/settings/data/repository/company_info_repo.dart';
import '/features/settings/data/models/add_company_info.dart';
import '/features/settings/data/models/company_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'setting_company_state.dart';

class SettingCompanyCubit extends Cubit<SettingCompanyState> {
  final CompanyInfoRepo _companyInfoRepo;
  SettingCompanyCubit(this._companyInfoRepo) : super(SettingCompanyInitial());

  CompanyInfo companyInfoResult = CompanyInfo();

  Future<void> getCompanyInfo() async {
    emit(SettingCompanyLoading());
    final result = await _companyInfoRepo.getCompanyInfo();
    result.fold(
      (failures) => emit(SettingCompanyFailure(failures.errMessage)),
      (result) {
        companyInfoResult = result;
        emit(SettingCompanySuccess());
      },
    );
  }

  Future<void> updateCompanyInfo({
    required AddCompanyInfo companyInfo,
  }) async {
    emit(UpdateCompanyLoading());
    final result = await _companyInfoRepo.updateCompanyInfo(
      companyInfo: companyInfo,
    );
    result.fold(
      (failures) => emit(
        UpdateCompanyFailure(failures.errMessage),
      ),
      (result) {
        companyInfoResult = result;
        emit(UpdateCompanySuccess());
      },
    );
  }

  Future<void> addCompanyFile() async {
    emit(AddCompanyFileLoading());
    final result = await _companyInfoRepo.addCompanyFile();
    result.fold(
      (failures) => emit(
        AddCompanyFileFailure(failures.errMessage),
      ),
      (result) {
        companyInfoResult = result;
        emit(AddCompanyFileSuccess());
      },
    );
  }
}
