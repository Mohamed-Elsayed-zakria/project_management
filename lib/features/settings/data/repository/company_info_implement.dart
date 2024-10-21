import '/features/settings/data/models/company_info/company_info.dart';
import '/features/settings/data/models/add_company_info.dart';
import '/core/constant/api_end_point.dart';
import '/core/errors/failures.dart';
import '/core/utils/pick_file.dart';
import 'package:dartz/dartz.dart';
import 'company_info_repo.dart';
import 'package:path/path.dart';
import 'package:dio/dio.dart';

class CompanyInfoImplement extends CompanyInfoRepo {
  @override
  Future<Either<Failures, CompanyInfo>> getCompanyInfo() async {
    try {
      const String url = "${APIEndPoint.url}${APIEndPoint.companyInfo}";
      final response = await dio.get(url);
      final session = response.data["data"];
      CompanyInfo companyData = CompanyInfo.fromJson(session);
      return right(companyData);
    } catch (e) {
      return left(returnDioException(e));
    }
  }

  @override
  Future<Either<Failures, CompanyInfo>> updateCompanyInfo({
    required AddCompanyInfo companyInfo,
  }) async {
    try {
      const String url = "${APIEndPoint.url}${APIEndPoint.companyInfo}";
      final response = await dio.put(
        url,
        data: companyInfo.toJson(),
      );
      final session = response.data["data"];
      CompanyInfo companyData = CompanyInfo.fromJson(session);
      return right(companyData);
    } catch (e) {
      return left(returnDioException(e));
    }
  }

  @override
  Future<Either<Failures, CompanyInfo>> addCompanyFile() async {
    Either<Failures, List<String>> pickFileResult =
        await PickFile.pickMultiple();
    return pickFileResult.fold(
      (failures) => left(failures),
      (result) async {
        try {
          const String url =
              "${APIEndPoint.url}${APIEndPoint.companyInfo}/${APIEndPoint.addCompanyFiles}";
          final List<MultipartFile> companyFiles = result
              .map((file) => MultipartFile.fromFileSync(
                    file,
                    filename: basename(file),
                  ))
              .toList();

          final formData = FormData.fromMap({
            "companyFiles": companyFiles,
          });

          final response = await dio.post(
            url,
            data: formData,
          );
          final session = response.data["data"];
          CompanyInfo companyData = CompanyInfo.fromJson(session);
          return right(companyData);
        } catch (e) {
          return left(returnDioException(e));
        }
      },
    );
  }

  @override
  Future<Either<Failures, void>> deleteCompanyFile({
    required String fileId,
  }) async {
    try {
      String url = "${APIEndPoint.url}${APIEndPoint.companyInfo}/$fileId";
      await dio.delete(url);
      return right(null);
    } catch (e) {
      return left(returnDioException(e));
    }
  }
}
