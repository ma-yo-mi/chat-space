require 'rails_helper'

describe MessagesController, type: :controller do
  let(:user) { create(:user) }
  let(:group) { create(:group) }
  let(:message) { create(:message) }
  let(:group_id) do
    {params: { group_id: group.id }}
  end
  let(:params) do
    { params: { group_id: group.id, message: attributes_for(:message) } }
  end

  describe 'GET #index' do
    context "USER logged in" do
      before do
        login_user user
        get :index, group_id
      end

      it "is assigned to @message" do
        expect(assigns(:message)).to be_a_new(Message)
      end

      it "is assigned to @group" do
        expect(assigns(:group)).to eq(group)
      end

        it "renders index template" do
        expect(response).to render_template :index
      end
    end

    context "USER logged out" do
      it "redirect to new_user_session" do
        redirect_to new_user_session_path
      end
    end
  end

  describe 'POST #create' do
    context "USER logged in & saved successfully" do
      before do
        login_user user
      end

      it "data saved in DB " do
        expect {
          post :create, params
        }.to change(Message, :count).by(1)
      end

      it "redirect to group_messages_path" do
      post :create, params
      expect(response).to redirect_to group_messages_path
      end
    end

    context "Data can't be saved" do
      before do
        login_user user
      end

      it "data are not saved successfully" do
        expect {
          post :create, params: { group_id: group, message: attributes_for(:message, body: nil, image: nil) }
        }.to change(Message, :count).by(0)
      end

      it "redirect to group_messages_path" do
      post :create, params
      expect(response).to redirect_to group_messages_path
      end
    end

  context "USER logged out" do
    it 'redirects to new_user_session_path' do
      redirect_to new_user_session_path
    end
  end
end
end
