# vim:fileencoding=utf-8

task default: :sane

desc 'Assert the sanity'
task sane: [:rubocop, :foodcritic]

desc 'Run rubocop'
task :rubocop do
  sh('rubocop --format simple') { |ok, _| ok || abort }
end

desc 'Run foodcritic'
task :foodcritic do
  sh('foodcritic --epic-fail any .') { |ok, _| ok || abort }
end
