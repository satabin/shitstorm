require 'squib'
require 'game_icons'
require_relative 'colors'

data = Squib.csv file: 'data/affirmations.csv', explode: 'count'

Squib::Deck.new(cards: data.nrows) do

  bg_colors = data.type.map do |tpe| color_by_type(tpe) end
  background color: bg_colors
  use_layout file: 'layouts/affirmation.yml'

  rect layout: :safe
  rect layout: :cut
  rect layout: :quote_rect
  rect layout: :title_rect, fill_color: bg_colors

  svg data: data.aff.map { |aff| GameIcons.get('lorc/punch').string unless aff.nil? }, layout: 'aff_ico'
  text str: data.aff, layout: :aff
  svg data: data.ren.map { |ren| GameIcons.get('lorc/sunbeams').string unless ren.nil? }, layout: 'ren_ico'
  text str: data.ren, layout: :ren
  svg data: data.cost.map { |cost| GameIcons.get('delapouite/coins').string unless cost.nil? }, layout: 'cost_ico'
  text str: data.cost, layout: :cost
  svg data: data.art.map { |art| GameIcons.get(art).recolor(fg: '333', bg: 'ccc').string }, layout: 'art'

  text str: data.type, layout: :type
  text str: data.description, layout: :description, stroke_color: '#ccc'
  text str: data.quote, layout: :quote
  text str: '© 2018 @gnieh_ — licence : CC-BY-SA 4.0',     layout: :copy

  svg file: 'opening-quote.svg', layout: 'quote_open'
  svg file: 'closing-quote.svg', layout: 'quote_close'

  text str: data.title, layout: :title

  build(:proofs) do
    safe_zone
    cut_zone
  end

  save_png prefix: 'complotistes_affirmation_', trim: 37.5
  hand range: (2..6), file: 'start.png'

end
