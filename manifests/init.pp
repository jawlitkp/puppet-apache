# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include apache
class apache (
  String $install_name,
  String $install_ensure,
) {
  include apache::install
}
