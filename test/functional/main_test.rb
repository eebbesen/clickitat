
# frozen_string_literal: true
require_relative '../test_helper.rb'

class RackTest
  def test_hello_world
    get '/'
    assert last_response.ok?
    assert last_response.body.match(/Hello from Cuba Genie/)
  end

  def text_clickopen
    get '/clickopen'
    assert last_response.ok?
    assert last_response.body.match(/OpeningClicking/)
  end
end
