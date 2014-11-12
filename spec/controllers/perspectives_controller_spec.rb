require 'rails_helper'

RSpec.describe PerspectivesController do
  describe 'GET :index' do
    let(:perspectives) { [double('Perspective')] }

    before(:each) do
      allow(Perspective).to receive(:all) { perspectives }
    end

    def do_get
      get :index
    end

    it 'responds with success' do
      do_get

      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      do_get

      expect(response).to render_template(:index)
    end

    it 'retrieves a list of perspectives to display' do
      do_get

      expect(Perspective).to have_received(:all)
    end

    it 'assigns @perspectives to the view' do
      do_get

      expect(assigns(:perspectives)).to eq(perspectives)
    end
  end

  describe 'GET :show' do
    let(:perspective) { double('Perspective') }

    before(:each) do
      allow(Perspective).to receive(:find) { perspective }
    end

    def do_get
      get :show, id: 'today'
    end

    it 'responds with success' do
      do_get

      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      do_get

      expect(response).to render_template(:show)
    end

    it 'finds the perspective' do
      do_get

      expect(Perspective).to have_received(:find).with('today')
    end

    it 'assigns @perspective to the view' do
      do_get

      expect(assigns(:perspective)).to eq(perspective)
    end
  end

  describe 'GET :new' do
    let(:perspective) { double('Perspective') }

    before(:each) do
      allow(Perspective).to receive(:new) { perspective }
    end

    def do_get
      get :new
    end

    it 'responds with success' do
      do_get

      expect(response).to have_http_status(:success)
    end

    it 'renders the new template' do
      do_get

      expect(response).to render_template(:new)
    end

    it 'builds a new perspective' do
      do_get

      expect(Perspective).to have_received(:new)
    end

    it 'assigns @perspective to the view' do
      do_get

      expect(assigns(:perspective)).to eq(perspective)
    end
  end

  describe 'POST :create' do
    let(:perspective) { instance_spy Perspective, save: true }
    let(:perspective_params) { { title: 'Today', description: 'My today perspective', sidebar: '0' } }
    let(:params)             { { perspective: perspective_params } }

    def do_post(params = params)
      post :create, params
    end

    before(:each) do
      allow(Perspective).to receive(:new).and_return(perspective)
    end

    it 'builds a new perspective with the supplied parameters' do
      do_post

      expect(Perspective).to have_received(:new).with(perspective_params)
    end

    it 'attempts to save the new perspective' do
      do_post

      expect(perspective).to have_received(:save)
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
        allow(perspective).to receive(:save).and_return(false)
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

        expect(assigns(:perspective)).to eq(perspective)
      end
    end
  end

  describe 'GET :edit' do
    let(:perspective) { double('Perspective') }

    before(:each) do
      allow(Perspective).to receive(:find) { perspective }
    end

    def do_get
      get :edit, id: 'today'
    end

    it 'responds with success' do
      do_get

      expect(response).to have_http_status(:success)
    end

    it 'renders the edit template' do
      do_get

      expect(response).to render_template(:edit)
    end

    it 'finds the perspective' do
      do_get

      expect(Perspective).to have_received(:find).with('today')
    end

    it 'assigns @perspective to the view' do
      do_get

      expect(assigns(:perspective)).to eq(perspective)
    end
  end

  describe 'PUT :update' do
    let(:perspective) { instance_spy Perspective, update_attributes: true }
    let(:perspective_params) { { title: 'Today', description: 'My today perspective', sidebar: '0' } }
    let(:params)             { { id: 'today', perspective: perspective_params } }

    def do_put(params = params)
      put :update, params
    end

    before(:each) do
      allow(Perspective).to receive(:find).and_return(perspective)
    end

    it 'finds the perspective' do
      do_put

      expect(Perspective).to have_received(:find).with('today')
    end

    it 'attempts to update the perspective attributes' do
      do_put

      expect(perspective).to have_received(:update_attributes).with(perspective_params)
    end

    describe 'which is saved successfully' do
      it 'redirects to the perspectives view' do
        do_put

        expect(response).to redirect_to(perspectives_path)
      end

      it 'sets a flash notice to let the user know it has saved' do
        do_put

        expect(flash.notice).to eq('Perspective successfully updated.')
      end
    end

    describe 'which fails to save' do
      before(:each) do
        allow(perspective).to receive(:update_attributes).and_return(false)
      end

      it 'responds with 200 OK' do
        do_put

        expect(response).to have_http_status(:success)
      end

      it 'renders the edit template' do
        do_put

        expect(response).to render_template('edit')
      end

      it 'assigns the perspective to the view' do
        do_put

        expect(assigns(:perspective)).to eq(perspective)
      end
    end
  end
end
