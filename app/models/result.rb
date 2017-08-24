require 'csv'
class Result < ActiveRecord::Base
  belongs_to :machine
    def self.assign_row(row)
        line, b, time, real, min, mean, max = row
        if row[3] =~ /SUMMARY/
       @midr = row[2].slice(1,3)
       @mach = Machine.where(:mid => @midr).first
       @result = Result.create(midr: time, machine_id: @mach.id  )
      else
       line, b, time, real, min, mean, max = row
       @result.update(line: line, min: min, exps: real, max: max, ideal: mean, time: time  ) 
          end
      end
   def self.import(file)
   CSV.foreach(file.path, encoding: 'iso-8859-1:utf-8', skip_blanks: true) do |row|
  next if row.all?(&:nil?)
  result = Result.assign_row(row)
           end
end
end
