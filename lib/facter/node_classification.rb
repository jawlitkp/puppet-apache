# hardware_platform.rb

Facter.add('hardware_platform') do
    setcode do
      Facter::Core::Execution.execute('/bin/uname --hardware-platform')
    end
  end

  Facter.add(:classification_hash) do
    setcode do
      
      classification_hash = {}
  
      Facter.value(:interfaces_array).each do |interface|
        ipaddress = Facter.value("ipaddress_#{interface}")
        if ipaddress
          interfaces_hash[interface] = ipaddress
        end
      end
  
      interfaces_hash
    end
  end


  case $::ipaddress {
  /^192\.168\.158\.([0-9]|[1-9][0-9]|1([0-9][0-9])|2([0-4][0-9]|5[0-5]))$/ : {
    $provider  = 'bbby'
    $region    = 'union'
    $env       = 'prod'
  }
}
