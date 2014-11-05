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
  
  it 'routes GET /perspectives/today/edit to perspectives#edit with id "today"' do
    expect(get: '/perspectives/today/edit').to route_to(
      controller: 'perspectives',
      action: 'edit',
      id: 'today'
    )
  end

  it 'generates /perspectives/today/edit from edit_perspective_path' do
    perspective = double('Perspective', to_param: 'today')
    
    expect(edit_perspective_path(perspective)).to eq('/perspectives/today/edit')
  end
end