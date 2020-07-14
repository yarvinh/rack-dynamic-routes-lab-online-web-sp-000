class   Application

      def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

      p "testing params" ,req.path.join
      if req.path =='/testing'
       resp.status = 404
      p  req.path
       resp.write  "Route not found"
     elsif req.path == '/items/Figs' || req.path == "/items/Apples"
       @@items.each{|item| p item.name}

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
