class Result  

  attr_accessor :status, :name, :orderNumber, :transactionDate, :transactionNumber


def to_json(*a)
  {
    'json_class'   => self.class.name,
    'data'         => [@status, @name, @orderNumber, @transactionDate, @transactionNumber]
  }.to_json(*a)
end
    

#	public enum Status	{
#	#		SUCCESS, FAILURE
#	#	}
#	#	private Status status;
#	#	private String name;
#	#	private Long orderNumber;
#	#	private Date transactionDate;
#	#	private Long transactionNumber;
#
#	end  
