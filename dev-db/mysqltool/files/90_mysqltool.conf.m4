<IfDefine MYSQLTOOL>
  <IfDefine PERL>
  PerlRequire __APACHE_MODULES_CONF_DIR__/mysqltool.pl
  </IfDefine>
  <Directory __APACHE_DOCUMENT_ROOT__/mysqltool>
    Options ExecCGI
    <Files *.cgi>
###      SetHandler perl-script
      SetHandler cgi-script
      <IfDefine PERL>
      PerlHandler MysqlTool
      </IfDefine>
    </Files>
  </Directory>
</IfDefine>
