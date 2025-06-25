import 'package:programming_questions/core/theme/theme.dart';

class ResultPageButton extends StatelessWidget {
  const ResultPageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          context.goNamed( AppRouteName.result);
        },
        style: ButtonStyle(
          backgroundColor: const WidgetStatePropertyAll(AppColors.green),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimens.d12),
            ),
          ),
        ),
        child:  Center(
          child: Text('${AppLocalizations.of(context)?.result}', style: AppTextStyle.languageText),
        ),
      ),
    );
  }
}
