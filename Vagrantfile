VAGRANTFILE_API_VERSION=2
INSTANCE_NAME="zfs-test"
CPUS=4
RAM=8192

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

    config.vm.define INSTANCE_NAME do |project|
        project.vm.box_check_update = false # don't gab to the internet, please :(
        project.vm.box = "bento/ubuntu-20.10"

        project.vm.provider :virtualbox do |vb|
            vb.customize ["modifyvm", :id, "--cpus", CPUS]
            vb.customize ["modifyvm", :id, "--memory", RAM]
        
        end

        project.vm.provision("shell",
            path: "bootstrap.sh", \
            keep_color: true, \
            privileged: true, \
            args: [])

    end 
end
