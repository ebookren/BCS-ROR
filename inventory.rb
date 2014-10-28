class Item
  attr_accessor :name, :count
 def initialize (name,initCount )
   if (initCount<0) then
     initCount=0
   end # if
  @name=name.downcase
  @count=initCount
 end  # init

 def add(amount)
   if (amount<0) then
     amount=0
     puts "You can's increase by a negative number"
   end  #if
   
 @count += amount
 end  #add

 def sub(amount)
   if (amount<0) then
     amount=0
     puts "You can't decrease by a negative number"
   end  #if
 @count -= amount
 end  #sub
   
end  #class

@items=[]
def prompt()
puts @items.inspect
  puts " (A)dd item\n (R)emove item\n (L)ist items\n (I)ncrease item\n (D)ecrease items\n (Q)uit "
  select = [(print '?: '), gets.rstrip][1]
 

  if (select.upcase=="A") then
  puts "Add Item\nItem name"
  name=[(print 'Name? : '), gets.rstrip][1]
  puts "Initial Count"
  count= [(print 'Count? : '), gets.rstrip][1]
  @items.push(Item.new(name,count.to_i))

  end #if a
  
  if (select.upcase=="R") then
  puts "Remove Item\nItem name"
  name=[(print 'Name? : '), gets.rstrip][1]
  match_index = @items.index(@items.find { |l| l.name == name })
  if (match_index)  
    @items.delete_at(match_index)
  end

  end  #if r


  if (select.upcase=="Q") then
    File.open('itemFile', "w") do |file|
      Marshal.dump(@items, file)
    end #do
   exit
  end   #if q

if (select.upcase=="L") then
  puts "ITEM  NAME \t COUNT"
  @items.each do |item|
    puts "#{item.name}\t \t  #{item.count}"
    end #do
end  #if L

if (select.upcase=="I") then
  puts "Item Name"
  name=[(print 'Name? : '), gets.rstrip][1].downcase
  match_index = @items.index(@items.find { |l| l.name == name })
  if (match_index)  
   
puts "Item #{name} Count #{@items[match_index].count}"
  amount=[(print 'Increase amount? : '), gets.rstrip][1]
  @items[match_index].add(amount.to_i)
  else 
   puts "That item is not counted"
	end  #if match
  
end   #if I

if (select.upcase=="D") then
  puts "Item Name"
  name=[(print 'Name? : '), gets.rstrip][1].downcase
  match_index = @items.index(@items.find { |l| l.name == name })
  if (match_index)  
   
puts "Item #{name} Count #{@items[match_index].count}"
  amount=[(print 'Decrease amount? : '), gets.rstrip][1]
  @items[match_index].sub(amount.to_i)
  else 
   puts "That item is not counted"
	end   #if match
  
end  #if D

puts "prompt "
  prompt()
end   #prompt

puts "if file exists"
itemFile= if File.exists?('itemFile')
  File.open('itemFile') do |file|
    @items=Marshal.load(file)
  end
else
  0
end # if file

prompt()
