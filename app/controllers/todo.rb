class Todo
  attr_accessor :id, :title, :url, :completed, :order

  def initialize(id, title, url, completed, order)
    @id = id
    @title = title
    @url = url
    @completed = completed
    @order = order
  end
end
