require 'squib'
require_relative 'affirmation'

data = Squib.yaml file: 'data/affirmations.yml', explode: 'count'

make_aff_deck(data, 'layouts/affirmation.yml', 'shitstorm_affirmation_')
