# adds parent folder ("..") to the load path
$:<< File.join(File.dirname(__FILE__), '..')
require 'FlatironDiner/menu_item'
require 'FlatironDiner/menu'
require 'FlatironDiner/order'

