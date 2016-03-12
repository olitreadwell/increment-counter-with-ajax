ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'rack/test'
require_relative '../app'

class MainAppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_displays_main_page
    get '/'
    assert last_response.ok?
  end

  def test_main_page_loads_counter_object
    get '/'
    assert Counter.all.size > 0
  end

  def test_counter_has_value
    counter = Counter.first
    # get '/'
    assert !counter.value.nil?
    # Counter. do |counter| !counter.value.nil?}> 0
  end

  def test_counter_ensure_not_nil
    Counter.first.update({value: nil})

    assert Counter.first.value.nil?
    get '/'

    assert !Counter.first.value.nil?
  end
end
