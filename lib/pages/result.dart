import 'dart:ui';
import 'package:programming_questions/core/theme/theme.dart';
import 'package:programming_questions/pages/with_network/question_genarate_ai.dart';

import '../core/widgets/glass.dart';
import '../core/widgets/glass_card.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    int result = appProvider.correctAnswers * 5;

    return Scaffold(
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
                const Spacer(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    backgroundColor: Colors.deepPurpleAccent,
                    child: const Icon(Icons.home, color: AppColors.white),
                    onPressed: () {
                      /// screen da clear qilish
                      appProvider.reset();

                    context.goNamed(AppRouteName.splash);
                    },
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
