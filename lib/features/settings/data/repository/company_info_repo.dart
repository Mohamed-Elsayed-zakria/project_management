import '/features/settings/data/models/company_info/company_info.dart';
import '/features/settings/data/models/add_company_info.dart';
import '/core/services/base_service.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class CompanyInfoRepo extends BaseServices {
  Future<Either<Failures, CompanyInfo>> getCompanyInfo();
  Future<Either<Failures, CompanyInfo>> updateCompanyInfo({
    required AddCompanyInfo companyInfo,
  });
  Future<Either<Failures, CompanyInfo>> addCompanyFile();
  Future<Either<Failures, void>> deleteCompanyFile({
    required String fileId,
  });
}
