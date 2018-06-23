require 'squib'
require 'game_icons'

data = Squib.csv file: 'data/argumentations.csv', explode: 'count'

Squib::Deck.new(cards: data.nrows) do

  bg_colors = data.type.map do |tpe|
    case tpe
    when "Anti-Vax" then '#4B698B'
    when "Upéhère" then '#CA6573'
    when "Platiste" then '#D4AB6A'
    when "9/11" then '#70B45A'
    else '#000'
    end
  end
  background color: bg_colors
  use_layout file: 'layouts/argumentation.yml'

  rect layout: :safe
  rect layout: :cut
  rect layout: :quote_rect
  rect layout: :title_rect, fill_color: bg_colors

  svg data: GameIcons.get('lorc/punch').string, layout: 'arg_ico'
  text str: data.aff, layout: :arg
  svg data: GameIcons.get('delapouite/heart-beats').string, layout: 'cost_ico'
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

  save_png prefix: 'complotistes_argumentation_', trim: 37.5, trim_radius: 25
end
