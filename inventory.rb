class Item
 attr_accessor :name, :count
def initialize (name,initCount )
 @name=name.downcase
 @count=initCount
end

def sub(amount)
 @count -= amount unless amount <= 0
end

 def add(amount)
   @count += amount unless amount <= 0
 end

end

def prompt()
puts @items.inspect
 puts " (A)dd item\n (R)emove item\n (L)ist items\n (I)ncrease item\n (D)ecrease items\n (Q)uit "
 select = [(print '?: '), gets.rstrip][1]


 if (select.upcase=="A") then
puts "Add Item\nItem name"
name=[(print 'Name? : '), gets.rstrip][1]
puts "Initial Count"
count= [(print 'Count? : '), gets.rstrip][1]
@items.push(Item.new(name,count.to_i)) unless @items.index(@items.find { |l| l.name == name })


 end

 if (select.upcase=="R") then
 puts "Remove Item\nItem name"
 name=[(print 'Name? : '), gets.rstrip][1]
 match_index = @items.index(@items.find { |l| l.name == name })
 if (match_index)
   @items.delete_at(match_index)
 end

 end

if (select.upcase=="Q") then
  exit
end

if (select.upcase=="L") then
 puts "ITEM  NAME \t COUNT"
 @items.each do |item|
   puts "#{item.name}\t \t  #{item.count}"
   end
end

if (select.upcase=="I") then
 puts "Item Name"
 name=[(print 'Name? : '), gets.rstrip][1].downcase
 match_index = @items.index(@items.find { |l| l.name == name })
 if (match_index)

puts "Item #{name} Count #{@items[match_index].count}"
 amount=[(print 'Increase amount? : '), gets.rstrip][1]
 @items[match_index].add(amount.to_i)
   if (amount.to_i <= 0 || amount.to_i == String)
     puts "Cannot add less than 1"
   end
else
  puts "That item is not counted"
 end

end

if (select.upcase=="D") then
 puts "Item Name"
 name=[(print 'Name? : '), gets.rstrip][1].downcase
 match_index = @items.index(@items.find { |l| l.name == name })
 if (match_index)

puts "Item #{name} Count #{@items[match_index].count}"
 amount=[(print 'Decrease amount? : '), gets.rstrip][1]
 @items[match_index].sub(amount.to_i)
 if (amount.to_i <= 0 || amount.to_i == String)
     puts "Cannot subtract less than 1"
 end
 else
  puts "That item is not counted"
 end

end


 prompt()
end


@items=[]


prompt()