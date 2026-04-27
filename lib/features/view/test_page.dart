import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_mobile/common/widget/common_search_bar.dart';

import '../../common/widget/chat_text_field.dart';
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
          ChatTextField(),
          CommonSearchBar(),
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
