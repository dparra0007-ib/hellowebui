##################################################################################
# OUTPUT
##################################################################################

output "InstanceId" {
    value = "${aws_instance.coreinstance.id}"
}

output "PublicDNS" {
    value = "${aws_instance.coreinstance.public_dns}"
}

output "PublicIP" {
    value = "${aws_instance.coreinstance.public_ip}"
}