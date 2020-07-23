import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_package/widgets/custom_scaffold.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Validate Scaffold creation', (WidgetTester tester) async {
    var simpleContainer = Container();
    var scaffoldTitle = "Custom Scaffold";
    var customScaffold = CustomScaffold(
      title: scaffoldTitle,
      body: simpleContainer,
    );
    var appWrapper = TestableAppWrapper(
      childHome: customScaffold,
    );
    await tester.pumpWidget(appWrapper);

    expect(find.text(scaffoldTitle), findsOneWidget);
    expect(find.byType(Container), findsOneWidget);
  });
}

class TestableAppWrapper extends StatelessWidget {
  final Widget childHome;

  const TestableAppWrapper({Key key, this.childHome}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: childHome,
    );
  }
}
