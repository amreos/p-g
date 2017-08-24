require 'csv'
class Machine < ActiveRecord::Base
   validates_uniqueness_of  :name
   has_many :results
    def self.assign_row(row)
   a, b, c = row
 if row[2].nil?
  puts 'na'
 else
   @mid = c[0..2]
   @name = c[5..-1]
 end
   machine = Machine.find_by(name: c)
   Machine.create(name: @name, mid: @mid) if machine.blank?
 end
    def self.import(file)
         CSV.foreach(file.path, encoding: 'iso-8859-1:utf-8', skip_blanks: true) do |row|
          machine = Machine.assign_row(row)
        end
end
end
