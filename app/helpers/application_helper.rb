module ApplicationHelper

  def get_category_id_by_name(name)
  	Category.get_id_by_name(name).nil? ? "#" : category_path(Category.get_id_by_name(name))
  end
end
