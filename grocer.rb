require 'pry'

def consolidate_cart(cart)
  
  cart.each do |cart_item|
    cart_item.each do |item, details|
      cart_item.each_with_object(Hash.new(0)) { |item,details| counts[item] += 1 }
    
    binding.pry
    
    end #end cart_item.each
  end #end cart.each
    
  
  # cart.each do |cart_item|
  #     cart_item.each do |item, details|
  #         details.each do |key, value|
            
  #   binding.pry
  #         end #end details each 
  #     end #end cart_item.each
  # end #end cart.each
  
end #end consolidate method

def apply_coupons(cart, coupons)
  # code here
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end