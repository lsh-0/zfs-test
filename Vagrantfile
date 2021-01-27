VAGRANTFILE_API_VERSION=2
INSTANCE_NAME="zfs-test"
CPUS=4
RAM=8192

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

    config.vm.define INSTANCE_NAME do |project|
        project.vm.box_check_update = false # don't gab to the internet, please :(
        project.vm.box = "bento/ubuntu-20.04"

        project.vm.provider :virtualbox do |vb|
            vb.customize ["modifyvm", :id, "--cpus", CPUS]
            vb.customize ["modifyvm", :id, "--memory", RAM]
        
        end

        # upload the bootstrap script to /root and execute it
        project.vm.provision("file",
            source: "./bootstrap.sh", \
            destination: "/tmp/bootstrap.sh")
        project.vm.provision("shell",
            inline: "mv /tmp/bootstrap.sh /root/bootstrap.sh && /root/bootstrap.sh", \
            privileged: true)

    end 
end
