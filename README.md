### Terraform Import Blocks to Import ACI objects

This example leverages the new feature in Terraform 1.5 - import blocks. Import blocks allow you to declaritively import objects to be managed by Terraform which weren't originally created with Terraform. 

Prior to import blocks, you had to use the import command to import each object. This was quite cumbersome as it required you to import the parent object and each individual child object. 
For example, we would need to import a Tenant, then the VRF, Bridge Domain, and other child objects beneath it. With import blocks, we can configure all the objects we want to import.

You will need the define the id of the object in the import block, which is the Distinguished Name (Dn) and the name of the resource in the Terraform block (resource.name_of_object).

This was tested with Terraform version 1.5.5 and the the 2.10 version of the ACI provider against versioni 5.2(1q) of ACI.