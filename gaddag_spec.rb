require 'gaddag'

describe Gaddag do
  
  subject { @Gaddag = Gaddag.new }
  
  it 'should hold arbitrary number of words as added' do
    expect(subject.add_word("apple")).to eql('Done')
    expect(subject.add_word("add")).to eql('Done')
    expect(subject.add_word("addition")).to eql('Done')
    expect(subject.add_word("bat")).to eql('Done')
    expect(subject.add_word("batman")).to eql('Done')
    expect(subject.add_word("abracadabra")).to eql('Done')
    expect(subject.add_word("crazy")).to eql('Done')
    expect(subject.add_word("potter")).to eql('Done')e
  end
  
  it 'should represent a word in many ways'
    context "after the word 'call' is added" do
      before {subject.add_word('apple')}
    
      it 'has the path e-l-p-p-a-♦' do 
      end
      
      it 'has the path a-♦-p-p-l-e' do
      end
    
      it 'has the path p-a-♦-p-l-e' do
      end
    
      it 'has the path p-p-a-♦-l-e' do
      end
    
      it 'has the path l-p-p-a-♦-e' do
      end
    end
  end
  
  
  it 'should be able to suggest words from anchor-substrings' do
    context 'gaddag already has DOG COMFORT COMFORTING DISCOMFORT UNCOMFORTABLE' do
      before { subject.add('comfort')}
      before { subject.add('comforting')}
      before { subject.add('discomfort')}
      before { subject.add('uncomfortable')}
      before { subject.add('dog')}
      
      it "should raise 'Word does not exist' for words that are not added" do
        expect(subject.find('comfortable').to be_empty)
      end
      
      it 'should return the exact word DOG when the word is searched' do
        expect(subject.find('dog').to eql(['dog']))
      end
      
      it 'should return every words it has when searched for empty string' do
        expect(subject.find('')).to eql(%w(comfort comforting discomfort uncomfortable dog))
      end
      
      it 'should return only uncomfortable when searched for letter U' do
        expect(subject.find('u')).to eql(['uncomfortable'])
      end
      
      it 'should not return dog when searched for substring COM' do
        expect(subject.find('')).to eql(%w(comfort comforting discomfort uncomfortable))
      end
      
      it 'should return all words when searched for letter O' do
        expect(subject.find('')).to eql(%w(comfort comforting discomfort uncomfortable dog))
      end
      
    end
  end
  
  it 'should be able to suggest all applicable words from a set of letters' do
    specify 'wertasdf' do
      @gaddag.get_word('wertasdf').should == %w(dwarfest wafers steward after wefts raft)
    end
    
  end
  

end