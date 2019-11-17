$RG = "EuropeRG"
$Location = "West Europe"
$UserName = 'vmadmin'
$Password = ConvertTo-SecureString -String 'Wonder123456' -AsPlainText -Force
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $UserName, $Password
New-AzResourceGroup -Name "$RG" -Location "$Location"
for ($i = 1; $i -lt 4; $i ++)
{
 New-AzVM -ResourceGroupName "$RG" -Location "$Location" -VirtualNetworkName "vnet001" -AddressPrefix "10.10.0.0/16" -SubnetName "subnet001" -SubnetAddressPrefix "10.10.0.0/24" -Image "Win2012R2Datacenter" -Size "Standard B1S" -PublicIpAddressName "VM$i" -Name "VM$i" -Credential "$Credential" 
 }