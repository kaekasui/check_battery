require 'rubygems'
require 'ruby-growl'

pmset = `/usr/bin/pmset -g ps`
result = pmset =~ /(\d+)\%/

return if result.nil?

life = $1
g = Growl.new 'localhost', 'ruby-growl'
g.add_notification 'ruby-growl Notification'
 
if life.to_i >= 80 || life.to_i <= 30
 g.notify 'ruby-growl Notification', 'Notice the Battery', "バッテリー残量：#{$1}%"
end
