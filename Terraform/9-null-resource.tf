resource "null_resource" "example" {

  depends_on = [
    module.bastion_instance
  ]
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("${path.module}/PP-Key.pem")
    host        = aws_eip.elastic_ip.public_ip
  }
  provisioner "file" {
    source      = "${path.module}/PP-Key.pem"
    destination = "/tmp/PP-Key.pem"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /tmp/PP-Key.pem"
    ]
  }
  provisioner "local-exec" {
    command = "echo ${aws_eip.elastic_ip.public_ip} > bastion-ip.txt"
  }
}