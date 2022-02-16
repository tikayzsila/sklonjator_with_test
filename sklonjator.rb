class Sklonjator
  # Статический метод sklonenie возвращает правильную форму слова, когда нужно
  # его использовать с числом. Например во фразах, типа «1 крокодил»,
  # «7 крокодилов».
  def self.sklonenie(number, krokodil, krokodila, krokodilov, with_number = false)
    number = 0 if number.nil? || !number.is_a?(Numeric)
    prefix = ""
    prefix = "#{number}" if with_number
    # Чтобы исправить баг и заработали тесты, надо раскомментировать
    # этот код.
    #
    return "#{prefix}#{krokodilov}" if (number % 100).between?(11, 14)

    ostatok = number % 10

    return "#{prefix}#{krokodil}" if ostatok == 1

    return "#{prefix}#{krokodila}" if ostatok.between?(2, 4)

    return "#{prefix}#{krokodilov}" if ostatok.between?(5, 9) || ostatok.zero?
  end
end