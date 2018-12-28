require 'squib'
require 'game_icons'
require_relative '../../../src/affirmation'
require_relative '../../../src/argumentation'

Class.new(Nanoc::DataSource) do
  identifier :cards

  def items

    aff_data = Squib.yaml file: '../data/affirmations.yml'
    arg_data = Squib.yaml file: '../data/argumentations.yml'

    aff_deck = make_aff_deck(aff_data, '../layouts/affirmation.yml', 'affirmation_', config: 'aff.yml')
    arg_deck = make_arg_deck(arg_data, '../layouts/argumentation.yml', 'argumentation_', config: 'arg.yml')

    aff = aff_deck.map.with_index do |card, idx|
      file = "#{card.svgfile[0..-5]}.png"
      count = aff_data['count'][idx]
      aff = aff_data['aff'][idx]
      ren = aff_data['ren'][idx]
      cost = aff_data['cost'][idx]
      attributes = {
        count: count,
        aff: aff,
        ren: ren,
        cost: cost,
        type: 'affirmation'
      }
      identifier = "/cards/affirmations/#{idx}.png"
      new_item(File.absolute_path(file), attributes, identifier, binary: true)
    end

    arg = arg_deck.map.with_index do |card, idx|
      file = "#{card.svgfile[0..-5]}.png"
      count = arg_data['count'][idx]
      arg = arg_data['arg'][idx]
      ren = arg_data['ren'][idx]
      cost = arg_data['cost'][idx]
      attributes = {
        count: count,
        arg: arg,
        ren: ren,
        cost: cost,
        type: 'argumentation'
      }
      identifier = "/cards/argumentations/#{idx}.png"
      new_item(File.absolute_path(file), attributes, identifier, binary: true)
    end

    aff + arg

  end
end
