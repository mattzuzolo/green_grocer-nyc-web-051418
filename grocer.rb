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
  coupons.each do |individual_coupon|
    
    #store this in name for easy access later
    item_name = individual_coupon[:item]
    
    #check if it exists and that the cart count is higher than the coupon count/num
        if cart[item_name] && cart[item_name][:count] >= individual_coupon[:num]
            
            #check if this key already exists before acting on it
            if cart["#{item_name} W/COUPON"]
              cart["#{item_name} W/COUPON"][:count] += 1 #increase counter when executed if it already exists
            else #if it doesn't exist, create the rest of the hash
              cart["#{item_name} W/COUPON"] = {:count => 1, :price => individual_coupon[:cost]} 
              cart["#{item_name} W/COUPON"][:clearance] = cart[item_name][:clearance]
            end #end second if
            
            #decrement the original item's number to account for the coupon change above
            cart[item_name][:count] -= individual_coupon[:num]
        end #end first if 
    
  end #end coupons each
    cart  
   # binding.pry
end #end method       
    
    
def apply_clearance(cart)

  cart.each do |item_name, item_detail_pairs|
     
      
      
       # binding.pry
         if item_detail_pairs[:clearance] == true
           item_detail_pairs[:price] = ( item_detail_pairs[:price] *(0.8) ).round(2)
        end 
  end #end cart.eacj 
  cart
 # binding.pry
end #end method




#calculates total cost of consolidated cart
def checkout(cart, coupons)
  
  #binding.pry
  
  #use same cart to apply all the different discounts onto otherwise it wont be totaled
  
  
  cart_output = consolidate_cart(cart)
  apply_coupons(cart_output, coupons)
  apply_clearance(cart_output)
  
  grand_total = 0

  #binding.pry
  cart_output.each do |item_name, item_details|
    
    #have to get price AND count otherwise items aren't charged repeatedly
    grand_total += item_details[:price] * item_details[:count]
    
  end
  
  #binding.pry
  
  if grand_total > 100.00
    grand_total = ( grand_total * (0.90) ).round(2)
  end  
  #binding.pry
  
  grand_total
end





  
  # consolidated_cart = consolidate_cart(cart)
  # cart_after_coupons = apply_coupons(consolidated_cart, coupons)
  # cart_after_clearance = apply_clearance(cart_after_coupons)
  # cart_output = cart_after_clearance
 






# def apply_coupons(cart, coupons)
  
#   output_cart = {}

#   cart.each do |item_name, item_detail_pairs|
#       item_detail_pairs.each do |detail_key, detail_value|
            
            
#       output_cart[item_name] = item_detail_pairs
      
      
            
#         coupons.each do |coupon_details|
#               coupon_details.each do |coupon_detail_key, coupon_detail_value|
            
            
            
     
#                 if (detail_value == true) && (coupon_detail_value == item_name) && (coupon_details[:num] <= item_detail_pairs[:count])
                  
#                   binding.pry
           
#                     output_cart["#{item_name} W/COUPON"] = {:price => coupon_details[:cost], :clearance => detail_value, :count => (output_cart[item_name][:count] / coupon_details[:num])}
                    
#                     binding.pry
#                     output_cart[item_name][:count] = (output_cart[item_name][:count] % coupon_details[:num])
#                     binding.pry
#                 end   #end if     
          
          
  
  
#               end #coupons details
#           end #coupons each
  
#       end #item_detail_pair_each
#   end #cart each
#   output_cart
#   #binding.pry
  
# end #end apply_coupons


















