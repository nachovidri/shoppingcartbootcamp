class ShoppingCart

	def initialize
		@items = {}
		@banana_discount = false
	end

	def add_item_to_cart item
		if @items[item]
			@items[item] = @items[item] + 1
		else
			@items[item] = 1
		end
	end

	def show 
		@items.each do |key, value|
			total_item_price = calculate_total_price key, value
			discounted_price = calculate_discounted_price key, value
			puts "#{value}uds x #{key} - Initial price: #{total_item_price}$ - Discounted price: #{discounted_price}$"
		end
	end

	def calculate_total_price key, value
		(ListOfPrices.get_item_price key) * value
	end

	def calculate_discounted_price key, value

		if key == :apples && value == 2
			ListOfPrices.get_item_price key
		elsif key == :oranges && value == 3
			(ListOfPrices.get_item_price key) * 2
		else 
			discounted_price = calculate_total_price key, value
		end
	end

	def check_banana_discount
		@items.each do |key, value|
			if key == :grapes && value == 4
				@banana_discount = true
			end
		end
		if @banana_discount
			add_item_to_cart :free_bananas
		end
	end

end

class ListOfPrices

	attr_accessor :list_of_prices

	@@list_of_prices = {
		:apples => 10,
		:oranges => 5,
		:grapes => 15,
		:bananas => 20,
		:watermelon => 50,
		:free_bananas => 0,
	}

	def self.show_list_of_prices
		@@list_of_prices.each do |key, value|
			puts "#{key} : #{value}$"
		end

	end

	def self.get_item_price item
		@@list_of_prices[item]
	end

end


# ListOfPrices.show_list_of_prices
cart = ShoppingCart.new

cart.add_item_to_cart :apples
cart.add_item_to_cart :apples
cart.add_item_to_cart :bananas
cart.add_item_to_cart :bananas
cart.add_item_to_cart :oranges
cart.add_item_to_cart :oranges
cart.add_item_to_cart :oranges
cart.add_item_to_cart :grapes
cart.add_item_to_cart :grapes
cart.add_item_to_cart :grapes
cart.add_item_to_cart :grapes


cart.check_banana_discount
cart.show