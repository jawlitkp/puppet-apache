#!/opt/puppetlabs/puppet/bin/ruby

def ip_addr_in_range?(low, high, addr)
    int_addr = numeric_ip(addr)
    int_addr <= numeric_ip(high) && int_addr >= numeric_ip(low)
  end
  
  def numeric_ip(ip_str)
    ip_str.split('.').inject(0) { |ip_num, part| ( ip_num << 8 ) + part.to_i }
  end