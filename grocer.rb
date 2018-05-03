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
  
  output_cart = {}

  cart.each do |item_name, item_detail_pairs|
      item_detail_pairs.each do |detail_key, detail_value|
            
            
      output_cart[item_name] = item_detail_pairs
      
      
            
        coupons.each do |coupon_details|
              coupon_details.each do |coupon_detail_key, coupon_detail_value|
            
            
             binding.pry
     
                if (item_detail_pairs[:clearance] == true) && (coupon_detail_value == item_name) && (coupon_details[:num] <= item_detail_pairs[:count])
                #  binding.pry
                   
                    output_cart["#{item_name} W/COUPON"] = {:price => coupon_details[:cost], :clearance => item_detail_pairs[:clearance], :count => (output_cart[item_name][:count] / coupon_details[:num])}
                   # binding.pry
            
                    output_cart[item_name][:count] = (output_cart[item_name][:count] % coupon_details[:num])
                   #binding.pry
                end   #end if     
                #  cart[name][:count] -= coupon[:num]
          
  
  
              end #coupons details
          end #coupons each
  
      end #item_detail_pair_each
  end #cart each
  output_cart
  #binding.pry
  
end #end apply_coupons









# def apply_clearance(cart)
  
#   output_cart = {}
  
#   cart.each do |item_name, item_detail_pairs|
#     item_detail_pairs.each do |item_detail_key, item_detail_value|
    
#         if item_detail_key[:clearance] == true
#           binding.key
          
#           output_cart[item_name] = {:price => ( cart[:price] * .8 ), :clearance => detail_value, :count => (output_cart[item_name][:count] / coupon_details[:num])}
          
#         end #end if on clearance
        
#     end #end item_detail_pairs.each
#   end #end cart.each
  
# end #end cart






def checkout(cart, coupons)
  # code here
end



























