group { "taro":
ensure => present
}

user { "taro":
ensure => present,
home => "/home/taro",
managehome => true,
shell => "/bin/bash",
comment => "taro yamada",
password => '$6$otRcF9aAGgzMgA7S$52CF4FvL0FUPhofXaOP3bvMrI0lfjtle0EyUybU/1RRNekSHFPOIGAdjNQCXq7pZFz/3cWRtbgC4SFBhBDlf0.'
}

package { "sudo":
provider => "yum",
ensure => "latest"
}

file { "/etc/sudoers.d/taro":
mode => "0600",
owner => "root",
group => "root",
content => "taro ALL=(ALL) ALL",
require => Package["sudo"]
}

package { "httpd":
provider => "yum",
ensure => "installed"
}

service { "httpd":
name => "httpd",
ensure => running,
require => Package["httpd"]
}

class { "mysql": }
class { "mysql::python": }

class { "mysql::server":
config_hash => { "root_password" => "foobar" }
}

mysql::db { "testdb":
user => "testuser",
password => "testpassword",
host => "localhost",
grant => ["all"]
}
