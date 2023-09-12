/* 
  Resoures for newly imported ACI objects. I did not put them in
  order because Terraform doesn't care. Declaritive FTW!

  These could have been generated with:
  terraform plan -generate-config-out=generated.tf

  But this is still considered "experimental" so I decided to write my own
  resources.

  Also note, you need to make sure the annotation is defined under each resource,
  otherwise you will not see that the object was created with Terraform.
*/

resource "aci_vrf" "import_vrf_example" {
  tenant_dn   = aci_tenant.import_tenant_example.id
  name        = "tf_test_import_vrf"
  description = "import block from terraform"
  annotation  = "orchestrator:terraform"
}

resource "aci_application_profile" "import_ap_example" {
  tenant_dn   = aci_tenant.import_tenant_example.id
  name        = "tf_test_import_ap"
  description = "import block from terraform"
  annotation  = "orchestrator:terraform"
}

resource "aci_tenant" "import_tenant_example" {
  name        = "tf_test_import"
  description = "import block from terraform"
  annotation  = "orchestrator:terraform"
}

resource "aci_application_epg" "import_epg_example" {
  application_profile_dn = aci_application_profile.import_ap_example.id
  name                   = "tf_test_import_epg"
  description            = "import block from terraform"
  annotation             = "orchestrator:terraform"
  relation_fv_rs_bd      = aci_bridge_domain.import_bd_example.id
}

resource "aci_bridge_domain" "import_bd_example" {
  tenant_dn                 = aci_tenant.import_tenant_example.id
  annotation                = "orchestrator:terraform"
  description               = "import block from terraform"
  name                      = "tf_test_import_bd"
  arp_flood                 = "yes"
  ep_move_detect_mode       = "garp"
  ip_learning               = "yes"
  limit_ip_learn_to_subnets = "yes"
  bridge_domain_type        = "regular"
  unicast_route             = "yes"
  unk_mac_ucast_act         = "flood"
  unk_mcast_act             = "flood"
  v6unk_mcast_act           = "flood"
}

resource "aci_subnet" "import_bd_subnet_example" {
  parent_dn   = aci_bridge_domain.import_bd_example.id
  annotation  = "orchestrator:terraform"
  description = "import block from terraform"
  ip          = "10.1.2.254/24"
  scope       = ["public"]
}