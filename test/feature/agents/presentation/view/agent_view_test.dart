import 'package:bloc_test/bloc_test.dart';
import 'package:etiya_case/feature/agent/presentation/bloc/agents_bloc.dart';
import 'package:etiya_case/feature/agent/presentation/view/agent_view.dart';
import 'package:etiya_case/product/failure/failure.dart';
import 'package:etiya_case/product/widgets/animation/custom_loading_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAgentsBloc extends MockBloc<AgentsEvent, AgentsState> implements AgentsBloc {}

void main() {
  late MockAgentsBloc bloc;

  setUp(() {
    bloc = MockAgentsBloc();
  });

  Widget pumpApp(Widget body) {
    return BlocProvider<AgentsBloc>(
      create: (context) => bloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets(
    'should show Center and CustomLoadingAnimation when state is AgentsInitial()',
    (WidgetTester tester) async {
      when(() => bloc.state).thenReturn(AgentsInitial());

      await tester.pumpWidget(
        pumpApp(
          const AgentViewBody(),
        ),
      );

      expect(find.byType(Center), equals(findsOneWidget));
      expect(find.byType(CustomLoadingAnimation), equals(findsOneWidget));
    },
  );

  testWidgets(
    'should show Center and CustomLoadingAnimation when state is AgentsLoading()',
    (WidgetTester tester) async {
      when(() => bloc.state).thenReturn(AgentsLoading());

      await tester.pumpWidget(
        pumpApp(
          const AgentViewBody(),
        ),
      );

      expect(find.byType(Center), equals(findsOneWidget));
      expect(find.byType(CustomLoadingAnimation), equals(findsOneWidget));
    },
  );

  testWidgets(
    'should show widget AgentsLoaded when state is AgentsLoaded()',
    (WidgetTester tester) async {
      when(() => bloc.state).thenReturn(const AgentsLoaded());

      await tester.pumpWidget(
        pumpApp(
          const AgentViewBody(),
        ),
      );

      expect(find.byType(AgentsLoadedWidget), equals(findsOneWidget));
    },
  );

  testWidgets(
    'should show widget AgentsFailureWidget when state is AgentsFailure()',
    (WidgetTester tester) async {
      when(() => bloc.state).thenReturn(AgentsFailure(DioFailure()));

      await tester.pumpWidget(
        pumpApp(
          const AgentViewBody(),
        ),
      );

      expect(find.byType(AgentsFailureWidget), equals(findsOneWidget));
    },
  );
}
