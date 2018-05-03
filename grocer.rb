require 'pry'

def consolidate_cart(cart)
  
  consolidated_hash = {}
  keys_arrays = []
  
  cart.each do |cart_item|
      cart_item.each do |item, details|
        
           
            
            
            consolidated_hash[item] = details
            consolidated_hash[item][:count] = (cart.count {|i| i.to_s.include?(item)}) #find a way to update this based on cart
            

      end #end cart_item.each

  end #end cart.each
  #binding.pry
  consolidated_hash
  
  
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