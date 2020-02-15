require 'rspec'
require_relative '../lib/scrapper.rb'

describe 'scrapper' do
  let(:url) { 'https://www.santafeciudad.gov.ar/blogs/agenda-sfc/actividades/2020-02-19/' }
  let(:santa) { Scrapper.new(url) }
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
    end
  end
  describe '#search_css' do
    context 'will return an XML Nodeset' do
      it 'search_css(selector) will be a XML::NodeSet' do
        santa.set_scrap_only
        expect(santa.search_css('h2')).to be_a(Nokogiri::XML::NodeSet)
      end
    end
  end
end
