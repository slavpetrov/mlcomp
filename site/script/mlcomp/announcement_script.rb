# MLcomp: website for automatic and standarized execution of algorithms on datasets.
# Copyright (C) 2010 by Percy Liang and Jake Abernethy
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
# 
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# This code will only work if email is configured correctly

if SITEPARAMS[:email_configured]
  require 'rubygems'
  require 'highline/import'
  AnnouncementMailer.smtp_settings[:user_name] = ask("Enter your email address:  ") { |q| q.echo = true }
  AnnouncementMailer.smtp_settings[:password] = ask("Enter your password:  ") { |q| q.echo = "*" }
  Announcement.find_all_by_processed(false).each {|m| m.send_msg}
  puts "announcements sent!"
else
  puts "Email is not configured!"
end
exit
