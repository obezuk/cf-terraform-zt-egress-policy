resource "cloudflare_teams_rule" "example_egress_policy" {
  account_id  = var.CF_ACCOUNT_TAG
  name        = "Example Egress Policy"
  description = "This is an example Gateway egress policy defined in Terraform"
  precedence  = 1
  action      = "egress"
  enabled     = true
  filters     = ["egress"]
  traffic     = "net.dst.ip in {0.0.0.0/0 ::/0}"
  rule_settings {
    egress {
        ipv4 = var.IPV4_EGRESS_ADDRESS
        ipv6 = var.IPV6_EGRESS_ADDRESS
        ipv4_fallback = "0.0.0.0" # Optional, see: https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/teams_rule#ipv4_fallback
    }
  }
}