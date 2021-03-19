require "byebug"


def my_min(list)

    not_sorted = true #O(1)
    while not_sorted #O(n)
    not_sorted = false #O(1)
        (0...list.length-1).each do |idx| #O(n)
            if list[idx] < list[idx+1] #O(1)
                list[idx], list[idx+1] = list[idx+1], list[idx] #O(1)
                not_sorted = true #O(1)
            end 
        end 
    end
    list[-1] #O(1)
end 

#O(n) * O(n)
#O(n^2)

def efficient_my_min(list)
    list.inject { |acc, o| acc < o ? acc : o} #O(n)
end 
#O(n)

# p my_min([ 0, 3, 5, 4, -5, 10, 1, 90 ])
# p efficient_my_min([ 0, 3, 5, 4, -5, 10, 1, 90 ])


def largest_contiguous_subsum(list)
    new_arr = []

    (0...list.length).each do |idx1| #O(n)
        (0...list.length).each do |idx2| #O(n)
            if idx2 >= idx1 #O(1)
            new_arr << list[idx1..idx2].sum #O(1)
            end 
        end 
    
    end 
    
    return new_arr.max #O(n)
end 
#O(n^2) + #O(n)
#O(n^2)

 list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list) # => 8

    # # possible sub-sums
    # [5]           # => 5
    # [5, 3]        # => 8 --> we want this one
    # [5, 3, -7]    # => 1
    # [3]           # => 3
    # [3, -7]       # => -4
    # [-7]          # => -7


def efficient_contiguous_subsum(list)
        current_sum = list[0] #0
        largest_sum = list[0] #5
        # debugger
        (1...list.length).each do |i| 
            if current_sum + list[i] > 0  
                current_sum += list[i] 
                largest_sum = current_sum if current_sum > largest_sum
            else 
                 current_sum = 0
            end 
        end 
    largest_sum
end 

list = [2, 3, -6, 7, -6, 7]
p efficient_contiguous_subsum(list)