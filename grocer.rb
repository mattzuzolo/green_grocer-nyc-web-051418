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
            
            
            
            
                if detail_value == true && coupon_detail_value == item_name
                  #binding.pry
                    output_cart["#{item_name} W/COUPON"] = {:price => coupon_details[:cost], :clearance => detail_value, :count => (coupon_details[:num])}
                    
                    binding.pry
                    output_cart[item_name][:count] = (output_cart[item_name][:count] - coupon_details[:num])
                end   #end if     
          
          
  
  
              end #coupons details
          end #coupons each
  
      end #item_detail_pair_each
  end #cart each
  output_cart
  #binding.pry
  
end #end apply_coupons









def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end