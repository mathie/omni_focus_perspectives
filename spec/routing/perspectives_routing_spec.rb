require 'rails_helper'

RSpec.describe PerspectivesController, 'routing' do
  it 'routes GET /perspectives/new to perspectives#new' do
    expect(get: '/perspectives/new').to route_to('perspectives#new')
  end

  it 'generates /perspectives/new for new_perspective_path' do
    expect(new_perspective_path).to eq('/perspectives/new')
  end

  it 'routes POST /perspectives to perspectives#create' do
    expect(post: '/perspectives').to route_to('perspectives#create')
  end
  
  it 'generates /perspectives from perspectives_path' do
    expect(perspectives_path).to eq('/perspectives')
  end
end