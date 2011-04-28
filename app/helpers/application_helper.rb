module ApplicationHelper
  # Return a title on a per-page basis.
  require 'redcloth'
  def title
    base_title = "Elexis Test"
    if @title.nil?
    base_title
    else
      "#{base_title} | #{@title}"
    end
  end

  def logo
     image_tag("logo.png", :size => "180x30", :alt => "Elexis Test", :class => "round")
  end

  def txt(partial)
    myName =  Rails.root.join('config/locales', I18n.locale.to_s, File.basename(partial).to_s)
    raw RedCloth.new(IO.readlines(myName).join).to_html
  end
  
  def get_user_name(id)
    if User.exists?(id) 
      User.find(id).email
    else 
      sprintf("%s: id = %d", I18n.t(:no_such_user_id), id)
    end
  end
  
  def get_license(id)
    if LicenseType.exists?(id) 
      LicenseType.find(id).name
    else 
      sprintf("%s: id = %d", I18n.t(:no_such_license_id), id)
    end
  end

end
