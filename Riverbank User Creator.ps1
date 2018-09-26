#ERASE ALL THIS AND PUT XAML BELOW between the @" "@ 
$inputXML = @"
<Window x:Class="WpfApp2.MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        xmlns:local="clr-namespace:WpfApp2"
        mc:Ignorable="d"
        Title="Riverbank User Creator" Width="914" Height="517">
    <Grid Margin="0,3,3.333,28.333">
        <Grid.ColumnDefinitions>
            <ColumnDefinition Width="0*"/>
            <ColumnDefinition/>
        </Grid.ColumnDefinitions>
        <TabControl Grid.ColumnSpan="2" Margin="0,69,0,-27.666">
            <TabItem Header="Account">
                <Grid Background="#FFE5E5E5" Margin="-3,0,3,-50.667">
                    <Grid.ColumnDefinitions>
                        <ColumnDefinition Width="100*"/>
                        <ColumnDefinition Width="36*"/>
                        <ColumnDefinition Width="477*"/>
                    </Grid.ColumnDefinitions>
                    <Border BorderBrush="Black" BorderThickness="1" HorizontalAlignment="Left" Height="301" Margin="20,10,0,0" VerticalAlignment="Top" Width="419" Grid.ColumnSpan="3">
                        <TextBlock TextWrapping="Wrap" Margin="9,9,353,269"><Run FontWeight="Bold" Text="General"/></TextBlock>
                    </Border>
                    <Border BorderBrush="Black" BorderThickness="1" Grid.Column="2" HorizontalAlignment="Left" Height="301" Margin="283.667,10,0,0" VerticalAlignment="Top" Width="391">
                        <TextBlock TextWrapping="Wrap" Margin="8.667,8.667,336,269"><Run FontWeight="Bold" Text="Groups"/></TextBlock>
                    </Border>
                    <TextBlock HorizontalAlignment="Left" Margin="40,53,0,0" TextWrapping="Wrap" Text="First Name" VerticalAlignment="Top" Height="16" Width="83"/>
                    <TextBlock HorizontalAlignment="Left" Margin="40,90,0,0" TextWrapping="Wrap" Text="Last Name" VerticalAlignment="Top" Height="16" Width="56"/>
                    <TextBlock HorizontalAlignment="Left" Margin="40,125,0,0" TextWrapping="Wrap" Text="Job Title" VerticalAlignment="Top" Width="83" Height="16"/>
                    <TextBlock HorizontalAlignment="Left" Margin="20,123,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Height="16" Width="0"/>
                    <TextBox x:Name="firstnametext" Grid.Column="2" HorizontalAlignment="Left" Height="23" Margin="50,46,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="179"/>
                    <TextBox x:Name="lastnametext" Grid.Column="2" HorizontalAlignment="Left" Height="23" Margin="49.667,90,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="179"/>
                    <TextBox x:Name="Jobtitletext" Grid.Column="2" HorizontalAlignment="Left" Height="23" Margin="49.667,125,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="179"/>

                    <TextBlock HorizontalAlignment="Left" Margin="40,276,0,0" TextWrapping="Wrap" Text="Password" VerticalAlignment="Top" Width="70" Height="23" RenderTransformOrigin="0.569,2.138"/>

                    <TextBlock x:Name="errortext" HorizontalAlignment="Left" Margin="20,316,0,0" TextWrapping="Wrap" Text="ERROR: " VerticalAlignment="Top" Height="65" Width="563" Grid.ColumnSpan="3" FontWeight="Bold" Visibility="Hidden"/>
                    <TextBlock HorizontalAlignment="Left" Margin="40,159,0,0" TextWrapping="Wrap" Text="Direct Number" VerticalAlignment="Top" Width="93"/>
                    <TextBox x:Name="directnumbertext" Grid.Column="2" HorizontalAlignment="Left" Height="23" Margin="49.667,159,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="179"/>
                    <TextBlock HorizontalAlignment="Left" Margin="40,195,0,0" TextWrapping="Wrap" Text="Department" VerticalAlignment="Top" Width="83"/>
                    <TextBox x:Name="departmenttext" Grid.Column="2" HorizontalAlignment="Left" Height="23" Margin="49.667,195,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="179"/>
                    <TextBox x:Name="callgrouptext" Grid.Column="2" HorizontalAlignment="Left" Height="23" Margin="49.667,232,0,0" TextWrapping="Wrap" Text="e.g. HR: +44 1869 814 275" VerticalAlignment="Top" Width="179"/>
                    <TextBox x:Name="passwordtext" Grid.Column="2" HorizontalAlignment="Left" Margin="49.667,276,0,0" VerticalAlignment="Top" Width="179" Height="23"/>
                    <Button x:Name="createuserbutton" Content="Create User" Grid.Column="2" HorizontalAlignment="Left" Margin="557.667,349,0,0" VerticalAlignment="Top" Width="117" Height="20" IsEnabled="True"/>
                    <TextBlock HorizontalAlignment="Left" Margin="40,232,0,0" TextWrapping="Wrap" Text="Call Group" VerticalAlignment="Top" Width="70"/>
                    <ListBox x:Name="addedgroupstextarea" HorizontalAlignment="Left" Height="168" Margin="403.667,91,0,0" VerticalAlignment="Top" Width="154" Grid.Column="2"/>
                    <ComboBox x:Name="groupcombobox" HorizontalAlignment="Left" Margin="403.667,59,0,0" VerticalAlignment="Top" Width="154" Height="22" Grid.Column="2"/>
                    <TextBlock x:Name="selectgrouptext" HorizontalAlignment="Left" Margin="298.667,59,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Text="Select Group" Height="16" Width="85" Grid.Column="2" RenderTransformOrigin="0.936,0.597"/>
                    <Button x:Name="addgroupbutton" Content="Add" Grid.Column="2" HorizontalAlignment="Left" Margin="584.667,65,0,0" VerticalAlignment="Top" Width="75" Height="20"/>
                    <Button x:Name="removegroupbutton" Content="Remove" Grid.Column="2" HorizontalAlignment="Left" Margin="584.667,98,0,0" VerticalAlignment="Top" Width="75" Height="20"/>
                </Grid>
            </TabItem>
        </TabControl>
        <Image Grid.ColumnSpan="2" HorizontalAlignment="Left" Height="54" Margin="10,10,0,0" VerticalAlignment="Top" Width="183" Source="C:\Users\riverbank.admin\Desktop\Riverbank User Creator\rblogo.png"/>
        <Image x:Name="oxtsimage" Grid.ColumnSpan="2" HorizontalAlignment="Left" Height="71" Margin="767,10,0,0" VerticalAlignment="Top" Width="126" Source="C:\Users\riverbank.admin\Desktop\Riverbank User Creator\oxts.png"/>

    </Grid>
</Window>
    
    
"@        

$inputXML = $inputXML -replace 'mc:Ignorable="d"','' -replace "x:N",'N'  -replace '^<Win.*', '<Window'


[void][System.Reflection.Assembly]::LoadWithPartialName('presentationframework')
[xml]$XAML = $inputXML
#Read XAML

    $reader=(New-Object System.Xml.XmlNodeReader $xaml) 
  try{$Form=[Windows.Markup.XamlReader]::Load( $reader )}
catch{Write-Host "Unable to load Windows.Markup.XamlReader. Double-check syntax and ensure .net is installed."}

#===========================================================================
# Store Form Objects In PowerShell
#===========================================================================

$xaml.SelectNodes("//*[@Name]") | %{Set-Variable -Name "WPF$($_.Name)" -Value $Form.FindName($_.Name)}

Function Get-FormVariables{
if ($global:ReadmeDisplay -ne $true){Write-host "If you need to reference this display again, run Get-FormVariables" -ForegroundColor Yellow;$global:ReadmeDisplay=$true}
write-host "Found the following interactable elements from our form" -ForegroundColor Cyan
get-variable WPF*
}

Get-FormVariables

#===========================================================================
# Actually make the objects work
#===========================================================================

#Resolve the default OU to show where the user will end up
#$defaultOU = (get-adobject -filter 'ObjectClass -eq "domain"' -Properties wellKnownObjects).wellknownobjects.Split("`n")[-1].Split(':') | select -Last 1
 #$WPFDefaultOUMsg.Text = $WPFDefaultOUMsg.Text -replace "@anchor",$defaultOU

#gather all of the settings the user specifies, needed to splat to the New-ADUser Cmd later
function Get-FormFields {

    $HashArguments = 
       @{ Name = $WPFfirstNametext.Text + " " + $WPFlastNametext.Text;
          DisplayName =  $WPFfirstNametext.Text + " " + $WPFlastNametext.Text;
          Description = $WPFJobtitletext.Text;
          SamAccountName = $WPFfirstNametext.Text.SubString(0,1)+ $WPFlastNametext.Text;
          UserPrincipalName = $WPFfirstNametext.Text.SubString(0,1)+ $WPFlastNametext.Text + "@potter.local";
          Title = $WPFJobtitletext.Text;
          GivenName=$WPFfirstNametext.Text;
          Fax = $WPFcallgrouptext.Text;
          SurName = $WPFlastNametext.Text;
          AccountPassword=($WPFpasswordtext.text | ConvertTo-SecureString -AsPlainText -Force);
          Homedrive = "U";
          Homedirectory = "\\oxts.local\Shares\Users\"+$WPFfirstNametext.Text.SubString(0,1)+ $WPFlastNametext.Text;
          OfficePhone = $WPFdirectnumbertext.text;
          Company = "Oxford Technical Solutions";
          emailaddress = $WPFfirstNametext.Text.SubString(0,1)+ $WPFlastNametext.Text + "@oxts.local";
          }
    
    $HashArguments
}


$WPFcreateuserbutton.Add_Click({
    (Get-FormFields)
})

#Populate groups drop-down
$groups = Get-ADGroup -Filter 'GroupCategory -eq "Security"' | select name 
$groups | ForEach-Object {$_.Name} | ForEach-object {$WPFgroupcomboBox.AddChild($_)}

$WPFaddgroupbutton.Add_Click({

    $WPFaddedgroupstextarea.Items.Add($WPFgroupcomboBox.text)

})

$WPFremovegroupbutton.Add_Click({

    $WPFaddedgroupstextarea.Items.Remove($WPFaddedgroupstextarea.selectedItem);

})


$WPFcreateuserbutton.Add_Click({

    
    ##Resolve General Settings
    $hash = Get-FormFields

    
    Try
	    {
                 
            New-ADUser @hash  -OtherAttributes @{c="GB"; ipPhone = ($hash['OfficePhone']); proxyAddresses = ("SMTP:" + $hash['emailaddress'] )} -PassThru -Enabled $true
            
            Invoke-Command -ComputerName OXTS-DC1 -ScriptBlock { Start-ADSyncSyncCycle } -ErrorAction Stop

            ## Connect to MS online and assign license
            Import-Module MSOnline
            $pass = Get-Credential
            $mycred = new-object -typename System.Management.Automation.PSCredential $pass
            $O365Cred = Get-Credential $mycred
            Connect-MsolService -Credential $O365Cred
            
            Set-MsolUserLicense -UserPrincipalName $hash['UserPrincipalName'] -AddLicenses "OxfordTechnicalSolutions:ENTERPRISEPACK"
            Set-MsolUserLicense -UserPrincipalName $hash['UserPrincipalName'] -AddLicenses "OxfordTechnicalSolutions:ATP_ENTERPRISE"
            
            
    	}Catch
		{
		    $InfoMessage = $_
			$InfoTitle = "Warning"
            
            if ($WPFerrortext.Visibility -ne 'Visible'){
                $WPFerrortext.Visibility = 'Visible'
            }
            
            $WPFerrortext.text = "ERROR:" + $InfoMessage
			write-host $InfoMessage
						
	    }

    ## Add user to groups
    

    $User = Get-ADUser -Filter * | Where-Object { ($_.UserPrincipalName -eq ($hash['UserPrincipalName']))  }
    $groupsText = $WPFaddedgroupstextarea.Items
     
    foreach ($Group in $WPFaddedgroupstextarea.Items)
    {
        write-host "Adding $SamAccountName to the following group: $Group"
        $groupDN = get-adgroup $Group |  Select-Object -ExpandProperty  distinguishedname
        Add-ADGroupMember -Identity $groupDN $hash.item('SamAccountName')
    }      


    
    #$Form.Close()
})


##Reference Sample entry of how to add data to a field
    ##$vmpicklistView.items.Add([pscustomobject]@{'VMName'=($_).Name;Status=$_.Status;Other="Yes"})
    ##$WPFtextBox.Text = $env:COMPUTERNAME
    #$WPFbutton.Add_Click({$WPFlistView.Items.Clear();start-sleep -Milliseconds 840;Get-DiskInfo -computername $WPFtextBox.Text | % {$WPFlistView.AddChild($_)}  })

#===========================================================================
# Shows the form
#===========================================================================
write-host "To show the form, run the following" -ForegroundColor Cyan

function Show-Form{
$Form.ShowDialog() | out-null

}

Show-Form
