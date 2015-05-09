require 'gosu'
require './simulator'
require './neighbour'
require './verdict'
Dir[File.dirname(__FILE__) + '/rules/*.rb'].each {|file| require file }

class GameWindow < Gosu::Window
	attr_accessor :seating_arrangement

    START_BUTTON_X = 190
    START_BUTTON_Y = 400
    
    IMAGE_WIDTH = 52
    IMAGE_HEIGHT = 68

    def initialize
		super 640, 480, false
		self.caption = "GIF of Life"
        @song = Gosu::Song.new(self, 'music/SanityNotIncluded.mp3')
        @song.play(true)
        @state = :start
        @last_update = 0
        load_images
        @seating_arrangement = [
                 [:soft, :hard, :hard, :soft],
                 [:none, :none, :none, :none],
                 [:none, :none, :none, :none],
                 [:hard, :soft, :hard, :soft],
                ]
        @simulator = Simulator.new(@seating_arrangement)
    end

	def update
        if((Gosu::milliseconds() - @last_update) >= 2000)
            @seating_arrangement = @simulator.next
            @last_update = Gosu::milliseconds()
        end
	end

	def draw
        if(@state == :start)
            @logo.draw(0, 0, 0)
            @start.draw(START_BUTTON_X, START_BUTTON_Y, 0)
            @cursor.draw(self.mouse_x, self.mouse_y, 0)
        end

        puts @seating_arrangement.inspect
        if(@state == :in_progress)
            x_coordinate = 20
            @seating_arrangement.each do |x|
                x_coordinate += IMAGE_HEIGHT
                y_coordinate = 68
                x.each do |y|
                    y_coordinate += IMAGE_WIDTH
                    if(y == :soft)
                        @soft_gif_image.draw(y_coordinate, x_coordinate, 0)
                    end

                    if(y == :none)
                        @none_image.draw(y_coordinate, x_coordinate, 0)
                    end

                    if(y == :hard)
                        @hard_gif_image.draw(y_coordinate, x_coordinate,0)
                    end
                end
            end
        end
	end

    def button_down(id)
        if id == Gosu::KbEscape
            close
        end

        if button_down?(Gosu::MsLeft)
            if button_pressed(START_BUTTON_X, START_BUTTON_Y) && @state == :start
                puts "start pressed"
                @state = :in_progress
            end
        end

    end

    def button_pressed(x, y)
        return (mouse_x > x && mouse_x < x + 100) && (mouse_y > y && mouse_y < y + 50)
    end

	def load_images
		@cursor = Gosu::Image.new(self, 'images/cursor.png')
        @logo = Gosu::Image.new(self, "images/logo.gif", true)  
        @start = Gosu::Image.new(self, "images/start.jpg", true)
        @hard_gif_image = Gosu::Image.new(self, "images/gif.png", true)
        @soft_gif_image = Gosu::Image.new(self, "images/jif.png", true)
        @none_image = Gosu::Image.new(self, "images/none.png", true)
	end
end


window = GameWindow.new
window.show
