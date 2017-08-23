require 'csv'
class Machine < ActiveRecord::Base
   validates_uniqueness_of  :name
   has_many :results

    def self.assign_row(row)
   a, b, c, d = row
   @c = c.slice(1,4)
   machine = Machine.find_by(name: c)
   Machine.create(name: c, mid: @c) if machine.blank?
 end
    
    def self.import(file)
         CSV.foreach(file.path) do |row|
          machine = Machine.assign_row(row)
           end
end
    
end
