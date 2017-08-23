require 'csv'
class Result < ActiveRecord::Base
  belongs_to :machine
    def self.assign_row(row)
      if row[3] =~ /SUMMARY/
      @@midr = row[2].slice(1,3) 
      @mach = Machine.where(:mid => @@midr).first
      x = @mach.id
    else
        line, b, time, real, min, mean, max = row
       Result.create(line: line, min: min, exps: real, max: max, ideal: mean, time: time, machine_id: x )
          end
        end
    
          
    def self.import(file)
   CSV.foreach(file.path, encoding: 'iso-8859-1:utf-8', skip_blanks: true) do |row|
  next if row[3] =~ /SUMMARY/
  next if row.all?(&:nil?)
  result = Result.assign_row(row)
           end
end
end
