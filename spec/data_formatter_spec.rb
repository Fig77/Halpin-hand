require 'rspec'
require 'colorize'
require_relative '../lib/data_formatter.rb'

describe 'UiCommons' do
  let(:uiCommons) { UiCommons.new }
  describe '#separate_with' do
    context 'Given a specific char and a number will return a string with that number of said char' do
      it 'Returns string of ###\n (new line)' do
        expect(uiCommons.separate_with('#', 3)).to eq '###'
      end
    end
  end
  describe '#box_3' do
    context 'Given a word returns that word formatted inside a box made of +' do
      it 'will return given word with the correct format' do
        aux = "\e[0;32;49mhola\e[0m\n    + + + + + + + + + + + + + + + + + + +\n    "
        expect(uiCommons.box_3('hola')).to eq "\n    + + + + + + + + + + + + + + + + + + +\n     " + aux
      end
    end
  end
end

describe 'TextCommons' do
  let(:text) { TextCommons.new }
  describe '#ul' do
    context 'given a set of words will return them outputted as a list' do
      it 'Returns two words on a list' do
      end
    end
  end
end
