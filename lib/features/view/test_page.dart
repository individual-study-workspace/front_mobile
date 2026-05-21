import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/widget/common_bottom_sheet.dart';
import '../test/provider/test_provider.dart';

class TestPage extends ConsumerWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(testControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Quiz Test")),
      body: Column(
        children: [
          //여기에 만든 위젯
          ElevatedButton(
            onPressed: () {
              CommonBottomSheet.show(
                context,

                title: '타이틀',

                /// 위 가변 영역
                topContent: const Text('추가 영역 1'),

                /// 아래 가변 영역
                bottomContent: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 52,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Text('추가 영역 2'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                /// 공통 버튼
                buttonText: '버튼',
                onButtonTap: () {
                  Navigator.pop(context);
                },
              );
            },
            child: const Text('바텀시트 열기'),
          ),
          Expanded(
            child: state.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text(e.toString())),
              data: (quiz) {
                if (quiz == null) {
                  return const Center(child: Text("버튼 눌러서 노래 가져오기"));
                }

                return ListView.builder(
                  itemCount: quiz.lyricsKoLines.length,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.all(4),
                      child: Text(quiz.lyricsKoLines[i]),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(testControllerProvider.notifier).fetchRandom();
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
