require 'minitest/autorun'
require 'tokenator'

class TokenatorTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Tokenator::VERSION
  end

  def setup
    @tk = Tokenator.new
    @options = { :remove_punctuation => true }
  end

  def test_basic_case
    expected = ["This", "is", "a", "basic", "example"]
    assert_equal expected, @tk.tokenize('This is a basic example')
  end

  def test_commas
    expected = ["This", "is","a", "basic", "example","you","know"]
    assert_equal @tk.tokenize('This , is ,a basic example, you know'), expected
  end

  def test_other_commas
    expected = ["This", "is","a", "basic", "example","you","know"]
    assert_equal @tk.tokenize('This: is ,a basic example; you know'), expected
  end

  def test_interrogation
    expected = ["This", "It", "is","a", "basic", "example","No","space"]
    assert_equal @tk.tokenize('This? It is ? a basic example?No space?'), expected
  end

  def test_mixed_punctuation
    expected = ["This", "It", "is","a", "basic", "example","No","space"]
    assert_equal @tk.tokenize('This: It is a basic example;No space?!!'), expected
  end

  def test_puncts
    expected = ["This", "It","is", "a", "basic", "example"]
    assert_equal @tk.tokenize('This. It is a basic example.'), expected
  end

  def test_guion
    expected = ["I", "am", "Marxist-Leninist", "not", "stalinist", "since", "I", "was", "a", "kid"]
    assert_equal @tk.tokenize('I am Marxist-Leninist -not stalinist- since I was a kid'), expected
  end

  def test_contractions
    expected = ["He", "is" ,"who", "is", "I", "am","what", "is", "Robert\'s"]
    assert_equal expected, @tk.tokenize('He\'s who\'s I\'m what\'s Robert\'s')
  end

  def test_quotes
    expected = ["a", "car"]
    assert_equal expected, @tk.tokenize('a "car"')
  end
end
