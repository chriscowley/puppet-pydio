class pydio::selinux {
  selinux::dircontext { '/var/cache/pydio(/.*)?':
     seltype => 'httpd_cache_t',
  }
  selinux::dircontext { '/var/lib/pydio(/.*)?':
    seltype => 'httpd_sys_rw_content_t',
  }
  selinux::dircontext { '/etc/pydio(/.*)?':
    seltype => 'httpd_sys_content_t',
  }
  selinux::dircontext {'/usr/share/pydio(/.*)?':
    seltype => 'httpd_sys_script_exec_t'
  }
  selboolean { 'httpd_unified':
    persistent => true
  }
  selboolean { 'httpd_can_sendmail':
    persistent  => true,
    value       => 'on',
  }
  selboolean { 'httpd_enable_cgi':
    persistent  => true,
    value       => 'on',
  }
  selboolean {'httpd_builtin_scripting':
    persistent  => true,
    value       => 'on',
  }
  selboolean { 'httpd_use_nfs':
    persistent  => true,
    value       => 'on',
  }
  selboolean { 'httpd_use_cifs':
    persistent  => true,
    value       => 'on',
  }
}