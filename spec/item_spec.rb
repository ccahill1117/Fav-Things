require('item')
require('rspec')

describe("Item") do
  before() do
    Item.clear()
  end


describe(".all") do
  it("is empty at first") do
    expect(Item.all()).to(eq([]))
  end
end

describe("#save") do
   it("saves an item to the list of items") do
     item = Item.new("tacos")
     item.save()
     expect(Item.all()).to(eq([item]))
   end
 end

describe("#save") do
  it("saves an item to the list of items") do
    item = Item.new("tacos")
    item.save()
    Item.clear()
    expect(Item.all()).to(eq([]))
  end
end

describe("Item#id") do
  it("increments an id by 1 each time a new item is added") do
    # Item.clear()
    item = Item.new("tacos")
    item.save()
    item2 = Item.new("pizza")
    item2.save()
    expect(item.id()).to(eq(1))
    expect(item2.id()).to(eq(2))
  end
end

describe("Item.find") do
    it("finds an item based on its id") do
      # Item.clear()
      item = Item.new("tacos")
      item.save()
      item2 = Item.new("pizza")
      item2.save()
      expect(Item.find(1)).to(eq(item))
      expect(Item.find(2)).to(eq(item2))
    end
  end
end
