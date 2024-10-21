abstract class SettingCompanyState {}

final class SettingCompanyInitial extends SettingCompanyState {}

final class SettingCompanyLoading extends SettingCompanyState {}

final class SettingCompanySuccess extends SettingCompanyState {}

final class SettingCompanyFailure extends SettingCompanyState {
  final String message;
  SettingCompanyFailure(this.message);
}

final class UpdateCompanyLoading extends SettingCompanyState {}

final class UpdateCompanySuccess extends SettingCompanyState {}

final class UpdateCompanyFailure extends SettingCompanyState {
  final String message;
  UpdateCompanyFailure(this.message);
}

final class CompanyFileLoading extends SettingCompanyState {}

final class CompanyFileSuccess extends SettingCompanyState {}

final class CompanyFileFailure extends SettingCompanyState {
  final String message;
  CompanyFileFailure(this.message);
}
