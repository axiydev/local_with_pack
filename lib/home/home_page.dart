import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _changeLocale(Locale? locale) {
    context.setLocale(locale!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SafeArea(
            child: Center(
              child: AnimatedSwitcher(
                duration: const Duration(seconds: 1),
                reverseDuration: const Duration(seconds: 1),
                switchInCurve: Curves.easeIn,
                switchOutCurve: Curves.ease,
                transitionBuilder: (child, animation) => RotationTransition(
                  turns: animation,
                  child: FadeTransition(
                      opacity: animation,
                      child: ScaleTransition(scale: animation, child: child)),
                ),
                child: Text(
                  tr('uncle'),
                  key: ValueKey<String>(tr('uncle')),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 15,
            left: 20,
            right: 20,
            child: SizedBox(
              height: 60,
              width: double.infinity,
              child: Row(
                children: [
                  LangButton(
                    text: 'English',
                    color: Colors.green,
                    callback: () => _changeLocale(const Locale('en', 'US')),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  LangButton(
                    text: 'Russian',
                    color: Colors.red,
                    callback: () => _changeLocale(const Locale('ru', 'RU')),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  LangButton(
                    text: 'Uzbek',
                    color: Colors.blue,
                    callback: () => _changeLocale(const Locale('uz', 'UZ')),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     ///   EasyLocalization.of(context)!

      //     context.setLocale(context.locale == const Locale('en', 'US')
      //         ? const Locale('uz', 'UZ')
      //         : const Locale('en', 'US'));
      //   },
      //   child: const Text('a'),
      // ),
    );
  }
}

class LangButton extends StatelessWidget {
  final Color? color;
  final String? text;
  final VoidCallback? callback;
  const LangButton({
    super.key,
    required this.color,
    required this.text,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 8,
      child: CupertinoButton(
          color: color,
          padding: EdgeInsets.zero,
          onPressed: callback,
          child: Text(text!)),
    );
  }
}
