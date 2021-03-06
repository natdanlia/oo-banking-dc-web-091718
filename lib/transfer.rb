class Transfer
  # your code here

  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
     @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if self.valid? && sender.balance > amount && self.status == "pending"
    @receiver.deposit(@amount)
    @sender.balance -= @amount
    self.status = "complete"
   else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end


  def reverse_transfer
    if self.status == "complete" && self.valid? && receiver.balance > amount
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    else
       @status = "rejected"
       "Transaction rejected. Please check your account balance."
    end
  end

end
