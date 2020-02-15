require 'rspec'
require_relative '../lib/url_handle.rb'

describe 'UrlHandle' do
  let(:url) { 'https://www.santafeciudad.gov.ar/blogs/agenda-sfc/actividades/2020-02-19/' }
  let(:url_h) { UrlHandle.new(url) }
  describe '#read_url' do
    context 'will take a string and return a proper element' do
      it 'returns said url' do
        expect(url_h.read_url).to be_a String
      end
    end
  end
end
