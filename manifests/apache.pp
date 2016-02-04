#
#
#
class moodle::apache (
  $vhost_port    = $moodle::params::vhost_port,
  $vhost_docroot = $moodle::params::vhost_docroot,
  $php_modules   = $moodle::params::php_modules,
) inherits moodle::params {

  include ::apache

  apache::vhost {'moodle':
    port    => $vhost_port,
    docroot => $vhost_docroot,
  }

  ::php::module{$php_modules:}

  include ::apache::mod::php
  include ::apache::mod::ssl


}