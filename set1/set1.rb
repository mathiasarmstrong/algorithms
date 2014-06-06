module Set1
  #this will have a O(n), or order n, becausewe have an iterator
  def self.swap_small(array)
     min=array[0]
     ind=0
     array.each_with_index do |arg, index |
      if arg<min
        min=arg
        ind=index
      end
    end
     array[ind]=array[0]
     array[0]=min
     return array
  end
#this will have a O(n^2), or order n^2, because we have an iterator within an iterator
  def self.find_sum_2(array, sum = 0)
    a=false
    array.each do|num1|
      array.each{|num2| num1+num2==0 ? a=true : nil}
    end
    return a
  end
#this will have a O(n^3), or order n^3, because we have an iterator within an iterator within an iterator
  def self.find_sum_3(array)
    a=false
    array.each do |num1|
      array.each do |num3|
        array.each{|num2| num1+num2+num3==0 ? a=true : nil}
      end
    end
    return a
  end
end
