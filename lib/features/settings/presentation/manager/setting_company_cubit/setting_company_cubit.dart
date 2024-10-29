import '/features/settings/data/models/company_info/company_info.dart';
import '/features/settings/data/repository/company_info_repo.dart';
import '/features/settings/data/models/add_company_info.dart';
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
    emit(CompanyFileLoading());
    final result = await _companyInfoRepo.addCompanyFile();
    result.fold(
      (failures) => emit(
        CompanyFileFailure(failures.errMessage),
      ),
      (result) {
        companyInfoResult = result;
        emit(CompanyFileSuccess());
      },
    );
  }

  Future<void> deleteCompanyFile({
    required String fileId,
  }) async {
    emit(CompanyFileLoading());
    final result = await _companyInfoRepo.deleteCompanyFile(
      fileId: fileId,
    );
    result.fold(
      (failures) => emit(
        CompanyFileFailure(failures.errMessage),
      ),
      (result) {
        companyInfoResult.companyFiles
            ?.removeWhere((element) => element.id == fileId);
        emit(CompanyFileSuccess());
      },
    );
  }

  String removeDateFromFileName(String? fileName) {
    String modifiedFileName = '';
    if (fileName == null) {
      return modifiedFileName;
    }
    try {
      modifiedFileName = fileName.replaceFirst(
        RegExp(r'^\d{4}-\d{2}-\d{2}T\d{2}-\d{2}-\d{2}\.\d{3}Z-'),
        '',
      );
      return modifiedFileName;
    } catch (e) {
      return modifiedFileName;
    }
  }
}
