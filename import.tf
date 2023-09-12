# Import VRF under Tenant from APIC
import {
  id = "uni/tn-tf_test_import/ctx-tf_test_import_vrf"
  to = aci_vrf.import_vrf_example
}

# Import Tenant from APIC
import {
  id = "uni/tn-tf_test_import"
  to = aci_tenant.import_tenant_example
}

# Import Application Profile under Tenant from APIC
import {
  id = "uni/tn-tf_test_import/ap-tf_test_import_ap"
  to = aci_application_profile.import_ap_example
}

# Import End Point Group under Application Profile from APIC
import {
  id = "uni/tn-tf_test_import/ap-tf_test_import_ap/epg-tf_test_import_epg"
  to = aci_application_epg.import_epg_example
}

# Import the Bridge Domain from the APIC
import {
  id = "uni/tn-tf_test_import/BD-tf_test_import_bd"
  to = aci_bridge_domain.import_bd_example
}

# Import the Bridge Domain Subnet from the APIC
import {
  id = "uni/tn-tf_test_import/BD-tf_test_import_bd/subnet-[10.1.2.254/24]"
  to = aci_subnet.import_bd_subnet_example
}