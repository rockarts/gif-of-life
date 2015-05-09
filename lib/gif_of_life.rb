require 'gosu'
require './simulator'

class GameWindow < Gosu::Window
	#attr_accessor :player, :dealer
    
    HIT_BUTTON_X = 220
    HIT_BUTTON_Y = 240

    START_BUTTON_X = 190
    START_BUTTON_Y = 400
    
    DEAL_BUTTON_X = 240
    DEAL_BUTTON_Y = 140

    def initialize
		super 640, 480, false
		self.caption = "GIF of Life"
		@cursor = Gosu::Image.new(self, 'cursor.png')
        @logo = Gosu::Image.new(self, "logo.gif", true)  
        @start = Gosu::Image.new(self, "start.jpg", true)
        @hard_gif_image = Gosu::Image.new(self, "gif.png", true)
        @soft_gif_image = Gosu::Image.new(self, "jif.png", true)
        @none_image = Gosu::Image.new(self, "none.png", true)
        @state = :start

    end

	def update
        if(@state == :init)

            @seating_arrangemnet = [
                 [:soft, :hard, :hard, :soft],
                 [:none, :none, :none, :none],
                 [:none, :none, :none, :none],
                 [:hard, :soft, :hard, :soft],
                ]
            Simulator.new(@seating_arrangemnet)
            puts @seating_arrangemnet.inspect
        end
	end

	def draw
        if(@state == :start)
            @logo.draw(0, 0, 0)
            @start.draw(START_BUTTON_X, START_BUTTON_Y, 0)
        end

        if(@state == :init)
            @seating_arrangemnet
            @hard_gif_image.draw(0,0,0)
            @soft_gif_image.draw(51, 0, 0)
            @none_image.draw(102, 0, 0)
        end
		#@background_image.draw(0, 0, 0)
        #starting_location = 147
        #@player.hand.each do |card| 
        #    starting_location +=  73
        #    card.image.draw(starting_location, 380, 0)
        #end

        #starting_location = 147
        #@dealer.hand.each do |card|
        #    starting_location += 73
        #    card.image.draw(starting_location, 0, 0)
        #end

        #if(@state == "new")
        #    @hit_button.draw(HIT_BUTTON_X, HIT_BUTTON_Y, 0)
        #    @stand_button.draw(STAND_BUTTON_X, STAND_BUTTON_Y, 0)
        #end
        
        #if(@state != "new")
		#	message = Gosu::Font.new(self, Gosu::default_font_name, 200)
        #    message.draw(@state, 100, 150, 1.0, 1.0, 1.0)
        #    @deal_button.draw(DEAL_BUTTON_X, DEAL_BUTTON_Y, 0)
        #end

        #player_total = Gosu::Font.new(self, Gosu::default_font_name, 100)
        #player_total.draw(@player.total, 50, 380, 1.0, 1.0, 1.0)
        
        @cursor.draw(self.mouse_x, self.mouse_y, 0)
	end

    def button_down(id)
        if id == Gosu::KbEscape
            close
        end

        if button_down?(Gosu::MsLeft)
            if button_pressed(START_BUTTON_X, START_BUTTON_Y) && @state == :start then
                puts "start pressed"
                @state = :init
            end
        end
    end

    def button_pressed(x, y)
        return (mouse_x > x && mouse_x < x + 100) && (mouse_y > y && mouse_y < y + 50)
    end

	def update_seats
		@hard_gif_image = Gosu::Image.load(self, "gif.png", 176, 234, true)
        #@deck = []

		#@card_images.each_slice(13) do |ary|
		#	ary.each_with_index do |x, i|
		#		@deck << Card.new(nil, i + 1, x)
		#	end
		#end
	end

    def deal(player)
        #card = @deck.sample
        #@deck.delete(card)
        #player.add_card(card)
    end
end


window = GameWindow.new
window.show
