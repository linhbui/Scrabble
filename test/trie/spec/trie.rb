class Node
  
  attr_reader :letter, :next, :final
  
  def initialize letter
    @letter = letter
    @next = {}
    @final = false
  end
  
  def add_word(word)
    if !word
      @final = true
      return 'Done'
    else
      letter = word[0]
      rest = word[1..-1]
      if !@next.keys.include?(letter)
        @next[letter] = Node.new(letter)
      end
      @next[letter].add_word(rest)
    end
  end
  
  def exist?(word)
    if !word
      return @final
    else
      letter = word[0]
      rest = word[1..-1]
      if !@next.keys.include?(letter)
        return false
      end
      @next[letter].exist?(rest)
    end
  end

end

class Trie
  attr_accessor :root
  
  def initialize
    @root = Node.new(0)
  end
  
  def add_word(word)
     @root.add_word(word) 
  end
  
  def exist?(word)
    @root.exist?(word)
  end
  
end