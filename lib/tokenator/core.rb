# encoding: utf-8
# Tokenization based on the tokenizer developed by
# Robert Macyntyre in 1995 for the Penn Treebank
# project. This tokenizer mostly follows the conventions
# used by the Penn Treebank.
# Modified from the sript written by Utiyama Masao (mutiyama@nict.go.jp).

class PTB

  # Default options for the tokenizer.
  DefaultOptions = {
    remove_punctuation: true
  }

  def tokenize(string, options = {})
    options = DefaultOptions.merge(options)

    s = " " + string + " "
    # Transforms every quote to single quote
    #s.gsub!(/[`‘’“”"]/, "'")
    #Preserves acronyms deleting puncts
    s.gsub!(/((\w\.){2,})/) {$1.gsub!(/\./,'')}

    s.gsub!(/ (([A-Z]\.){2,}) /,' ')
    s.gsub!(/\w\./)
    s.gsub!(/\s+/, ' ')
    s.gsub!(/(\s+)''/, '\1"')
    s.gsub!(/(\s+)``/, '\1"')
    s.gsub!(/''(\s+)/, '"\1')
    s.gsub!(/``(\s+)/, '"\1')
    s.gsub!(/ (['`]+)([^0-9].+) /, ' \1 \2 ')
    s.gsub!(/([ (\[{<])"/, '\1 `` ')
    s.gsub!(/\.\.\./, ' ... ')
    s.gsub!(/[,;:@\#$%&]/, ' \& ')
    s.gsub!(/([^.])([.])([\])}>"']*)[   ]*$/, '\1 \2\3 ')
    s.gsub!(/[?!]/, ' \& ')
    s.gsub!(/[\]\[(){}<>]/, ' \& ')
    s.gsub!(/--/, ' -- ')
    s.sub!(/$/, ' ')
    s.sub!(/^/, ' ')
    s.gsub!(/'ll /, ' will ')
    s.gsub!(/'re /, ' are ')
    s.gsub!(/'ve /, ' have ')
    s.gsub!(/n't /, ' not ')
    s.gsub!(/'LL /, ' WILL ')
    s.gsub!(/'RE /, ' ARE ')
    s.gsub!(/'VE /, ' HAVE ')
    s.gsub!(/N'T /, ' NOT ')
    s.gsub!(/ ([Cc])annot /, ' \1an not ')
    s.gsub!(/ ([Ii])'m /, ' \1 am ')
    s.gsub!(/ ([Hh]|[Ss]h)e's /, ' \1e is ')
    s.gsub!(/ ([Ii])t's /, ' \1t is ')
    s.gsub!(/ ([Ww](hat|ho))'s/, ' \1 is')
    s.gsub!(/ ([Dd])idn't /, ' \1id not ')
    s.gsub!(/ ([Dd])'ye /, ' \1\' ye ')
    s.gsub!(/ ([Gg])imme /, ' \1ive me ')
    s.gsub!(/ ([Gg])onna /, ' \1oing to ')
    s.gsub!(/ ([Gg])otta /, ' \1ot to ')
    s.gsub!(/ ([Ll])emme /, ' \1et me ')
    s.gsub!(/ ([Mm])ore'n /, ' \1ore \'n ')
    s.gsub!(/ '([Tt])is /, ' \'\1 is ')
    s.gsub!(/ '([Tt])was /, ' \'\1 was ')
    s.gsub!(/ ([Ww])anna /, ' \1ant to ')

    while s.sub!(/(\s)([0-9]+) , ([0-9]+)(\s)/, '\1\2,\3\4'); end
    s.gsub!(/\//, ' / ')
    s.gsub!(/\s+/, ' ')
    s.strip!
    # Remove directional quotes.
    if options[:remove_punctuation]
      s.gsub!(/ [-:;?!]/, ' ')
      s.gsub!(/ , /, ' ')
      s.gsub!(/ '(\w+)' /, ' \1 ')
      s.gsub!(/([a-zA-Z]+)\./, '\1 ')
      s.gsub!(/\.\.\./, '')
      s.gsub!(/ \./, ' ')
      s.gsub!(/- /, ' ')
      s.gsub!(/["`'][^\w]/, ' ')
      s.gsub!(/"$/, ' ')
    end
    s.split(/\s+/)
  end

end

