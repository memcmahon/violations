require './lib/violator'

violator = Violator.new

violator.import('data/Violations-2012.csv')

puts "Count: #{violator.violations.count}"

violator.categories.each do |category|
  puts "#{category}"
  puts "- Earliest Violation: #{violator.sort_by_date(category).first.date}"
  puts "- Latest Violation: #{violator.sort_by_date(category).last.date}"
end
