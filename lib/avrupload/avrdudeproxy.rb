#
#   AVRDude proxy class
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

module AvrUpload
	class AvrDudeProxy
		attr_reader :mcu, :port, :programmer, :hex, :baud, :config

    AVRDUDE_CMD = "avrdude -DqV ".freeze

		def initialize(options)
      @mcu = options[:mcu]
      @port = options[:port]
      @prog = @programmer = options[:programmer]
      @hex = options[:hex]
      @baud = options[:baud]
      @config = options[:config]
		end

		def upload
      avrdude_args = AVRDUDE_CMD
      avrdude_args += "-p #{@mcu} -c #{@prog} -b #{@baud} -P #{@port} -C #{@config} "
      avrdude_args += "-U flash:w:#{@hex}:i"

      `#{avrdude_args}`
		end
	end
end
