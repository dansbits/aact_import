require 'active_support/inflector'

class TextFileProcessor

	def initialize(file_name)
		@file_name = file_name
	end

	def process
		parse_headers

		rows.each do |row|
		 	row = row.split('|')
		 	save_row(row)
		 end
	end

	private

	def save_row(row)
		hashed_row = merge_row_and_header(row)
		model.create(hashed_row)
	end

	def merge_row_and_header(row)
		hashed_row = {}
		
		(0..@headers.count - 1).each do |i|
			hashed_row[@headers[i]] = row[i]
		end

		hashed_row
	end

	def parse_headers
		header_row = rows.shift
		@headers = header_row.split('|').map { |h| h.downcase }
	end

	def rows
		@rows ||= file_string.split "\r\n"
	end

	def file_string
		@file_string ||= File.open("data/#{@file_name}.txt").read
	end

	def model
		@file_name.chomp('.txt').classify.constantize
	end

end
