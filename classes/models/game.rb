require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(title:, publish_date:, author:, label:, id: nil, archived: false, multiplayer: nil,
                 last_played_at: nil)
    super(id: id, title: title, publish_date: publish_date, archived: archived, author: author, label: label)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end
end
