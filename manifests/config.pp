#
#
#
class moodle::config (
  $dbpassword,
  $sitedir = $moodle::params::sitedir,
  $datadir = '/var/lib/moodle',
  $owner = $moodle::params::owner,
  $dbname = 'moodle',
  $dbuser = 'moodle',
  $dbhost = 'localhost',
  $site_url = "http://$::ipaddress"
) {

  file {$datadir:
    ensure => directory,
    owner  => $owner,
  }

  file {"${sitedir}/config.php":
    ensure => file,
    owner  => $owner,
    content => template("${module_name}/config.php.erb"),
    notify => Service['httpd']
  }

  contain moodle::apache

}