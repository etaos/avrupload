#
#   AvrUpload library
#   Copyright (C) 2016, 2017  Michel Megens <dev@bietje.net>
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

require 'optparse'
require 'optparse/time'
require 'ostruct'

require 'avrupload/avrdudeproxy'
require 'avrupload/version'

module AvrUpload
	class << self
		def start(args)
			options = AvrUpload.parse(args)
			proxy = AvrDudeProxy.new(options)
			proxy.upload
		end

		def parse(args)
		  options = OpenStruct.new

		  options.tty_fix = false
		  options.hex = nil
		  options.mcu = nil
		  options.programmer = nil
		  options.port = nil
		  options.baud = 115200
		  options.config = "/etc/avrdude.conf"

		  parser = OptionParser.new do |p|
		    p.banner = "Usage: avr_upload [options]"
		    p.separator ""
		    p.separator "Specific options:"

		    p.on('-f', '--tty-fix', "Reset the TTY config before uploading") do
		      options.tty_fix = true
		    end

		    p.on('-H [FILE]', '--hex [FILE]',
		         'Hex file to upload to the AVR program memory') do |file|
		      options.hex = file
		    end

		    p.on('-m [MCU]', '--mcu [MCU]',
		         'The type of MCU you are trying to upload to') do |mcu|
		      options.mcu = mcu
		    end

		    p.on('-p [PROGRAMMER]', '--programmer [PROGRAMMER]',
		         'Programmer to use to upload the hex file to the AVR') do |prog|
		      options.programmer = prog
		    end

		    p.on('-P [PORT]', '--port [PORT]',
		         'Serial port to which the board is connected') do |port|
		      options.port = port
		    end

		    p.on('-b [BAUD]', '--baud [BAUD]',
		         'Serial baud rate to use') do |baud|
		      options.baud = baud
		    end

		    p.on('-c [FILE]', '--config [FILE]',
		         'Config file for avrdude, defaults to /etc/avrdude.conf') do |conf|
		      options.config = conf
		    end

		    p.separator ""
		    p.separator "Common options:"

		    p.on_tail('-h', '--help', "Show this message") do
		      puts p
		      exit
		    end

		    p.on_tail('-v', '--version', 'Show the version number') do
		      puts "AVR uploader #{AvrUpload::VERSION}"
		      exit
		    end
		  end

		  parser.parse!
		  mandatory = [:programmer, :hex, :mcu, :port]
		  missing = mandatory.select do |param|
		    param if options[param].nil?
		  end

		  unless missing.empty?
		    puts "Missing mandatory options: #{missing.to_s}"
		    puts ""
		    puts parser
		    exit 1
		  end

		  options
		end
	end
end
