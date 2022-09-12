require 'test_helper'

# A testing a model should only include testing its validations
# if validations are not present  in model , all these test cases results in failure.

class CategoryTest < ActiveSupport::TestCase

  def setup
    @category=Category.new(name: "Sports")     #gotta keep the code DRY
  end


  test "category should be valid" do
  # @category=Category.new(name: "Sports")     #going to take it from set up
  assert @category.valid?                      #PASSES 
  end

  test "name should be present" do
    # @category=Category.new(name: " ")
      @category.name=" "
    assert_not @category.valid?
  end

  test "name should be unique" do
    # @category=Category.new(name: "Sports")     #gotta ktake it from setup
    @category.save
    @category2= Category.new(name: "Sports")
    assert_not @category2.valid?
  end

  test "name should not be too short" do
    @category.name="S"
    assert_not @category.valid?
  end

  test "name should not be too long" do
    @category.name="SportsSportsSports"
    assert_not @category.valid?
  end

end



# #  test "category should be valid" do
# assert_raises(NameError) do
#   some_var                            
#   # assert true                                 #results in ERROR but with assert raises it passes
#   end
# @category=Category.new(name: "Sports")
# assert @category.valid?                      #PASSES

# # @category= Category.new
# # assert_not @category.save , 'saved category without name'   //FAILURE

#   @category= Category.new
# assert_not @category.save , 'saved category without name'   #after adding validation in category model it PASSES
# end