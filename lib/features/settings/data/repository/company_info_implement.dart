import 'package:project_management/core/utils/pick_file.dart';
import '/features/settings/data/models/add_company_info.dart';
import '/features/settings/data/models/company_info.dart';
import '/core/constant/api_end_point.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'company_info_repo.dart';
import 'package:uuid/uuid.dart';
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
          String generatId = const Uuid().v1();

          final List<MultipartFile> companyFiles = result
              .map((file) => MultipartFile.fromFileSync(
                    file,
                    filename: "$generatId-${basename(file)}",
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
}
