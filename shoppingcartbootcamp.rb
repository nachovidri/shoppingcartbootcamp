class ShoppingCart

	def initialize
		@items = {}
	end

	def add_item_to_cart item
		if @items[item]
			@items[item] = @items[item] + 1
		else
			@items[item] = 1
		end
		# item_price = list_of_prices.get_item_price item
		# @items[item] += item_price
	end

	def show 
		@items.each do |key, value|
			item_price = (ListOfPrices.get_item_price key) * value
			puts "#{value}uds x #{key} : #{item_price}$"
		end
	end

end

class ListOfPrices

	@@list_of_prices = {
		:apples => 10,
		:oranges => 5,
		:grapes => 15,
		:bananas => 20,
		:watermelon => 50,
	}

	def self.show_list_of_prices
		@@list_of_prices.each do |key, value|
			puts "#{key} : #{value}$"
		end

	end

	def self.get_item_price item
		@@list_of_prices[item]
	end

	# attr_accessor :name, :price

	# def initialize name, price
	# 	@name = name
	# 	@price = price
	# end
end

# class Item

# 	attr_accessor :name

# 	def initialize name
# 		@name = name
# 	end

# end

ListOfPrices.show_list_of_prices
cart = ShoppingCart.new

# apples = ListOfPrices.new "apples", 10
# oranges = ListOfPrices.new "oranges", 5
# grapes = ListOfPrices.new "grapes", 15
# bananas = ListOfPrices.new "banana", 20
# watermelon = ListOfPrices.new "watermelon", 50

# apples = Item.new "apples"
# oranges = Item.new "oranges"
# grapes = Item.new "grapes"
# bananas = Item.new "banana"
# watermelon = Item.new "watermelon"

cart.add_item_to_cart :apples
cart.add_item_to_cart :bananas
cart.add_item_to_cart :bananas

cart.show