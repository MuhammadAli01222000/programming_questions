import 'package:programming_questions/core/theme/theme.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backroundColor,
      body: Padding(
        padding: AppDimens.p25,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text(
                "${AppLocalizations.of(context)?.networkError}",
                style: AppTextStyle.networkError,

              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  context.pop();
                },
                child:  Text("${AppLocalizations.of(context)?.reload}"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
