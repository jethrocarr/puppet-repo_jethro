# Sets up the repositories for repos.jethrocarr.com
class repo_jethro (
  $enable_os         = $repo_jethro::params::enable_os,
  $enable_updates    = $repo_jethro::params::enable_updates,
  $enable_custom     = $repo_jethro::params::enable_custom,
  $url_domain        = $repo_jethro::params::url_domain,
  $url_path          = $repo_jethro::params::url_path,
  $releases          = $repo_jethro::params::releases
  ) inherits repo_jethro::params {

  include repo_jethro::install
}

# vi:smartindent:tabstop=2:shiftwidth=2:expandtab:
