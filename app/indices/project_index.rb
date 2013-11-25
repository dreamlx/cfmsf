ThinkingSphinx::Index.define :project, :with => :active_record do
  indexes tag_list
  has published
end