require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  test "should not be valid without title" do
    project = Project.new
    assert_not project.valid?, "Project is valid without a title"
  end

end
