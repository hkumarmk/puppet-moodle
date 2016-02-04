#
#
#
class moodle::params {
  $sitedir  = '/var/www/moodle'
  $install_type  = git
  $repo          = 'https://github.com/moodle/moodle'
  $revision      = 'master'
  $vhost_port    = 80
  $vhost_docroot = '/var/www/moodle'
  $php_modules   = ['gd','curl', 'xmlrpc','intl','json','mysqlnd','mysql']
  $owner         = 'www-data'
}