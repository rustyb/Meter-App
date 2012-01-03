require 'test_helper'

class MetersControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Meter.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Meter.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Meter.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to meter_url(assigns(:meter))
  end

  def test_edit
    get :edit, :id => Meter.first
    assert_template 'edit'
  end

  def test_update_invalid
    Meter.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Meter.first
    assert_template 'edit'
  end

  def test_update_valid
    Meter.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Meter.first
    assert_redirected_to meter_url(assigns(:meter))
  end

  def test_destroy
    meter = Meter.first
    delete :destroy, :id => meter
    assert_redirected_to meters_url
    assert !Meter.exists?(meter.id)
  end
end
