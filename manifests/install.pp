# @summary 
#   Installs the base Apache package.
#
class apache::install {
  package { 'httpd':
    ensure => 'present',
  }
}
