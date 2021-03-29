##Initial definitions for the Results Readme
Set-Variable -Name "File" -Value "$args" -Scope global
Set-Variable -Name "TotalSigs" -Value 0 -Scope global
Set-Variable -Name "TotalHashes" -Value 0 -Scope global
Set-Variable -Name "TotalIPs" -Value 0 -Scope global
Set-Variable -Name "TotalSkips" -Value 0 -Scope global
Set-Variable -Name "FirstSID" -Value 700000 -Scope global
Set-Variable -Name "LastSID" -Value 0 -Scope global
$global:SID = $FirstSID
$Today=Get-Date -Format "yyyy-MM-dd"

##Define localized paths
New-Item -Name "Results" -ItemType Directory -Path $PSScriptRoot
$global:ResultsPath=Join-Path -Path $PSScriptRoot -ChildPath "Results"
$global:LibsPath=Join-Path -Path $PSScriptRoot -ChildPath "Libs"
$global:TempReadmePath=Join-Path -Path $LibsPath -ChildPath "TemplateReadme.txt"
$global:ReadmePath=Join-Path -Path $ResultsPath -ChildPath "Readme.txt"
$global:ModulePath=Join-Path -Path $LibsPath -ChildPath "Add-Features.psm1"
New-Item -Name "$OutputName`.rules" -ItemType File -Path $ResultsPath

##Import functions module##
Import-Module -force -name "$ModulePath"

Input-File
Detect-Filetype

$FileContent = import-csv -Path $File 
#Write-Host $File
#Write-Host $FileContent

##Convert invalid filetypes to csv##
#Detect-Filetype

##Variable Declaration##
$Count = 0
$length = $FileContent.length

function Detect-Type {
  if ($FileContent[$Count].type -eq "ip-src"){
    $IPSRC = "ANY" 
    $IPDST = "ANY"
    $Type = @()
    $Content = @()
    $Message = @()
    $Type += $FileContent[$Count].type
    $Content += $FileContent[$Count].value
    $Message += $FileContent[$Count].type 
    $Reference += $FileContent[$Count].attribute_tag
    $IPSRC = $Content
    echo "alert $IPSRC ANY <> $IPDST ANY (msg:`"$Message`"; content:`"$Content`"; reference:$Reference; classtype:$Classtype; sid:$SID; rev:1;)" `n  >> $OutputFile`.rules
   }
   if ($FileContent[$Count].type -eq "ip-dst"){
    $IPSRC = "ANY" 
    $IPDST = "ANY"
    $Type = @()
    $Content = @()
    $Message = @()
    $Type += $FileContent[$Count].type
    $Content += $FileContent[$Count].value
    $Message += $FileContent[$Count].type 
    $Reference += $FileContent[$Count].attribute_tag
    $IPDST = $Content
    echo "alert $IPSRC ANY <> $IPDST ANY (msg:`"$Message`"; content:`"$Content`"; reference:$Reference; classtype:$Classtype; sid:$SID; rev:1;)" `n  >> $OutputFile`.rules
   }

    ##Hash Statements

   if ($FileContent[$Count].type -eq "sha1"){
    $Type = @()
    $Content = @()
    $Message = @()
    $Type += $FileContent[$Count].type
    $Content += $FileContent[$Count].value
    $Message += $FileContent[$Count].type 
    $Reference += $FileContent[$Count].attribute_tag
    echo "alert ANY ANY <> ANY ANY (msg:`"$Message`"; content:`"$Content`"; reference:$Reference; classtype:$Classtype; sid:$SID; rev:1;)" `n  >> $OutputFile`.rules
   }
    if ($FileContent[$Count].type -eq "hash_sha1"){
    $Type = @()
    $Content = @()
    $Message = @()
    $Type += $FileContent[$Count].type
    $Content += $FileContent[$Count].value
    $Message += $FileContent[$Count].type 
    $Reference += $FileContent[$Count].attribute_tag
    echo "alert ANY ANY <> ANY ANY (msg:`"$Message`"; content:`"$Content`"; reference:$Reference; classtype:$Classtype; sid:$SID; rev:1;)" `n  >> $OutputFile`.rules
   }
   if ($FileContent[$Count].type -eq "sha256"){
    $Type = @()
    $Content = @()
    $Message = @()
    $Type += $FileContent[$Count].type
    $Content += $FileContent[$Count].value
    $Message += $FileContent[$Count].type 
    $Reference += $FileContent[$Count].attribute_tag
    echo "alert ANY ANY <> ANY ANY (msg:`"$Message`"; content:`"$Content`"; reference:$Reference; classtype:$Classtype; sid:$SID; rev:1;)" `n  >> $OutputFile`.rules
   }
    if ($FileContent[$Count].type -eq "sha384"){
    $Type = @()
    $Content = @()
    $Message = @()
    $Type += $FileContent[$Count].type
    $Content += $FileContent[$Count].value
    $Message += $FileContent[$Count].type 
    $Reference += $FileContent[$Count].attribute_tag
    echo "alert ANY ANY <> ANY ANY (msg:`"$Message`"; content:`"$Content`"; reference:$Reference; classtype:$Classtype; sid:$SID; rev:1;)" `n  >> $OutputFile`.rules
   }
    if ($FileContent[$Count].type -eq "sha512"){
    $Type = @()
    $Content = @()
    $Message = @()
    $Type += $FileContent[$Count].type
    $Content += $FileContent[$Count].value
    $Message += $FileContent[$Count].type 
    $Reference += $FileContent[$Count].attribute_tag
    echo "alert ANY ANY <> ANY ANY (msg:`"$Message`"; content:`"$Content`"; reference:$Reference; classtype:$Classtype; sid:$SID; rev:1;)" `n  >> $OutputFile.rules
   }
    if ($FileContent[$Count].type -eq "authentihash"){
    $Type = @()
    $Content = @()
    $Message = @()
    $Type += $FileContent[$Count].type
    $Content += $FileContent[$Count].value
    $Message += $FileContent[$Count].type 
    $Reference += $FileContent[$Count].attribute_tag
    echo "alert ANY ANY <> ANY ANY (msg:`"$Message`"; content:`"$Content`"; reference:$Reference; classtype:$Classtype; sid:$SID; rev:1;)" `n  >> $OutputFile`.rules
   }
    if ($FileContent[$Count].type -eq "ssdeep"){
    $Type = @()
    $Content = @()
    $Message = @()
    $Type += $FileContent[$Count].type
    $Content += $FileContent[$Count].value
    $Message += $FileContent[$Count].type 
    $Reference += $FileContent[$Count].attribute_tag
    echo "alert ANY ANY <> ANY ANY (msg:`"$Message`"; content:`"$Content`"; reference:$Reference; classtype:$Classtype; sid:$SID; rev:1;)" `n  >> $OutputFile`.rules
    }
     if ($FileContent[$Count].type -eq "md5"){
    $Type = @()
    $Content = @()
    $Message = @()
    $Type += $FileContent[$Count].type
    $Content += $FileContent[$Count].value
    $Message += $FileContent[$Count].type 
    $Reference += $FileContent[$Count].attribute_tag
    echo "alert ANY ANY <> ANY ANY (msg:`"$Message`"; content:`"$Content`"; reference:$Reference; classtype:$Classtype; sid:$SID; rev:1;)" `n  >> $OutputFile`.rules
    }
}

##Iterates through the file and writes pertinent info to suricata rules##
while ($Count -lt $length){
    Detect-Type
    $SID += 1
    $Count += 1
    #Write-host $SID
}

Build-Results
write-host "done"
