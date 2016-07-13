
case node[:platform]
when 'debian', 'ubuntu'
  file = '/usr/local/bin/aws'
  cmd = 'apt-get install -y python-pip && pip install awscli'
  completion_file = '/etc/bash_completion.d/aws'
  package "docker.io" do
    action :install
  end
when 'redhat', 'centos', 'fedora', 'amazon', 'scientific'
  file = '/usr/bin/aws'
  cmd = 'yum -y install python-pip && pip install awscli'
  package "docker" do
    action :install
  end
end



service "docker" do
  action :start
end
