require 'rubygems'
require 'net/ldap'

class MyLDAP

  def initialize(host, base)
    @ldap = Net::LDAP.new(:host => host, :base => base)
  end
  
  def authenticates?(user, password)
    @ldap.auth user, password
    @ldap.bind
  end
  alias :authenticate :authenticates?
  
  def find(key, value)
     filter = Net::LDAP::Filter.eq(key, value)
     @ldap.search :filter => filter
  end
  
end
