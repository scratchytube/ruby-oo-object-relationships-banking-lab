require 'pry'

class Transfer

  attr_accessor :sender, :receiver, :amount, :status 

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && 
    receiver.valid? && 
    sender.balance > amount &&
    self.status == "pending"
  end 

  def execute_transaction
    if valid?
      sender.deposit(-@amount)
      receiver.deposit(@amount)

      self.status = "complete" 
    else 
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end 
  end
  
  def reverse_transfer
    if self.status == "complete"
      sender.deposit(@amount)
      receiver.deposit(-@amount)
      self.status = "reversed"
    end
  end
end






