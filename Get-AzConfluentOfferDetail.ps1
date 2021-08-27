# ----------------------------------------------------------------------------------
#
# Copyright Microsoft Corporation
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ----------------------------------------------------------------------------------

<#
.Synopsis
Get the offer details for available offers.
.Description
Get the offer details for available offers.
.Example
PS C:\>

.Example
PS C:\>

.Inputs

.Outputs
System.String

.Notes
COMPLEX PARAMETER PROPERTIES

To create the parameters described below, construct a hash table containing the appropriate properties. For information on hash tables, run Get-Help about_Hash_Tables.

.Link
https://docs.microsoft.com/powershell/module/az.confluent/get-azconfluentofferdetail 
#>

function Get-AzConfluentOfferDetail  {
    [OutputType([System.String])]
    [CmdletBinding(DefaultParameterSetName='List', PositionalBinding=$false)]
    param(
        [Parameter(ParameterSetName='List1')]
        [Microsoft.Azure.PowerShell.Cmdlets.Confluent.Category('Path')]
        [System.String]
        # Publisher Id
        # default value: confluentinc
        ${PublisherId} = 'confluentinc',

        [Parameter(ParameterSetName='List1')]
        [Microsoft.Azure.PowerShell.Cmdlets.Confluent.Category('Path')]
        [System.String]
        # Offer Id
        # default value: confluent-cloud-azure-prod
        ${OfferId} = 'confluent-cloud-azure-prod'
    )

    process {
        try {

            $path = "/providers/Microsoft.Marketplace/offers/$PublisherId.$OfferId" +"?excludePublic=true&api-version=2018-08-01-beta"

            $res = Invoke-AzRestMethod -Method Get -Path $path
            # Throw an exception when request unreachable
            if ($res.StatusCode -ne 200)
            { 
                throw $res.Content
            }

            # Format response message
            $content = $res.Content | ConvertFrom-Json -Depth 100
            
            $content | ConvertTo-Json -Depth 100

        } catch {
            throw
        }
    }
}
