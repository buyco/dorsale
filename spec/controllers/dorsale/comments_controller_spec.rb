require "rails_helper"

describe Dorsale::CommentsController, type: :controller do
  routes { Dorsale::Engine.routes }

  let(:user) { create(:user) }

  before(:each) { sign_in(user) }

  let(:commentable) { create(:customer_vault_corporation) }
  let(:valid_params){
    {
      :comment => {
        :commentable_id   => commentable.id,
        :commentable_type => commentable.class.to_s,
        :text => "Hello",
      },
      :back_url => "/",
    }
  }

  describe "create" do
    it "should create comment" do
      post :create, params: valid_params
      expect(assigns(:comment)).to be_persisted
    end

    it "should redirect to back_url" do
      post :create, params: valid_params
      expect(response).to redirect_to("/")
    end

    describe "on person" do
      it "should create an event" do
        expect {
          post :create, params: valid_params
        }.to change(Dorsale::CustomerVault::Event, :count).by(1)

        event = Dorsale::CustomerVault::Event.last_created
        expect(event.author).to eq user
        expect(event.person).to eq commentable
        expect(event.comment).to eq Dorsale::Comment.last_created
        expect(event.action).to eq "comment"
      end
    end # describe "on person"
  end

  describe "update" do
    it "should update comment text" do
      comment = create(:dorsale_comment)
      patch :update, params: {id: comment, comment: {text: "New-comment-text"}, back_url: "/"}
      expect(response).to redirect_to("/")
      expect(comment.reload.text).to eq "New-comment-text"
    end
  end

  describe "destroy" do
    it "should destroy comment" do
      comment = create(:dorsale_comment)
      delete :destroy, params: {id: comment, back_url: "/"}
      expect(response).to redirect_to("/")
    end

    describe "on person" do
      it "should delete event" do
        person  = create(:customer_vault_corporation)
        comment = create(:dorsale_comment, commentable: person)
        event   = create(:customer_vault_event, person: person, comment: comment, action: "comment")

        delete :destroy, params: {id: comment}

        expect { comment.reload }.to raise_error(ActiveRecord::RecordNotFound)
        expect { event.reload   }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end # describe "on person"
  end
end
