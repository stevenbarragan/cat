require 'spec_helper'

describe MoveController do
  it 'render a json' do
    post :create, moves: []

    body = JSON.parse(response.body)
    expect(body["next"]).to be_true
  end

  it 'render a status in json' do
    post :create, moves: [1,2,3,4,5,6,7,8]

    body = JSON.parse(response.body)
    expect(body["status"]).to be_true
  end
end
