 
class Item
  attr_accessor :name, :count
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
puts @items.inspect
  puts " (A)dd item\n (R)emove item\n (L)ist items\n (I)ncrease item\n (D)ecrease items\n (Q)uit "
  select = [(print '?: '), gets.rstrip][1]
 
if (select.upcase=="Q")
   exit

  elsif (select.upcase=="A")
  puts "Add Item\nItem name"
  name=[(print 'Name? : '), gets.rstrip][1]
  puts "Initial Count"
  count= [(print 'Count? : '), gets.rstrip][1]
  @items.push(Item.new(name,count.to_i))
  
  prompt()
elsif (select.upcase=="I")
  puts "Item Name"
  name=[(print 'Name? : '), gets.rstrip][1].downcase
  match_index = @items.index(@items.find { |l| l.name == name })
  if (match_index)  
   
puts "Item #{name} Count #{@items[match_index].count}"
  amount=[(print 'Increase amount? : '), gets.rstrip][1]
  @items[match_index].add(amount.to_i)
  else 
   puts "That item is not counted"
	end
 
  end  
  prompt()
end


@items=[]


prompt()

