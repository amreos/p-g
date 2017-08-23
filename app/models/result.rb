require 'csv'
class Result < ActiveRecord::Base
  belongs_to :machine
    def self.assign_row(row)
            a, b, c, d = row
           @c = c.slice(1,4)
           Result.create(line: a, min: @c)
          end
    
    def self.import(file)
   CSV.foreach(file.path, encoding: 'iso-8859-1:utf-8', skip_blanks: true) do |row|
  next if row[3] =~ /SUMMARY/
  next if row.all?(&:nil?)
  next if row.nil?
  result = Result.assign_row(row)
           end
end
end
