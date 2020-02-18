require 'rspec'
require 'colorize'
require_relative '../lib/data_formatter.rb'

describe 'UiCommons' do
  let(:uiCommons) { UiCommons.new }
  describe '#separate_with' do
    context 'Given a specific char and a number will return a string with that number of said char' do
      it 'Returns string of ### (new line)' do
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
  let(:textCommons) { TextCommons.new }
  let(:row_test) do
    "
    + + + + + + + + + + + + + + + + + + +
     \e[0;32;49mdog likes\e[0m
    + + + + + + + + + + + + + + + + + + +
     *red meat
    + + + + + + + + + + + + + + + + + + +
     \e[0;32;49mcat likes\e[0m
    + + + + + + + + + + + + + + + + + + +
     *fish"
  end
  let(:row) { ['dog likes', 'cat likes'] }
  let(:col) { ['red meat', 'fish'] }
  describe 'row_with_content' do
    context 'Given a two array strings will format that in such way that will be display in a row - content format' do
      it 'Will display row = [dogs likes, cat likes ] col = [red meat, fish] in a row -> content format' do
        expect do
          textCommons.row_with_content(row, col)
        end.to output(row_test).to_stdout
      end
    end
  end
end
