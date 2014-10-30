# Visibility 



load './bankaccount.rb'



bank_account = BankAccount.new("Haydar", "KULEKCI")

bank_account.deposit(400)

puts bank_account.inspect

# bank_account.reset! # catch an error

bank_account.call_the_reset

puts bank_account.inspect



# Private and Protected example



account1 = BankAccount.new("haydar", "Kulekci")

account2 = BankAccount.new("Test", "Test");



account1.deposit(200)

account2.deposit(300)



puts "Accounts:"

puts account1.inspect

puts account2.inspect



# account1.call_other_private_reset(account2) # catch an error in this line



account1.call_other_protected_reset(account2)



puts "Accounts:"

puts account1.inspect

puts account2.inspect
