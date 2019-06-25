##################################################################################
# OUTPUT
##################################################################################

output "InstanceId" {
    value = "${module.ec2.InstanceId}"
}

output "PublicDNS" {
    value = "${module.ec2.PublicDNS}"
}

output "PublicIP" {
    value = "${module.ec2.PublicIP}"
}