class Label
  attr_accessor :id, :title, :color

  def initialize(id:, title:, color:)
    @id = id
    @title = title
    @color = color
  end
end
