class Item
  attr_accessor :id, :title, :publish_date, :archived, :author, :label

  def initialize(title:, publish_date:, author:, label:, id: nil, archived: false)
    @id = id
    @title = title
    @publish_date = publish_date
    @archived = archived
    @author = author
    @label = label
  end
end
