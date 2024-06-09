import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/core/failure/failure.dart';
import 'package:student_management_starter/core/networking/local/hive_service.dart';
import 'package:student_management_starter/features/batch/data/model/batch_hive_model.dart';
import 'package:student_management_starter/features/batch/domain/entity/batch_entity.dart';

final batchLocalDataSourceProvider = Provider((ref) => BatchLocalDataSource(
      hiveService: ref.read(hiveServiceProvider),
      batchHiveModel: ref.read(batchHiveModelProvider),
    ));

class BatchLocalDataSource {
  final HiveService hiveService;
  final BatchHiveModel batchHiveModel;

  BatchLocalDataSource({
    required this.hiveService,
    required this.batchHiveModel,
  });

  Future<Either<Failure, bool>> addBatch(BatchEntity batch) async {
    try {
      final hiveBatch = batchHiveModel.fromEntity(batch);

      await hiveService.addBatch(hiveBatch);
      return const Right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  Future<Either<Failure, List<BatchEntity>>> getAllBatches() async {
    try {
      final hiveBatches = await hiveService.getAllBatches();

      final batches = batchHiveModel.toEntityList(hiveBatches);
      return Right(batches);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }
}
