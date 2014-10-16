#
# Cookbook Name:: docker-mongodb-replset-configurator
# Recipe:: run
#
# Copyright (C) 2014 Daniel Ku
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#

execute "mongodb-replset-configurator" do
  command <<-EOH
    docker run -it --rm --name="mongodb-replset-configurator" \
    -e MRSC_ID=#{node['mongodb-replset-configurator']['id']} \
    -e MRSC_SERVERS=#{node['mongodb-replset-configurator']['servers'].join(',')} \
    -e MRSC_ARBITERS=#{node['mongodb-replset-configurator']['arbiters'].join(',')} \
    kjunine/mongodb-replset-configurator:latest
  EOH
end
