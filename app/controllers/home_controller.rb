class HomeController < ApplicationController
  def index
  	@categories = Category.all

  	@frequently_asked_questions = Category.find(Category.get_id_by_name("frequently asked questions")) unless Category.get_id_by_name("frequently asked questions").nil?
  	@notes_and_press_on_university = Category.find(Category.get_id_by_name("notes and press on university")) unless Category.get_id_by_name("notes and press on university").nil?
  end
end