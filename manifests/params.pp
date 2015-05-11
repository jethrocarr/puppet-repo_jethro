# The following parameters provide configuration for the Jethro Carr
# repositories. Generally unless you're mirroring them, you won't need
# to adjust any of these variables.
#
# For more information about what these settings mean, please refer to
# repos.jethrocarr.com for comments on each type of repository.

class repo_jethro::params {

  # The domain where the repository will be pulled from
  $url_domain = "repos.jethrocarr.com"

  # The path to the repos
  $url_path = "/pub/jethrocarr/linux/"

  # Enabled repos
  $enable_os      = true
  $enable_updates = true
  $enable_custom  = true

  # Supported Releases
  $releases = { 'centos' => ['7'] }
}



# vi:smartindent:tabstop=2:shiftwidth=2:expandtab:
