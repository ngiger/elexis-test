module ApplicationHelper
  # Return a title on a per-page basis.
  def title
    base_title = "Elexis Test"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

  def logo
    image_tag("logo.png", :alt => "Elexis Test", :class => "round")
  end
  
end
