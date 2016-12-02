require 'test_helper'

class NeedTest < ActiveSupport::TestCase
   test "the truth" do
     assert true
   end

test "must not save a need when name product is not provided" do
need = Need.new(product: "John")
assert_equal(false, need.save, "saved the need even
though not provided!")
end

test "must not save need if details contains non-digits" do
need = Need.new(product: "John",lastname: "12we3r",manufacturer: "12we3r",cost: "12we3r",color: "12we3r")
assert( !need.save, "saved the need, even though
the details are not valid!")
end

test "must allow only letters in forename and surname" do
need = Need.new(product: "John1")
assert_equal(false, need.save, "saved the need even
though product contains non-letters!")
end

end
