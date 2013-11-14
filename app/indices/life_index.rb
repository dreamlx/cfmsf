ThinkingSphinx::Index.define :life, :with => :active_record do
  indexes title, content

  has published
end