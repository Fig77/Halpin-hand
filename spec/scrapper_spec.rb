require 'rspec'
require_relative '../lib/scrapper.rb'

describe 'scrapper' do
  let(:url) { 'https://www.santafeciudad.gov.ar/blogs/agenda-sfc/actividades/2020-02-10/' }
  let(:santa) { Scrapper.new(url) }
  let(:address) { 'Av Almirante Brown 4900Balcarce 1635' }
  let(:event_titles) { "\nVerano Capital: Vacaciones \u00ABRodantes\u00BB\t\nCine Cl\u00E1sico: \u00AB8 y 1/2\u00BB\t" }
  describe '#initialize' do
    context 'given an argument returns same argument attr is read' do
      it 'Returns date given as argument' do
        expect(santa.site_url).to eq url
      end
    end
  end
  describe '#set_scrap_only' do
    context 'will return html document' do
      it 'returns html document made with given url' do
        expect(santa.set_scrap_only).to be_a(Nokogiri::HTML::Document)
      end
      it 'It will give an Errno::ENOENT error if the url given is invalid' do
        expect { Scrapper.new('IBLESSTHERAIINSSDOWNNINAAAAAFRICA').set_scrap_only }.to raise_error(Errno::ENOENT)
      end
    end
  end
  describe '#search_css' do
    context 'will return an XML Nodeset' do
      it 'search_css(selector) will be a XML::NodeSet' do
        santa.set_scrap_only
        expect(santa.search_css('h2')).to be_a(Nokogiri::XML::NodeSet)
      end
      it 'Should return an empty string if the tag does not exist or not found' do
        santa.set_scrap_only
        expect(santa.search_css('wololooo wololooo').text).to eq('')
      end
    end
    context 'output given URL and date should be the events shown in url with name and place' do
      it 'It will return events names' do
        santa.set_scrap_only
        expect(santa.search_css('h3.tribe-events-list-event-title a').text).to eq event_titles
      end
      it 'It will return address of events in given date' do
        santa.set_scrap_only
        expect(santa.search_css('span.tribe-street-address').text).to eq address
      end
    end
  end
end
