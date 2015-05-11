# Allows an RPM GPG key to be installed. Shamelessly copied from the very handy
# stahnma/puppet-module-epel module, see:
# https://github.com/stahnma/puppet-module-epel/blob/master/manifests/rpm_gpg_key.pp

define jethro_repo::rpm_gpg_key($path) {
  # Given the path to a key, see if it is imported, if not, import it
  exec {  "import-${name}":
    path      => '/bin:/usr/bin:/sbin:/usr/sbin',
    command   => "rpm --import ${path}",
    unless    => "rpm -q gpg-pubkey-$(echo $(gpg --throw-keyids < ${path}) | cut --characters=11-18 | tr '[A-Z]' '[a-z]')",
    require   => File[$path],
    logoutput => 'on_failure',
  }
}
