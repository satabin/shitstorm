require 'squib'
require 'irb'
require 'rake/clean'

# Add Rake's clean & clobber tasks
CLEAN.include('_output/*')

desc 'By default, just build the deck without extra options'
task default: [:deck]

desc 'Build everything, with all the options'
task all: [:with_pnp, :with_proofs, :deck]

desc 'Build the deck'
task(:deck)     {
  load 'src/make_affirmation.rb'
  load 'src/make_argumentation.rb'
}

Squib.enable_build_globally :hand

task(:aff)     { load 'src/make_affirmation.rb' }

task(:arg)     { load 'src/make_argumentation.rb' }

desc 'Enable proof lines'
task(:with_proofs) do
  puts "Enabling proofing lines."
  Squib.enable_build_globally :proofs
end

desc 'Enable print-and-play builds'
task(:with_pnp) do
  puts "Enabling print-and-play builds."
  Squib.enable_build_globally :pnp
end
