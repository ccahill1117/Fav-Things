require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/item')

get ('/') do
  @list = Item.all()
  @list = Item.sort_by_rank()
  erb(:list)
end

post ('/') do
  name = params["name"]
  rank = params["rank"]
  # @error = "error test"
  @list = Item.all()
  if (name == "") || (rank == "")
    @error = "you need to enter a name and a rank!"
    @list = Item.all()
    @list = Item.sort_by_rank()
  elsif Item.reject_duplicate_items(name) == true
    @error = "name is already used"
    @list = Item.all()
    @list = Item.sort_by_rank()
  else
    @error = ""
    item = Item.new(name,rank)
    item.save()
    @list = Item.all()
    @list = Item.sort_by_rank()
  end
  erb(:list)
end

get('/items/:id') do
  @item = Item.find(params[:id])
  @list = Item.all()
  @list = Item.sort_by_rank()
  erb(:item)
end

post('/items/:id') do
  name = params["name"]
  rank = params["rank"]
  @item = Item.find(params[:id])
    @item.name = name
    @item.rank = rank

  erb(:item)
end

post('/items/<%= @item.id %>') do

  item_to_delete = Item.find(params[:id])
  Item.delete_item(item_to_delete)

  erb(:item)
end
