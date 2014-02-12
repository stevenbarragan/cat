require 'spec_helper'

describe HomeController do
  it 'resnders the index view' do
    get :index
    expect(response).to render_template :index end
end
