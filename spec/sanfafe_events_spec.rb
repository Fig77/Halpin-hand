require 'rspec'
require_relative '../lib/santafe_events.rb'

describe '#content_format' do
  let(:text) do
    ["\e[0;36;49mwol\e[0m\n      - \e[0;32;49mlol\e[0m\n     -- \e[0;36;49mlol\e[0m",
     "\e[0;36;49mlol\e[0m\n      - \e[0;32;49mlol\e[0m\n     -- \e[0;36;49mwol\e[0m",
     "\e[0;36;49mlol\e[0m\n      - \e[0;32;49mwol\e[0m\n     -- \e[0;36;49mlol\e[0m"]
  end
  context 'Should return content given in three arrays into one string with an specific format' do
    it 'Shoulr return asd' do
      names = %w[wol lol lol]
      address = %w[lol lol wol]
      the_other_one = %w[lol wol lol]
      expect(SantaFe.new.send(:content_format, names, address, the_other_one)).to eq(text)
    end
  end
end
