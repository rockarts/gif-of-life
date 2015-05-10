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
        @seating_arrangement = randomize
        @simulator = Simulator.new(@seating_arrangement)
    end

    def randomize
        hard = [
         [:soft, :hard, :hard, :soft],
         [:none, :none, :none, :none],
         [:none, :none, :none, :none],
         [:hard, :soft, :hard, :soft],
        ]

        push = [
         [:none, :hard, :hard, :none],
         [:none, :hard, :hard, :none],
         [:none, :soft, :soft, :none],
         [:none, :soft, :soft, :none],
        ]

        soft = [
         [:soft, :hard, :hard, :soft],
         [:none, :soft, :none, :none],
         [:none, :none, :soft, :none],
         [:hard, :soft, :hard, :soft],
        ] 
        opinions = [hard, soft, push]
        opinions.sample
    end

	def update
        if(@state == :in_progress)
            if((Gosu::milliseconds() - @last_update) >= 2000)    
                if(@seating_arrangement != @last_seating_arrangement)    
                    @last_seating_arrangement = @seating_arrangement
                    @seating_arrangement = @simulator.next
                else
                    @state = :end
                end

                @last_update = Gosu::milliseconds()
            end
        end
	end

	def draw
        if(@state == :start)
            @logo.draw(0, 0, 0)
            @start.draw(START_BUTTON_X, START_BUTTON_Y, 0)
            @cursor.draw(self.mouse_x, self.mouse_y, 0)
        end

        if(@state == :in_progress)
            draw_board
        end

        if(@state == :end)
            end_game
        end
	end

    def draw_board
        x_coordinate = 20
        @seating_arrangement.each do |x|
            x_coordinate += IMAGE_HEIGHT
            y_coordinate = 160
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

    def end_game
        draw_board
        verdict = @simulator.verdict
        winner_text = Gosu::Font.new(self, "Arial", 18)
        if(verdict == :hard)
            hard_winner = Gosu::Image.new(self, "images/gif_winner.png", true)
            hard_winner.draw(65, 10, 0)
            winner_text.draw("Winner!", 85, 140, 0)
        end

        if(verdict == :soft)
            soft_winner = Gosu::Image.new(self, "images/jif_winner.png", true)
            soft_winner.draw(480, 10, 0)
            winner_text.draw("Winner!", 500, 140, 0)
        end

        if(verdict == :push)
            push_text = Gosu::Font.new(self, "Arial", 42)
            push_text.draw("Push!", 265, 360, 0)
            hard_winner = Gosu::Image.new(self, "images/gif_winner.png", true)
            hard_winner.draw(65, 10, 0)
            soft_winner = Gosu::Image.new(self, "images/jif_winner.png", true)
            soft_winner.draw(480, 10, 0)
        end
    end

    def button_down(id)
        if id == Gosu::KbEscape
            close
        end

        if button_down?(Gosu::MsLeft)
            if button_pressed(START_BUTTON_X, START_BUTTON_Y) && @state == :start
                @state = :in_progress
            end
        end
    end

    def button_pressed(x, y)
        puts "#{mouse_x}, #{mouse_y}"
        return (mouse_x > x && mouse_x < x + 190) && (mouse_y > y && mouse_y < y + 400)
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