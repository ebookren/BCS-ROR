# For Visibility Examples

class BankAccount
    # same class with bank_account.v.1.rb 

    attr_reader :balance
    class << self
        # Class Method
        def create_for(first_name, last_name)
            @accounts ||= [] # conditional assingment
            @accounts << BankAccount.new(first_name, last_name)
        end

        #Class Method
        def find_for(f_name, l_name)
            @accounts.find{|account| account.full_name == "#{f_name} #{l_name}"}
        end
    end

    def initialize(first_name, last_name)
        @balance = 0
        @first_name = first_name
        @last_name = last_name
    end

    def full_name
        "#{@first_name} #{@last_name}"
    end

    def deposit(amount)
        @balance += amount
    end

    def withdraw(amount)
        @balance -= amount
    end

    def call_other_private_reset(other_account)
        other_account.private_reset!
    end

    def call_other_protected_reset(other_account)
        other_account.protected_reset!
    end 

    def call_the_reset
        reset!
    end

    private 
    def reset!
        @balance = 0
    end

    def private_reset!
        @balance = 0
    end

    # private :reset! # you can do like this

    protected 
    def protected_reset!
        @balance = 0
    end

    
end
