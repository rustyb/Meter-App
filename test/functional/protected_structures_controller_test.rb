require 'test_helper'

class ProtectedStructuresControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => ProtectedStructure.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    ProtectedStructure.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    ProtectedStructure.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to protected_structure_url(assigns(:protected_structure))
  end

  def test_edit
    get :edit, :id => ProtectedStructure.first
    assert_template 'edit'
  end

  def test_update_invalid
    ProtectedStructure.any_instance.stubs(:valid?).returns(false)
    put :update, :id => ProtectedStructure.first
    assert_template 'edit'
  end

  def test_update_valid
    ProtectedStructure.any_instance.stubs(:valid?).returns(true)
    put :update, :id => ProtectedStructure.first
    assert_redirected_to protected_structure_url(assigns(:protected_structure))
  end

  def test_destroy
    protected_structure = ProtectedStructure.first
    delete :destroy, :id => protected_structure
    assert_redirected_to protected_structures_url
    assert !ProtectedStructure.exists?(protected_structure.id)
  end
end
