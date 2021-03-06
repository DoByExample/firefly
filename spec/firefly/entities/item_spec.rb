require 'spec_helper'

describe Item do

  before do
    ItemRepository.clear

    @item  = ItemRepository.create(Item.new(type: 'url', content: 'http://nu.nl'))
    @code  = Base62.encode(@item.id)

    3.times { RegisterClick.new(@item).call }
  end

  it '#short_url' do
    @item.short_url.must_equal "http://test.host/#{@code}"
  end

  it '#get_title' do
    @item.get_title.must_equal 'http://nu.nl'
    @item.title = "Mr Sandman"
    @item.get_title.must_equal "Mr Sandman"
  end

  it '#short_url with SSL enabled' do
    ENV['FIREFLY_SSL_ENABLED'] = "true"
    @item.short_url.must_equal "https://test.host/#{@code}"
    ENV['FIREFLY_SSL_ENABLED'] = "false"
  end

  it '#code' do
    @item.code.must_equal(@code)
  end
end
