class Item
  @@list = []

  attr_reader :id
  attr_accessor :name, :rank

  def initialize(name,rank)
    @name = name
    @rank = rank.to_i
    @id = @@list.length + 1
  end

  def self.all()
    @@list
  end

  def save()
    @@list.push(self)
  end

  def self.clear()
    @@list = []
  end

  def self.find(id)
    item_id = id.to_i()
    @@list.each do |item|
      if item.id == item_id
        return item
      end
    end
  end

  def self.sort_by_rank
    @@list.sort_by {|item| item.rank.to_i}
  end

  def self.reject_duplicate_items(username)
    @@list.each do |item|
      if item.name.include?(username)
        return true
      break
      else
        return false
      end
    end
  end

  def self.delete_item(itemid)
    @@list.each do |item|
      if item.id == itemid
        item.name = ""
        item.rank = ""
      break
      else
        item.name = item.name
        item.rank = item.rank
      end
    end
  end
  
end
