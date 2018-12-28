require 'squib'
require_relative 'argumentation'

data = Squib.yaml file: 'data/argumentations.yml', explode: 'count'

make_arg_deck(data, 'layouts/argumentation.yml', 'shitstorm_argumentation_')
