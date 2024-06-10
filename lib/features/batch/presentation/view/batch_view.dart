import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/features/batch/domain/entity/batch_entity.dart';
import 'package:student_management_starter/features/batch/presentation/viewmodel/batch_view_model.dart';

class BatchView extends ConsumerStatefulWidget {
  const BatchView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BatchViewState();
}

class _BatchViewState extends ConsumerState<BatchView> {
  // final _formKey = GlobalKey<FormState>();
  final _batchNameController = TextEditingController();

  final gap = const SizedBox(height: 20);

  @override
  Widget build(BuildContext context) {
    var batchState = ref.watch(batchViewModelProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                'Add Batch',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              gap,
              TextField(
                controller: _batchNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Batch Name',
                ),
              ),
              const SizedBox(
                height: 20,
                width: double.infinity,
              ),
              ElevatedButton(
                onPressed: () {
                  // Add batch adding logic here
                  ref
                      .read(batchViewModelProvider.notifier)
                      .addBatch(BatchEntity(
                        batchName: _batchNameController.text,
                      ));
                },
                child: const Text('Add Batch'),
              ),
              const SizedBox(height: 16),
              const Text(
                'List of Batches',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              gap,
              if (batchState.isLoading) ...{
                const Center(
                  child: CircularProgressIndicator(),
                ),
              } else if (batchState.error != null) ...{
                Text(
                  batchState.error.toString(),
                ),
              } else if (batchState.lstBatches.isEmpty) ...{
                const Text('No Batches Found'),
              } else ...{
                Expanded(
                  child: ListView.builder(
                    itemCount: batchState.lstBatches.length,
                    itemBuilder: (context, index) {
                      var batch = batchState.lstBatches[index];
                      return ListTile(
                        title: Text(batch.batchName),
                        subtitle: Text(batch.batchId ?? ''),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete,
                          ),
                          onPressed: () {
                            ref
                                .read(batchViewModelProvider.notifier)
                                .deleteBatch(
                                  batchState.lstBatches[index],
                                );
                          },
                        ),
                      );
                    },
                  ),
                ),
              }
              // Add logic to display list of batches here
            ],
          ),
        ),
      ),
    );
  }
}
