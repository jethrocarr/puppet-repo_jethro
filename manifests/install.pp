# Install the repositories on supported platforms.
#
class repo_jethro::install {

  if ( $::osfamily == 'RedHat' ) {
    # CentOS, RHEL, Scientific Linux, Amazon Linux and others.

    if ( member($repo_jethro::releases['centos'], $::operatingsystemmajrelease) ) {

      yumrepo { 'jethrocarr-os':
        descr    => 'jethrocarr-os',
        baseurl  => "http://${repo_jethro::url_domain}${repo_jethro::url_path}/centos/${::operatingsystemmajrelease}/jethrocarr-os/\$basearch/",
        enabled  => $repo_jethro::enabled_os,
        gpgcheck => true,
        gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-repos.jethrocarr.com',
      }

      yumrepo { 'jethrocarr-updates':
        descr    => 'jethrocarr-updates',
        baseurl  => "http://${repo_jethro::url_domain}${repo_jethro::url_path}/centos/${::operatingsystemmajrelease}/jethrocarr-updates/\$basearch/",
        enabled  => $repo_jethro::enabled_updates,
        gpgcheck => true,
        gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-repos.jethrocarr.com',
      }

      yumrepo { 'jethrocarr-custom':
        descr    => 'jethrocarr-custom',
        baseurl  => "http://${repo_jethro::url_domain}${repo_jethro::url_path}/centos/${::operatingsystemmajrelease}/jethrocarr-custom/\$basearch/",
        enabled  => $repo_jethro::enabled_custom,
        gpgcheck => true,
        gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-repos.jethrocarr.com',
      }

      file { 'RPM-GPG-KEY-repos.jethrocarr.com':
        path   => '/etc/pki/rpm-gpg/RPM-GPG-KEY-repos.jethrocarr.com',
        source => "puppet:///modules/repo_jethro/jethrocarr_signing_key.gpg",
        mode   => '0644',
      }

    } else {
      notify { "repo_jethro not supported for this version of your platform.":
        loglevel => debug,
      }
    }
  } else{
    notify { "repo_jethro not supported for your platform.":
      loglevel => debug,
    }
  }
}

# vi:smartindent:tabstop=2:shiftwidth=2:expandtab:
