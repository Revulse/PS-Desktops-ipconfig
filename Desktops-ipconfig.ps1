Function CreateArray {

    $computer_names = Get-ADGroupmember -Identity "CR Desktops" | select -expandproperty name
   
        return $computer_names
}

ForEach ($Desktop in CreateArray) {

    $Date = Get-Date -UFormat "%Y_%m_%d"
    $Filename = $Desktop + '   ' + $Date

            Invoke-Command -ComputerName $Desktop -ScriptBlock {ipconfig /all} >> "\\atrdc2\scripts\PowerShell\logs\ipconfig-Logs\$Filename.txt"
            }