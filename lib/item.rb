class Item
  @@list = []
  @@counter = 1

  attr_reader :id
  attr_accessor :name, :rank, :counter

  def initialize(name,rank)
    @name = name
    @rank = rank.to_i
    @id = @@counter
    @@counter = @@counter + 1
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

  def self.populate_list(id)
    display_item_name.object_id = 'Item Name : '
    display_item_rank = 'and Item Rank : '
  end

  def self.sort_by_rank
    @@list.sort_by {|item| item.rank.to_i}
  end

  def self.reject_duplicate_items(username)
    @@list.each do |item|
      if item.name.include?(username)
        return true
      end
    end
  end

  def self.delete_item(itemid)
    @@list.each do |item|
      if item.id == itemid
        @@list.delete(@@list[itemid])
      break
      else
        item.name = item.name
        item.rank = item.rank
      end
    end
  end

end
