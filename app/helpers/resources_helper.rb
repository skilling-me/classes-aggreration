module ResourcesHelper
  def display_tags(tag_list)
    raw tag_list.map{ |t| link_to t, tag_path(t) }.join(" , ")
  end
end
