module ApplicationHelper
  
  def number_to_euro(amount)
    number_to_currency(amount, :unit => "&euro; ", :separator => ",", :delimiter => ".")
  end
  
end
