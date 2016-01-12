# hangman game
# there must be a word or phrase 
# there are blank spaces for a word or a phrase 
  # my phrase I love Ruby 
# should show _  _ _ _ _  _ _ _ _ 
# guess a letter 
# if it's right, put the letter in the blank space where it "fits"
# if it's wrong, start adding body parts to the hanging corpse

# Ruby is an object-oriented language
# Objects are like nouns: objects are in a class 

class HangmanGame
  
  def initialize 
    @guesses = []
    @bad_guesses = 0
  end
  
  def phrase
    "I love Ruby"  # You put things in quotes to signify that its a series of characters 
  end
  
  def display(letter)
    collection = phrase.split('').map do |character|
      if @guesses.include?(character.downcase)
        character
      elsif character != ' '
         '_'
      else
         ' '
      end   
    end
    puts noose
    collection.join
  end
  
  def guess(letter)
    @guesses << letter.downcase
    unless phrase.include?(letter.downcase)
    @bad_guesses = @bad_guesses + 1  
    end
    # if I guess 'e', it should put 'e' in the appropriate space
    # and display the result 
    display(letter)
  end  
  
  def noose
    "+-----------+\n" +
    "|           |\n" +
    "|           #{head}\n" +
    "|          #{body} \n" +
    "|          #{legs} \n" +
    "|                  \n"
  end

  def body
    if @bad_guesses == 2
      " |"
    elsif @bad_guesses == 3
      "/|"
    elsif @bad_guesses >= 4
      "/|\\"
    end  
  end  
  
  def legs
    if @bad_guesses == 5
      "/"
    elsif @bad_guesses >= 6
      "/ \\"
    end
  end
  
  def head
    if @bad_guesses > 0
      'O'
    else
      ''
    end
  end  
end
