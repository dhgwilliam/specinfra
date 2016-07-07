class Specinfra::Helper::DetectOs::Esxi < Specinfra::Helper::DetectOs
  def detect
    if run_command('which vmware').success? && run_command('vmware -v').success?
      line = run_command('vmware -v').stdout
      if line =~ /VMware ESXi (.*)/
        { :family => 'esxi', :release => $1 }
      end
    end
  end
end
