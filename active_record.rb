=begin
In the following exercise we describe four scenarios. 
For each scenario we want to know how many queries Rails performs against the database. 
In all cases, there are 8 employees in the database and each one has exactly 2 addresses. 
Please describe how many queries are generated and, most importantly, why.
=end

class Employee < ApplicationRecord
    has_many :addresses
end

=begin
1)
Employee.all.each do |emp|
    emp.addresses.each { |addr| puts (addr.street) }
end
? RTA: Here we have 16 Queries because for each employee it will iterates in its addresses (x2)
    

2)
Employee.joins(:addresses).all.each do |emp|
    emp.addresses.each { |addr| puts (addr.street) }
end
? RTA: Here we have 16 Queries again, although we are using JOIN, this fetch the employees with their addresses
? but we are fetching by each employee its addresses again

3)
Employee.includes(:addresses).all.each do |emp|
    emp.addresses.each { |addr| puts (addr.street) }
end
? RTA: Again we have 16 Queries, although we are using INCLUDES, the each loop create a querie 
? for each employee addresses

4)
Employee.joins(:addresses).includes(:addresses).all.each do |emp|
    emp.addresses.each { |addr| puts(addr.street) }
end
? RTA: Here we have 2 queries, when we combine JOINS and INCLUDES, we make sure that
? no additional queries are made when we access to the address in the loop.
=end
