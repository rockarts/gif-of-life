$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'neighbour'
require 'simulator'
require 'verdict'

require 'rules/rules'
require 'rules/opinion'
require 'rules/fewer_than_two_opinionated_neighbours_rule'
require 'rules/drowned_out_opinion_rule'
require 'rules/hard_gif_rule'
require 'rules/soft_gif_rule'