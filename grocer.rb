require 'pry'

def consolidate_cart(cart)
  
  consolidated_hash = {}
  final_cart =[]
  
  cart.each do |cart_item|
      cart_item.each do |item, details|
        

            consolidated_hash[item] = details
            consolidated_hash[item][:count] = "150" #find a way to update this based on cart
            #binding.pry
            
            
            
          
          
      end #end cart_item.each
  end #end cart.each
  
  consolidated_hash
  binding.pry
  
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