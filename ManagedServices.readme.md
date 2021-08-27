<!-- region Generated -->
# Az.ManagedServices
This directory contains the PowerShell module for the ManagedServices service.

---
## Status
[![Az.ManagedServices](https://img.shields.io/powershellgallery/v/Az.ManagedServices.svg?style=flat-square&label=Az.ManagedServices "Az.ManagedServices")](https://www.powershellgallery.com/packages/Az.ManagedServices/)

## Info
- Modifiable: yes
- Generated: all
- Committed: yes
- Packaged: yes

---
## Detail
This module was primarily generated via [AutoRest](https://github.com/Azure/autorest) using the [PowerShell](https://github.com/Azure/autorest.powershell) extension.

## Module Requirements
- [Az.Accounts module](https://www.powershellgallery.com/packages/Az.Accounts/), version 2.2.3 or greater

## Authentication
AutoRest does not generate authentication code for the module. Authentication is handled via Az.Accounts by altering the HTTP payload before it is sent.

## Development
For information on how to develop for `Az.ManagedServices`, see [how-to.md](how-to.md).
<!-- endregion -->

### AutoRest Configuration
> see https://aka.ms/autorest

``` yaml
# lock the commit
# branch: 4b131739f528aea3da3ee4f6874da20602629432
require:
  - $(this-folder)/../readme.azure.noprofile.md
input-file:
  - https://github.com/Azure/azure-rest-api-specs/blob/main/specification/managedservices/resource-manager/Microsoft.ManagedServices/preview/2020-02-01-preview/managedservices.json

title: ManagedServices
# version should be 3.0.0-preview
module-version: 3.0.0
subject-prefix: $(service-name)

identity-correction-for-post: true

directive:
  # Merge cmdlet via modified operation id.
  # Origin operation id: MarketplaceRegistrationDefinitionsWithoutScope_Get
  - from: swagger-document
    where: $.paths["/providers/Microsoft.ManagedServices/marketplaceRegistrationDefinitions/{marketplaceIdentifier}"].get.operationId
    transform: return "MarketplaceRegistrationDefinitions_Get"

  # Origin operation id: MarketplaceRegistrationDefinitionsWithoutScope_List
  - from: swagger-document
    where: $.paths["/providers/Microsoft.ManagedServices/marketplaceRegistrationDefinitions"].get.operationId
    transform: return "MarketplaceRegistrationDefinitions_List"

  # Remove unnecessary cmdlet.
  - where:
      verb: Set
    remove: true
  
  # Delete the Registration word in the cmdlet name
  - where:
      subject: (.*)(Registration)(.*) 
    set:
      subject: $1$3

  # Remove variant of the cmdlet
  - where:
      verb: New
      variant: ^Create$|^CreateViaIdentity$|^CreateViaIdentityExpanded$
    remove: true

  # Generate memory object as parameter of the cmelet.
  - model-cmdlet:
    - Authorization
    - EligibleAuthorization
    - EligibleApprover
```
