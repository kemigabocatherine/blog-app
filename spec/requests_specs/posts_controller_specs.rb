require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    before(:each) { get posts_path }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the index template' do
      expect(response).to render_template('index')
    end

    it 'shows the correct text in the response body' do
      expect(response.body).to_include('Posts#Index')
    end
  end

  describe 'GET #show' do
    before(:each) { get show_path }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the show template' do
      expect(response).to render_template('show')
    end

    it 'shows the correct text in the response body' do
      expect(response.body).to_include('Posts#Show')
    end
  end
end
