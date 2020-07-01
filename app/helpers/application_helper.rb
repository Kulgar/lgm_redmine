module ApplicationHelper

  def browser_title
    @title = ["LGM Redmine", @title].compact.join(" - ")
  end

end
