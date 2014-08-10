require 'trie'

describe Trie do
  before :each do
    @trie = Trie.new
  end

  it 'should hold arbitrary number of words as added' do
    @trie.add_word("apple").should == 'Done'
    @trie.add_word("add").should == 'Done'
    @trie.add_word("additional").should == 'Done'
    @trie.add_word("bad").should == 'Done'
    @trie.add_word("bat").should == 'Done'
    @trie.add_word("batman").should == 'Done'
    @trie.add_word("abracadabra").should == 'Done'
    @trie.add_word("crazy").should == 'Done'
    @trie.add_word("potter").should == 'Done'
  end

  it 'should report if the word exists in the word list' do
    @trie.exist?("add").should == false
    @trie.exist?("additional").should == false
    @trie.add_word("add")
    @trie.exist?("add").should == true
    @trie.exist?("additional").should == false

    @trie.exist?("abracadabra").should == false
    @trie.add_word("abracadabra")
    @trie.exist?("abracadabra").should == true

    @trie.exist?("bat").should == false
    @trie.exist?("batman").should == false
    @trie.add_word("batman")
    @trie.exist?("bat").should == false
    @trie.exist?("batman").should == true

    @trie.add_word("crazy")
    @trie.add_word("crazyhead")
    @trie.exist?("crazy").should == true
    @trie.exist?("crazyhead").should == true
  end
end
