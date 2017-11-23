require 'spec_helper'
require 'rails_helper'

describe MessagesController, type: :controller do
  let(:user) { create(:user) }
  let(:message){create(:message)}
  let(:group){create(:group)}
  let(:params) do
    { params: { group_id: group.id, message: attributes_for(:message) } }
  end

  describe 'GET #index' do
  before do
  login_user user
  get :index, group_id: group
  end
      context 'login' do
        it "assigns the requested message to @messages" do
          messages = group.messages
          expect(assigns(:messages)).to match(messages)
        end
        it "assigns the requested message to @message" do
          expect(assigns(:message)).to be_a_new(Message)
        end
        it "assigns the requested message to @groups" do
          groups = user.groups
          expect(assigns(:groups)).to match(groups)
        end
        it "assigns the requested message to @group" do
          expect(assigns(:group)).to eq group
        end
        it "renders the :index template" do
          expect(response).to render_template :index
        end
      end
      context 'not login' do
        it 'redirects to new_user_session_path' do
        redirect_to new_user_session_path
        end
      end
   end
  describe 'POST #create' do
      context 'user loged-in and successfully saved' do
            before do
              login_user user
            end
            it 'saves the new message in the database' do
              expect{post :create, params}.to change(Message, :count).by(1)
            end
            it 'redirects to messages#index' do
              post :create, params
              expect(response).to redirect_to group_messages_path
            end
      end
     context 'user loged-in but missed saved' do
            before do
              login_user user
            end
            it 'unsave the new message in the database' do
              expect{
                post :create, params: { group_id: group.id, message: attributes_for(:message, body: nil, image: nil) }
              }.to change(Message, :count).by(0)
            end
            it 'redirects to group_messages_path' do
              post :create, params
              expect(response).to redirect_to group_messages_path
            end
      end
     context 'user is not log-in' do
            it 'redirects to sign-in page'do
             get :create, params: { group_id: group, user_id: user, message: attributes_for(:message) }
              expect(response).to redirect_to new_user_session_path
            end
      end
   end
end
