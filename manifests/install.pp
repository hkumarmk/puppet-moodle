#
#
#
class moodle::install (
  $install_type = $moodle::params::install_type,
  $repo = $moodle::params::repo,
  $revision = $moodle::params::revision,
  $sitedir = $moodle::params::sitedir,
) inherits moodle::params {

  if $install_type == 'git' {
    if ! $repo {
      fail ("parameter \"repo\" is required for install_type \"git\"")
    }

    vcsrepo {$sitedir:
      ensure   => 'present',
      provider => git,
      source   => $repo,
      revision => $revision,
    }
  }
}