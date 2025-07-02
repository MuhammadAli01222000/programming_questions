import 'dart:ui';
import 'package:programming_questions/core/theme/theme.dart';
import 'package:programming_questions/pages/with_network/question_genarate_ai.dart';

import '../core/widgets/glass.dart';
import '../core/widgets/glass_card.dart';
List listCorrect=[];
List <QuestionModel?>listWrong=[];
class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
final _wrongListController=ScrollController();
final _correctListController=ScrollController();
@override
  void dispose() {
    super.dispose();
    _wrongListController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    int result = appProvider.correctAnswers * 5;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurpleAccent,
        child: const Icon(Icons.home, color: AppColors.white),
        onPressed: () {
          /// screen da clear qilish
          appProvider.reset();
          context.goNamed(AppRouteName.splash);
        },
      ),
      backgroundColor: AppColors.backroundColor,
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0f2027), Color(0xFF203a43), Color(0xFF2c5364)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 50),

                GlassCard(text: "${AppLocalizations.of(context)?.result} $result%"),
                const SizedBox(height: 40),
                GlassButton(
                  text: "${AppLocalizations.of(context)?.correct} ${appProvider.correctAnswers}",
                  color: Colors.green,
                ),
                const SizedBox(height: 20),
                GlassButton(
                  text: "${AppLocalizations.of(context)?.wrong} ${appProvider.wrong}",
                  color: Colors.red,
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    appProvider.correctAnswers = 0;
                    appProvider.wrong = 0;
                    context.pushNamed(AppRouteName.questionsWithAi);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.blue,Colors.red, ],
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                        tileMode: TileMode.repeated,
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    width: 395,
                    height: 50,
                    child:  Center(
                      child: Text(
                        "${AppLocalizations.of(context)?.withAi}",
                        style: AppTextStyle.languageText,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppDimens.h20,
                            const Text("❌ Wrong answers:", style: TextStyle(color: Colors.red, fontSize: 16)),
                            const SizedBox(height: 8),
                            Expanded(
                              child: ListView.builder(
                                controller: _wrongListController,
                                itemCount: listWrong.length,
                                itemBuilder: (context, index) {
                                  return Text(
                                    '${index + 1}. ${listWrong[index]?.question}',
                                    style: const TextStyle(color: Colors.white, fontSize: 16),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16), // Space between columns
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
