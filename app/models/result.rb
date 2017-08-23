require 'csv'
require 'tempfile'
require 'fileutils'
class Result < ActiveRecord::Base
  belongs_to :machine
    def self.assign_row(row)
        line, b, time, real, min, mean, max = row
       Result.create(line: line, min: min, exps: real, max: max, ideal: mean, time: time  )
          end
      
def save_temp
COLUMNS = ['timestamp', 'other1', 'other2']

# open new csv for writing
CSV.open("C:\Users\hp1\Desktop\Datasets\000_out.csv", "wb") do |csv|
  # iterating existing csv rows
  
  CSV.foreach(file) do |row|
    # select only those specified above columns
    if row[3] =~ /SUMMARY/
    csv << COLUMNS.map { |col| row[2] }
  else
    next
  end
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
