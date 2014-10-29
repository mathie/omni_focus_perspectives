require 'rails_helper'

RSpec.describe PerspectivesController do
  describe 'GET :new' do
    it 'responds with success' do
      get :new
      
      expect(response).to have_http_status(:success)
    end
    
    it 'renders the new template' do
      get :new
      
      expect(response).to render_template(:new)
    end
    
    it 'assigns @perspective to the view' do
      get :new
      
      expect(assigns(:perspective)).to be_a_new(Perspective)
    end
  end
  
  describe 'POST :create' do
    let(:perspective_double) { instance_spy Perspective, save: true }
    let(:perspective_params) { { title: 'Today', description: 'My today perspective', sidebar: '0' } }
    let(:params)             { { perspective: perspective_params } }

    def do_post(params = params)
      post :create, params
    end

    before(:each) do
      allow(Perspective).to receive(:new).and_return(perspective_double)
    end

    it 'builds a new perspective with the supplied parameters' do
      do_post

      expect(Perspective).to have_received(:new).with(perspective_params)
    end
    
    it 'attempts to save the new perspective' do
      do_post

      expect(perspective_double).to have_received(:save)
    end
    
    describe 'which is saved successfully' do
      it 'redirects to the perspectives view' do
        do_post
        
        expect(response).to redirect_to(perspectives_path)
      end
      
      it 'sets a flash notice to let the user know it has saved' do
        do_post
        
        expect(flash.notice).to eq('New perspective successfully created.')
      end
    end
    
    describe 'which fails to save' do
      before(:each) do
        allow(perspective_double).to receive(:save).and_return(false)
      end

      it 'responds with 200 OK' do
        do_post
        
        expect(response).to have_http_status(:success)
      end
      
      it 'renders the new template' do
        do_post
        
        expect(response).to render_template('new')
      end
      
      it 'assigns the perspective to the view' do
        do_post
        
        expect(assigns(:perspective)).to eq(perspective_double)
      end
    end
  end
end