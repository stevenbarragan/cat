require 'spec_helper'

describe MoveController do
  it 'render a json' do
    post :create, moves: [], size: 3

    body = JSON.parse(response.body)
    expect(body["next"]).to be_true
  end

  it 'render status in json' do
    post :create, moves: [1,2,3,4,5,6,7,8], size: 3

    body = JSON.parse(response.body)
    expect(body["status"]).to be_true
  end

  it 'render the winning path in json' do
    post :create, moves: [1,4,2,5,3], size: 3

    body = JSON.parse(response.body)
    expect(body["win_path"]).to eq [1,2,3]
  end
end
