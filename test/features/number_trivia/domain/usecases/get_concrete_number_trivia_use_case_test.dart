import 'package:clean_arch_tutorial/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_arch_tutorial/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:clean_arch_tutorial/features/number_trivia/domain/usecases/get_concrete_number_trivia_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  MockNumberTriviaRepository mockNumberTriviaRepository;
  GetConcreteNumberTrivia usecase;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  });

  final int tNumber = 1;
  final NumberTrivia tNumberTrivia = NumberTrivia(text: 'test', number: 1);

  test('should return a concrete number trivia', () async {
    // arrange
    when(mockNumberTriviaRepository.getConcreteNumberTrivia(any))
        .thenAnswer((realInvocation) async => Right(tNumberTrivia));
    // act
    final result = await usecase(number: tNumber);

    // assert
    expect(result, Right(tNumberTrivia));

    // Verify that the method has been called on the Repository
    verify(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber));
    // Only the above method should be called and nothing more.
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}
