import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/widget/modal.dart';
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
              showDialog(
                context: context,
                builder: (_) {
                  return Modal(
                    title: '로그아웃 하시겠습니까?',
                    description: '현재 계정에서 로그아웃됩니다.',
                    leftText: '취소',
                    rightText: '로그아웃',
                    onLeft: () {
                      Navigator.pop(context);
                    },
                    onRight: () {
                      Navigator.pop(context);

                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(const SnackBar(content: Text('로그아웃 완료')));
                    },

                    /// 필요하면 content 추가
                    content: const Text(
                      '추가 컨텐츠 영역',
                      textAlign: TextAlign.center,
                    ),
                  );
                },
              );
            },
            child: const Text('모달 열기'),
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
