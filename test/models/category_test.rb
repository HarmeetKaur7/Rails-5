require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  test "category should be valid" do
    assert_raises(NameError) do
    some_var                            
    # assert true                                 #results in ERROR but with assert raises it passes
    end
  @category=Category.new(name: "Sports")
  assert @category.valid?                      #PASSES

  # @category= Category.new
  # assert_not @category.save , 'saved category without name'   //FAILURE

    @category= Category.new
  assert_not @category.save , 'saved category without name'   #after adding validation in category model it PASSES
  end

end
