# # knapsack_problem.rb
# # How to run this filre => ruby knapsack_problem.rb
KnapsackItem = Struct.new(:name, :weight, :value)
potential_items = [
  KnapsackItem['Map', 57247, 0.0887],
  KnapsackItem['Banana', 98732, 0.1856],
  KnapsackItem['Water', 134928,	0.2307],
  KnapsackItem['Apple', 77275,	0.1522],
  KnapsackItem['Compass', 29240,	0.0532],
  KnapsackItem['Cheese', 15440,0.0250],
  KnapsackItem['Sandwitch', 70820,	0.1409],
  KnapsackItem['Beer', 139603,	0.2541],
  KnapsackItem['Glucose', 63718,	0.1147],
  KnapsackItem['Suntan', 143807,	0.2660],
  KnapsackItem['Tin', 190457,	0.2933],
  KnapsackItem['Camera', 40572,	0.0686],
]

knapsack_capacity = 1000000
class Array
  # do something for each element of the array's power set
  def power_set
    yield [] if block_given?
    self.inject([[]]) do |ps, elem|
      ps.each_with_object([]) do |i,r|
        r << i
        new_subset = i + [elem]
        yield new_subset if block_given?
        r << new_subset
      end
    end
  end
end

maxval, solutions = potential_items.power_set.group_by {|subset|
  weight = subset.inject(0) {|w, elem| w + elem.weight}
  weight>knapsack_capacity ? 0 : subset.inject(0){|v, elem| v + elem.value}
}.max

puts "value: #{maxval}"
solutions.each do |set|
  wt, items = 0, []
  set.each {|elem| wt += elem.weight; items << elem.name}
  puts "weight: #{wt}"
  puts "items: #{items.join(',')}"
end
