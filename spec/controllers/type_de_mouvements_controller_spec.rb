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

describe TypeDeMouvementsController do

  # This should return the minimal set of attributes required to create a valid
  # TypeDeMouvement. As you add validations to TypeDeMouvement, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TypeDeMouvementsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all type_de_mouvements as @type_de_mouvements" do
      type_de_mouvement = TypeDeMouvement.create! valid_attributes
      get :index, {}, valid_session
      assigns(:type_de_mouvements).should eq([type_de_mouvement])
    end
  end

  describe "GET show" do
    it "assigns the requested type_de_mouvement as @type_de_mouvement" do
      type_de_mouvement = TypeDeMouvement.create! valid_attributes
      get :show, {:id => type_de_mouvement.to_param}, valid_session
      assigns(:type_de_mouvement).should eq(type_de_mouvement)
    end
  end

  describe "GET new" do
    it "assigns a new type_de_mouvement as @type_de_mouvement" do
      get :new, {}, valid_session
      assigns(:type_de_mouvement).should be_a_new(TypeDeMouvement)
    end
  end

  describe "GET edit" do
    it "assigns the requested type_de_mouvement as @type_de_mouvement" do
      type_de_mouvement = TypeDeMouvement.create! valid_attributes
      get :edit, {:id => type_de_mouvement.to_param}, valid_session
      assigns(:type_de_mouvement).should eq(type_de_mouvement)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new TypeDeMouvement" do
        expect {
          post :create, {:type_de_mouvement => valid_attributes}, valid_session
        }.to change(TypeDeMouvement, :count).by(1)
      end

      it "assigns a newly created type_de_mouvement as @type_de_mouvement" do
        post :create, {:type_de_mouvement => valid_attributes}, valid_session
        assigns(:type_de_mouvement).should be_a(TypeDeMouvement)
        assigns(:type_de_mouvement).should be_persisted
      end

      it "redirects to the created type_de_mouvement" do
        post :create, {:type_de_mouvement => valid_attributes}, valid_session
        response.should redirect_to(TypeDeMouvement.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved type_de_mouvement as @type_de_mouvement" do
        # Trigger the behavior that occurs when invalid params are submitted
        TypeDeMouvement.any_instance.stub(:save).and_return(false)
        post :create, {:type_de_mouvement => {}}, valid_session
        assigns(:type_de_mouvement).should be_a_new(TypeDeMouvement)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        TypeDeMouvement.any_instance.stub(:save).and_return(false)
        post :create, {:type_de_mouvement => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested type_de_mouvement" do
        type_de_mouvement = TypeDeMouvement.create! valid_attributes
        # Assuming there are no other type_de_mouvements in the database, this
        # specifies that the TypeDeMouvement created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        TypeDeMouvement.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => type_de_mouvement.to_param, :type_de_mouvement => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested type_de_mouvement as @type_de_mouvement" do
        type_de_mouvement = TypeDeMouvement.create! valid_attributes
        put :update, {:id => type_de_mouvement.to_param, :type_de_mouvement => valid_attributes}, valid_session
        assigns(:type_de_mouvement).should eq(type_de_mouvement)
      end

      it "redirects to the type_de_mouvement" do
        type_de_mouvement = TypeDeMouvement.create! valid_attributes
        put :update, {:id => type_de_mouvement.to_param, :type_de_mouvement => valid_attributes}, valid_session
        response.should redirect_to(type_de_mouvement)
      end
    end

    describe "with invalid params" do
      it "assigns the type_de_mouvement as @type_de_mouvement" do
        type_de_mouvement = TypeDeMouvement.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        TypeDeMouvement.any_instance.stub(:save).and_return(false)
        put :update, {:id => type_de_mouvement.to_param, :type_de_mouvement => {}}, valid_session
        assigns(:type_de_mouvement).should eq(type_de_mouvement)
      end

      it "re-renders the 'edit' template" do
        type_de_mouvement = TypeDeMouvement.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        TypeDeMouvement.any_instance.stub(:save).and_return(false)
        put :update, {:id => type_de_mouvement.to_param, :type_de_mouvement => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested type_de_mouvement" do
      type_de_mouvement = TypeDeMouvement.create! valid_attributes
      expect {
        delete :destroy, {:id => type_de_mouvement.to_param}, valid_session
      }.to change(TypeDeMouvement, :count).by(-1)
    end

    it "redirects to the type_de_mouvements list" do
      type_de_mouvement = TypeDeMouvement.create! valid_attributes
      delete :destroy, {:id => type_de_mouvement.to_param}, valid_session
      response.should redirect_to(type_de_mouvements_url)
    end
  end

end
