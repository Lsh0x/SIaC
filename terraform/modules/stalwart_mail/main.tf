resource "scaleway_instance_ip" "mail_ip" {}

resource "scaleway_instance_security_group" "mail_server" {
  name = "stalwart-mail-server"
  description = "Security group for stalwart mail server"

  inbound_rule {
    action = "accept"
    port = "22"
  }

  inbound_rule {
    action = "accept"
    port   = "8080"
  }

  inbound_rule {
    action = "accept"
    port   = "443"
  }

  inbound_rule {
    action = "accept"
    port   = "143"
  }

  inbound_rule {
    action = "accept"
    port   = "993"
  }

  inbound_rule {
    action = "accept"
    port   = "110"
  }

  inbound_rule {
    action = "accept"
    port   = "995"
  }

  inbound_rule {
    action = "accept"
    port   = "4190"
  }

  inbound_rule {
    action = "accept"
    port   = "25"
  }

  inbound_rule {
    action = "accept"
    port   = "587"
  }

  inbound_rule {
    action = "accept"
    port   = "465"
  }
}

resource "scaleway_instance_server" "mail_server" {
  provider = scaleway

  type  = "DEV1-S"
  image = "ubuntu_jammy"
  name  = "stalwart-mail"
  tags = ["mail", "stalwart"]
  
  # project id 
  ip_id = scaleway_instance_ip.mail_ip.id
  security_group_id= scaleway_instance_security_group.mail_server.id


  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "mkdir /opt/mail && cd /opt/mail",
      "curl --proto '=https' --tlsv1.2 -sSf https://get.stalw.art/install.sh -o install.sh",
      "mkdir $PWD/stalwart",
      "sudo sh install.sh $PWD/stalwart",
      "sudo chown -R stalwart-mail:stalwart-mail $PWD/stalwart"
    ]

      connection {
        type                      = "ssh"
        user                     = "root"
        host                    = scaleway_instance_ip.mail_ip.address
      }
      
  }
}

output "public_ip" {
  value = scaleway_instance_server.mail_server.public_ip
}
