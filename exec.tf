resource "null_resource" "install_nginx" {

  provisioner "remote-exec" {     # use remote-exec provisioner to connect to instance
    inline = [                    # list of command strings that will be executed in order
      "sudo apt install nginx -y" # command to install Nginx on Debian system
    ]
  }

  connection {
    type        = "ssh"                                                   # protocol to connect with (winrm also available)
    user        = "azureuser"                                             # default user on the Debian system
    private_key = file("~/.ssh/id_rsa")         # references the "default" private key in Azure Lab VM using file function
    host        = azurerm_linux_virtual_machine.example.public_ip_address # public IP that will be assigned to the instance
    timeout     = "1m"
    agent       = false
  }
}