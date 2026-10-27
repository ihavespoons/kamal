require "test_helper"

class CohereFilterLiteralsTest < ActiveSupport::TestCase
  test "question mark is literal in a host filter" do
    assert_equal [ "web?" ], Kamal::Utils.filter_specific_items([ "web?" ], [ "web1", "web?" ])
  end

  test "brackets are literal in a host filter" do
    assert_equal [ "web[1]" ], Kamal::Utils.filter_specific_items([ "web[1]" ], [ "web1", "web[1]" ])
  end

  test "star remains the supported wildcard" do
    assert_equal [ "web1", "web2" ], Kamal::Utils.filter_specific_items([ "web*" ], [ "web1", "web2", "db1" ])
  end
end
