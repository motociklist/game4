import '../models/question.dart';

class QuestionsData {
  static List<Question> getAllQuestions() {
    return [
      // Математика
      Question(
        question: 'Чему равно 15 × 7?',
        options: ['95', '105', '110', '100'],
        correctAnswerIndex: 1,
        subject: Subject.mathematics,
      ),
      Question(
        question: 'Чему равен квадратный корень из 144?',
        options: ['10', '11', '12', '13'],
        correctAnswerIndex: 2,
        subject: Subject.mathematics,
      ),
      Question(
        question: 'Чему равно 2³?',
        options: ['4', '6', '8', '10'],
        correctAnswerIndex: 2,
        subject: Subject.mathematics,
      ),
      Question(
        question: 'Чему равно 25% от 200?',
        options: ['40', '50', '60', '75'],
        correctAnswerIndex: 1,
        subject: Subject.mathematics,
      ),
      Question(
        question: 'Чему равна сумма углов треугольника?',
        options: ['160°', '180°', '200°', '360°'],
        correctAnswerIndex: 1,
        subject: Subject.mathematics,
      ),
      Question(
        question: 'Чему равно 3² + 4²?',
        options: ['20', '25', '30', '35'],
        correctAnswerIndex: 1,
        subject: Subject.mathematics,
      ),
      Question(
        question: 'Чему равно 100 ÷ 4?',
        options: ['20', '25', '30', '35'],
        correctAnswerIndex: 1,
        subject: Subject.mathematics,
      ),
      Question(
        question: 'Чему равно 5! (факториал)?',
        options: ['100', '120', '150', '200'],
        correctAnswerIndex: 1,
        subject: Subject.mathematics,
      ),

      // Физика
      Question(
        question: 'Какова скорость света в вакууме?',
        options: ['300,000 км/с', '150,000 км/с', '450,000 км/с', '600,000 км/с'],
        correctAnswerIndex: 0,
        subject: Subject.physics,
      ),
      Question(
        question: 'Что измеряется в ньютонах?',
        options: ['Масса', 'Сила', 'Энергия', 'Мощность'],
        correctAnswerIndex: 1,
        subject: Subject.physics,
      ),
      Question(
        question: 'Какая формула для кинетической энергии?',
        options: ['E = mc²', 'E = ½mv²', 'E = mgh', 'E = Fd'],
        correctAnswerIndex: 1,
        subject: Subject.physics,
      ),
      Question(
        question: 'Что такое ускорение свободного падения на Земле?',
        options: ['8.9 м/с²', '9.8 м/с²', '10.2 м/с²', '11.5 м/с²'],
        correctAnswerIndex: 1,
        subject: Subject.physics,
      ),
      Question(
        question: 'В каких единицах измеряется электрическое напряжение?',
        options: ['Амперы', 'Вольты', 'Омы', 'Ватты'],
        correctAnswerIndex: 1,
        subject: Subject.physics,
      ),
      Question(
        question: 'Что такое закон сохранения энергии?',
        options: [
          'Энергия не может быть создана или уничтожена',
          'Энергия всегда увеличивается',
          'Энергия всегда уменьшается',
          'Энергия не существует'
        ],
        correctAnswerIndex: 0,
        subject: Subject.physics,
      ),
      Question(
        question: 'Какая частица имеет положительный заряд?',
        options: ['Электрон', 'Протон', 'Нейтрон', 'Фотон'],
        correctAnswerIndex: 1,
        subject: Subject.physics,
      ),
      Question(
        question: 'Что измеряется в джоулях?',
        options: ['Сила', 'Энергия', 'Мощность', 'Напряжение'],
        correctAnswerIndex: 1,
        subject: Subject.physics,
      ),

      // Химия
      Question(
        question: 'Какая формула воды?',
        options: ['H₂O', 'CO₂', 'O₂', 'H₂O₂'],
        correctAnswerIndex: 0,
        subject: Subject.chemistry,
      ),
      Question(
        question: 'Какой химический элемент имеет символ Na?',
        options: ['Неон', 'Натрий', 'Никель', 'Азот'],
        correctAnswerIndex: 1,
        subject: Subject.chemistry,
      ),
      Question(
        question: 'Какая формула углекислого газа?',
        options: ['CO', 'CO₂', 'C₂O', 'C₃O₂'],
        correctAnswerIndex: 1,
        subject: Subject.chemistry,
      ),
      Question(
        question: 'Какой pH у чистой воды?',
        options: ['5', '6', '7', '8'],
        correctAnswerIndex: 2,
        subject: Subject.chemistry,
      ),
      Question(
        question: 'Сколько атомов водорода в молекуле метана (CH₄)?',
        options: ['2', '3', '4', '5'],
        correctAnswerIndex: 2,
        subject: Subject.chemistry,
      ),
      Question(
        question: 'Что такое периодическая таблица?',
        options: [
          'Таблица умножения',
          'Таблица химических элементов',
          'Таблица физических констант',
          'Таблица математических формул'
        ],
        correctAnswerIndex: 1,
        subject: Subject.chemistry,
      ),
      Question(
        question: 'Какой газ составляет большую часть атмосферы Земли?',
        options: ['Кислород', 'Азот', 'Углекислый газ', 'Водород'],
        correctAnswerIndex: 1,
        subject: Subject.chemistry,
      ),
      Question(
        question: 'Что происходит при окислении?',
        options: [
          'Потеря электронов',
          'Получение электронов',
          'Потеря протонов',
          'Получение протонов'
        ],
        correctAnswerIndex: 0,
        subject: Subject.chemistry,
      ),
    ];
  }

  static List<Question> getShuffledQuestions() {
    final questions = getAllQuestions();
    questions.shuffle();
    return questions;
  }
}

