class Result  

  attr_accessor :status, :name, :orderNumber, :transactionDate, :transactionNumber


def to_json(*a)
  {
    'json_class'   => self.class.name,
    'data'         => [@status, @name, @orderNumber, @transactionDate, @transactionNumber]
  }.to_json(*a)
end
    
end
