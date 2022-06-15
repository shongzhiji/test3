 terraform {
    required_providers {
      ansible = {
        source = "registry.cloudiac.org/Brian/ansible"
        version = "1.0.4"
      }
    }
  }

  provider "ansible" {
    # Configuration options
  }
resource "ansible_host" "salt-proxy" {
  count = 1

  // 配置机器的 hostname，一般配置为计算资源的 public_ip (或 private_ip)
  inventory_hostname  = "116.62.157.43"

  // 配置机器所属分组
  groups = [node1]

  // 传给 ansible 的 vars，可在 playbook 文件中引用
  vars = {
    wait_connection_timeout   = 60
    proxy_private_ip          = "116.62.157.43"
    proxy_docker_tag          = var.proxy_docker_tag
  }
}
