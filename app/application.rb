class   Application

      def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

      items = req.path.split("/").reject {|e| e == ""}

      if req.path =='/testing'
       resp.status = 404

       resp.write  "Route not found"
      else
        error = nil
       @@items.each{|item| 
         if items[1] == item.name
          resp.write   "#{item.price}"
          error = resp.status
        else
          # resp.status = 400
           resp.write "Item not found"
           error = resp.status = 400
         end
       }

        p error

     end
        #  if req.path=="/songs"
        # #   resp.write "You requested the songs"
        # # else
        # #   resp.write "Route not found"
        #    p @@items
        # end
        #
         resp.finish
      # end
    end
end
# class Application
#
#   @@items = ["Apples","Carrots","Pears"]
#
#   def call(env)
#     resp = Rack::Response.new
#     req = Rack::Request.new(env)
#     cart = req.path.match(/cart/)
#     if cart != nil
#       if @@cart.empty?
#          resp.write  "Your cart is empty\n"
#       elsif !@@cart.empty?
#          resp.write "#{@@cart.join("\n")}"
#       end
#     elsif req.path.match(/add/)
#       if @@items.include?(req.params["item"])
#         resp.write "added #{req.params["item"]}"
#         @@cart << req.params["item"]
#       else
#         resp.write "We don't have that item"
#       end
#
#     end
