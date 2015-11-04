require 'rubygems'
require 'ruby-growl'

pmset = `/usr/bin/pmset -g ps`
connecting_ac_power = pmset =~ /AC Power/
result = pmset =~ /(\d+)\%/

return if result.nil?

life = $1
g = Growl.new 'localhost', 'ruby-growl'
g.add_notification 'ruby-growl Notification'

if (life.to_i >= 80 && connecting_ac_power) || (life.to_i <= 30 && !connecting_ac_power)
 g.notify 'ruby-growl Notification', 'Notice the Battery', "バッテリー残量：#{$1}%"
end
