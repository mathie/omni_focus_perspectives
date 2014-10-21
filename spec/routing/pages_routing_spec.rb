require 'rails_helper'

RSpec.describe PagesController, 'routing' do
  it 'routes the home page to pages#index' do
    expect(get: '/').to route_to('pages#index')
  end
end