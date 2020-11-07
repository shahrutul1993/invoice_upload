require 'csv'
require 'roo'


class Invoice < ApplicationRecord
	belongs_to :vendor

	def self.import(file)
		spreadsheet = open_spreadsheet(file)
    	header = spreadsheet.row(1)
    	(2..spreadsheet.last_row).each do |i|
      		row = Hash[[header, spreadsheet.row(i)].transpose]
      		invoice = find_by_id(row["id"]) || new
      		invoice.attributes = row.to_hash.slice(*row.to_hash.keys)
      		invoice.save!
    	end
	end	

	def self.open_spreadsheet(file)
    	case File.extname(file.original_filename)
    		when ".csv" then Roo::CSV.new(file.path, csv_options: {encoding: "iso-8859-1:utf-8"})
  			when ".xls" then Roo::Excel.new(file.path)
  			when ".xlsx" then Roo::Excelx.new(file.path)
    	else raise "Unknown file type: #{file.original_filename}"
    	end
  	end

	def self.to_csv(options = {})
    	CSV.generate(options) do |csv|
      		csv << column_names
      		all.each do |invoice|
        		csv << invoice.attributes.values_at(*column_names)
      		end
    	end
  	end


end
