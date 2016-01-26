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
    result = ["This", "is", "a", "basic", "example"]
    assert_equal @tk.tokenize('This is a basic example'), result
  end

  def test_commas
    result = ["This", "is","a", "basic", "example","you","know"]
    assert_equal @tk.tokenize('This , is ,a basic example, you know'), result
  end

  def test_other_commas
    result = ["This", "is","a", "basic", "example","you","know"]
    assert_equal @tk.tokenize('This: is ,a basic example; you know'), result
  end

  def test_interrogation
    result = ["This", "It", "is","a", "basic", "example","No","space"]
    assert_equal @tk.tokenize('This? It is ? a basic example?No space?'), result
  end

  def test_mixed_punctuation
    result = ["This", "It", "is","a", "basic", "example","No","space"]
    assert_equal @tk.tokenize('This: It is a basic example;No space?!!'), result
  end

  def test_puncts
    result = ["This", "It","is", "a", "basic", "example"]
    assert_equal @tk.tokenize('This. It is a basic example.'), result
  end

  def test_guion
    result = ["I", "am", "Marxist-Leninist", "not", "stalinist", "since", "I", "was", "a", "kid"]
    assert_equal @tk.tokenize('I am Marxist-Leninist -not stalinist- since I was a kid'), result
  end

  def test_contractions
    result = ["He", "is" ,"who", "is", "I", "am","what", "is", "Robert\'s"]
    assert_equal @tk.tokenize('He\'s who\'s I\'m what\'s Robert\'s'), result
  end
end
