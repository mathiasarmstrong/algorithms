require 'rubygems'
require 'pry-debugger'

module ArrayUtil
  def self.max(array)
  max=array[0]
  array.each{|arg| arg>=max ? max=arg : nil}#this will slow down as array.length approaches infinity
  return max
  end

  def self.middle_element(array)
    element=array[array.length/2]
    array.length%2==0 ? element2=array[(array.length/2)-1] : nil
    element2.nil? ? element : ((element+element2)/2.0)

     #this will not slow down as array.length approaches infinity
  end

  def self.sum_arrays(array1, array2)
    array3=[]
    array1.each_with_index{|y,x|array3[x]=(array1[x]+array2[x])}
    return array3 #this will slow down as array1 and array2.length approaches infinity
  end
end
