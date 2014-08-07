 
class Item
  attr_accessor :name, :initCount
 def initialize (name,initCount )
  @name=name.downcase
  @count=initCount
 end

 def add(amount)
 @count += amount
 end

 def sub(amount)
 @count -= amount
 end
   
end

def prompt()
  puts "(A)dd item (R)emove item (L)ist items (I)ncrease item (D)ecrease items"
  select= gets.chomp
  if (select.upcase=="A")
  puts "Item name"
  name=gets.chomp  
  puts "Initial Count"
  count= gets.chomp
  @items.push(Item.new(name,count.to_i))
  puts @items.inspect
  prompt()
elsif (select.upcase=="I")
  puts "Item Name"
  name=gets.chomp.downcase
  match_index = @items.index(@items.find { |l| l.name == name })
  puts "Name #{name} Index #{match_index}   Increase amount?"
  amount=gets.chomp

  @items[match_index].add(amount.to_i)
  puts @items.inspect
  prompt()
  end  
end


@items=[]
@items.push(Item.new('Pens', 10))
@items.push(Item.new('Cars', 15))

prompt()


