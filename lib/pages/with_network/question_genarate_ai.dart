import 'package:programming_questions/core/widgets/app_bar.dart';
import 'package:programming_questions/core/theme/theme.dart';
import 'package:programming_questions/pages/error_page.dart';
import 'package:programming_questions/pages/home.dart';
import 'package:programming_questions/pages/with_network/network_provider.dart';
import '../../core/widgets/app_button.dart';
import '../../model/question_model.dart';

List<QuestionModel> result = [];

class QuestionGenerateAi extends StatefulWidget {
  const QuestionGenerateAi({super.key});

  @override
  State<QuestionGenerateAi> createState() => _QuestionGenerateAiState();
}

class _QuestionGenerateAiState extends State<QuestionGenerateAi> {
  late Future<List<QuestionModel>> _futureQuestions;
  int count = 0;
  final controller = ScrollController();
  bool last = false;

  @override
  void initState() {
    super.initState();
    _futureQuestions =
        Provider.of<NetworkStatus>(
          context,
          listen: false,
        ).generateContentWithGemini();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    final network = Provider.of<NetworkStatus>(context);

    // internet bor yoki yoqligi
    if (!network.hasConnection) {
      return const NoInternetPage();
    }

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      // floatingActionButton: const Column(
      //   children: [
      //     Spacer(),
      //
      //     SizedBox(height: 20),
      //   ],
      // ),

      appBar: appBar(context),
      backgroundColor: AppColors.backroundColor,
      body: SingleChildScrollView(
        controller: controller,
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: AppDimens.p8,
          child: FutureBuilder<List<QuestionModel>>(
            future: _futureQuestions,
            builder: (context, snapshot) {
              /// load
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(color: AppColors.white),
                );
              }
              // eroor
              else if (snapshot.hasError) {
                return Center(child: Text(" Error : ${snapshot.error}"));
              }
              else if (snapshot.hasData) {
                final result = snapshot.data!;

                if (result.length < 20) {
                  return const Center(
                    child: CircularProgressIndicator(color: AppColors.white),
                  );
                }

                int length = result.length;

                return Padding(
                  padding: AppDimens.p16,
                  child: Column(
                    children: [
                      LanguageTextWidget(
                        languageText: selectedLanguage.toUpperCase(),
                      ),

                      CountQuestionText(index: count + 1, length: length),
                      SizedBox(
                        height: AppDimens.d25,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            for (int i = 0; i < length; i++)
                              SmallQuestionCounter(index: count, i: i),
                          ],
                        ),
                      ),

                      appProvider.showLink
                          ? Padding(
                            padding: AppDimens.p4,
                            child: OutlinedButton(
                              onPressed: () => openUrl(result[count].infoLink),
                              child: const Text(
                                "Info",
                                style: AppTextStyle.infoButton,
                              ),
                            ),
                          )
                          : const SizedBox(height: 56),
                      ...result[count].variant.map((v) {
                        return last != true
                            ? Padding(
                          padding: AppDimens.p8,
                          child: SizedBox(
                            width: 300,
                            height: 100, // Uzun matn bo'lsa balandroq
                            child: OutlinedButton(
                              style: AppButtonStyle.selectButtonStyle,
                              onPressed: () {
                                setState(() {
                                  if (v == result[count].correctAnswer) {
                                    appProvider.correctAnswers++;
                                  } else {
                                    appProvider.wrong++;
                                  }
                                  count++;
                                  if (count >= result.length) {
                                    last = true;
                                    count = result.length - 1;
                                  }
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  v,
                                  style: AppTextStyle.questionsText,
                                  textAlign: TextAlign.center,
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                        )
                            : const SizedBox();
                      }).toList(),
                      const Align(alignment: Alignment.bottomCenter, child: ResultPageButton()),

                    ],
                  ),
                );
              } else {
                return const Center(child: Text("No results found"));
              }
            },
          ),
        ),
      ),
    );
  }
}
