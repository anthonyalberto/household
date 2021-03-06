require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe BalanceUtilisateursController do

  # This should return the minimal set of attributes required to create a valid
  # BalanceUtilisateur. As you add validations to BalanceUtilisateur, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # BalanceUtilisateursController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all balance_utilisateurs as @balance_utilisateurs" do
      balance_utilisateur = BalanceUtilisateur.create! valid_attributes
      get :index, {}, valid_session
      assigns(:balance_utilisateurs).should eq([balance_utilisateur])
    end
  end

  describe "GET show" do
    it "assigns the requested balance_utilisateur as @balance_utilisateur" do
      balance_utilisateur = BalanceUtilisateur.create! valid_attributes
      get :show, {:id => balance_utilisateur.to_param}, valid_session
      assigns(:balance_utilisateur).should eq(balance_utilisateur)
    end
  end

  describe "GET new" do
    it "assigns a new balance_utilisateur as @balance_utilisateur" do
      get :new, {}, valid_session
      assigns(:balance_utilisateur).should be_a_new(BalanceUtilisateur)
    end
  end

  describe "GET edit" do
    it "assigns the requested balance_utilisateur as @balance_utilisateur" do
      balance_utilisateur = BalanceUtilisateur.create! valid_attributes
      get :edit, {:id => balance_utilisateur.to_param}, valid_session
      assigns(:balance_utilisateur).should eq(balance_utilisateur)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new BalanceUtilisateur" do
        expect {
          post :create, {:balance_utilisateur => valid_attributes}, valid_session
        }.to change(BalanceUtilisateur, :count).by(1)
      end

      it "assigns a newly created balance_utilisateur as @balance_utilisateur" do
        post :create, {:balance_utilisateur => valid_attributes}, valid_session
        assigns(:balance_utilisateur).should be_a(BalanceUtilisateur)
        assigns(:balance_utilisateur).should be_persisted
      end

      it "redirects to the created balance_utilisateur" do
        post :create, {:balance_utilisateur => valid_attributes}, valid_session
        response.should redirect_to(BalanceUtilisateur.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved balance_utilisateur as @balance_utilisateur" do
        # Trigger the behavior that occurs when invalid params are submitted
        BalanceUtilisateur.any_instance.stub(:save).and_return(false)
        post :create, {:balance_utilisateur => {}}, valid_session
        assigns(:balance_utilisateur).should be_a_new(BalanceUtilisateur)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        BalanceUtilisateur.any_instance.stub(:save).and_return(false)
        post :create, {:balance_utilisateur => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested balance_utilisateur" do
        balance_utilisateur = BalanceUtilisateur.create! valid_attributes
        # Assuming there are no other balance_utilisateurs in the database, this
        # specifies that the BalanceUtilisateur created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        BalanceUtilisateur.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => balance_utilisateur.to_param, :balance_utilisateur => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested balance_utilisateur as @balance_utilisateur" do
        balance_utilisateur = BalanceUtilisateur.create! valid_attributes
        put :update, {:id => balance_utilisateur.to_param, :balance_utilisateur => valid_attributes}, valid_session
        assigns(:balance_utilisateur).should eq(balance_utilisateur)
      end

      it "redirects to the balance_utilisateur" do
        balance_utilisateur = BalanceUtilisateur.create! valid_attributes
        put :update, {:id => balance_utilisateur.to_param, :balance_utilisateur => valid_attributes}, valid_session
        response.should redirect_to(balance_utilisateur)
      end
    end

    describe "with invalid params" do
      it "assigns the balance_utilisateur as @balance_utilisateur" do
        balance_utilisateur = BalanceUtilisateur.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        BalanceUtilisateur.any_instance.stub(:save).and_return(false)
        put :update, {:id => balance_utilisateur.to_param, :balance_utilisateur => {}}, valid_session
        assigns(:balance_utilisateur).should eq(balance_utilisateur)
      end

      it "re-renders the 'edit' template" do
        balance_utilisateur = BalanceUtilisateur.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        BalanceUtilisateur.any_instance.stub(:save).and_return(false)
        put :update, {:id => balance_utilisateur.to_param, :balance_utilisateur => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested balance_utilisateur" do
      balance_utilisateur = BalanceUtilisateur.create! valid_attributes
      expect {
        delete :destroy, {:id => balance_utilisateur.to_param}, valid_session
      }.to change(BalanceUtilisateur, :count).by(-1)
    end

    it "redirects to the balance_utilisateurs list" do
      balance_utilisateur = BalanceUtilisateur.create! valid_attributes
      delete :destroy, {:id => balance_utilisateur.to_param}, valid_session
      response.should redirect_to(balance_utilisateurs_url)
    end
  end

end
