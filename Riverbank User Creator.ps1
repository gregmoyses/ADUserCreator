#ERASE ALL THIS AND PUT XAML BELOW between the @" "@ 
$inputXML = @"
<Window x:Class="WpfApp2.MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        xmlns:local="clr-namespace:WpfApp2"
        mc:Ignorable="d"
        Title="Riverbank User Creator" Width="628" Height="499.667">
    <Grid Margin="0,3,3.333,28.333">
        <Grid.ColumnDefinitions>
            <ColumnDefinition Width="0*"/>
            <ColumnDefinition/>
        </Grid.ColumnDefinitions>
        <TabControl Grid.ColumnSpan="2" Margin="0,69,0,-27.666">
            <TabItem Header="Account">
                <Grid Background="#FFE5E5E5" Margin="0,0,0,-23.333">
                    <Grid.ColumnDefinitions>
                        <ColumnDefinition Width="100*"/>
                        <ColumnDefinition Width="36*"/>
                        <ColumnDefinition Width="477*"/>
                    </Grid.ColumnDefinitions>
                    <TextBlock HorizontalAlignment="Left" Margin="20,38,0,0" TextWrapping="Wrap" Text="First Name" VerticalAlignment="Top" Height="16" Width="83" Grid.ColumnSpan="2"/>
                    <TextBlock HorizontalAlignment="Left" Margin="20,75,0,0" TextWrapping="Wrap" Text="Last Name" VerticalAlignment="Top" Height="16" Width="56"/>
                    <TextBlock HorizontalAlignment="Left" Margin="20,110,0,0" TextWrapping="Wrap" Text="Job Title" VerticalAlignment="Top" Width="83" Height="16" Grid.ColumnSpan="2"/>
                    <TextBlock HorizontalAlignment="Left" Margin="20,123,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Height="16" Width="0"/>
                    <TextBox x:Name="firstnametext" Grid.Column="2" HorizontalAlignment="Left" Height="23" Margin="29.666,38,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="179"/>
                    <TextBox x:Name="lastnametext" Grid.Column="2" HorizontalAlignment="Left" Height="23" Margin="29.666,75,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="179"/>
                    <TextBox x:Name="Jobtitletext" Grid.Column="2" HorizontalAlignment="Left" Height="23" Margin="29.666,110,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="179"/>

                    <TextBlock HorizontalAlignment="Left" Margin="20,261,0,0" TextWrapping="Wrap" Text="Password" VerticalAlignment="Top" Width="70" Height="23" RenderTransformOrigin="0.569,2.138"/>
                    <Button x:Name="createuserbutton" Content="Create User" Grid.Column="2" HorizontalAlignment="Left" Margin="330.666,274,0,0" VerticalAlignment="Top" Width="117" Height="20" IsEnabled="True"/>
                    <TextBlock x:Name="errortext" HorizontalAlignment="Left" Margin="20,299,0,0" TextWrapping="Wrap" Text="ERROR: " VerticalAlignment="Top" Height="65" Width="563" Grid.ColumnSpan="3" FontWeight="Bold" Visibility="Hidden"/>
                    <TextBlock HorizontalAlignment="Left" Margin="20,144,0,0" TextWrapping="Wrap" Text="Direct Number" VerticalAlignment="Top" Width="93" Grid.ColumnSpan="2"/>
                    <TextBox x:Name="directnumbertext" Grid.Column="2" HorizontalAlignment="Left" Height="23" Margin="29.666,144,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="179"/>
                    <TextBlock HorizontalAlignment="Left" Margin="20,180,0,0" TextWrapping="Wrap" Text="Department" VerticalAlignment="Top" Width="83" Grid.ColumnSpan="2"/>
                    <TextBox x:Name="departmenttext" Grid.Column="2" HorizontalAlignment="Left" Height="23" Margin="29.666,180,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="179"/>
                    <TextBox x:Name="callgrouptext" Grid.Column="2" HorizontalAlignment="Left" Height="23" Margin="29.666,217,0,0" TextWrapping="Wrap" Text="e.g. HR +44 1869 814 275" VerticalAlignment="Top" Width="179"/>
                    <TextBox x:Name="passwordtext" Grid.Column="2" HorizontalAlignment="Left" Margin="29.666,261,0,0" VerticalAlignment="Top" Width="179" Height="23"/>
                    <TextBlock HorizontalAlignment="Left" Margin="20,217,0,0" TextWrapping="Wrap" Text="Call Group" VerticalAlignment="Top" Width="70"/>
                </Grid>
            </TabItem>
            <TabItem Header="Groups">
                <Grid Background="#FFE5E5E5" Margin="0,-2,0,0">
                    <Grid.ColumnDefinitions>
                        <ColumnDefinition Width="7*"/>
                        <ColumnDefinition Width="29*"/>
                    </Grid.ColumnDefinitions>
                    <ComboBox x:Name="groupcombobox" HorizontalAlignment="Left" Margin="2.333,55,0,0" VerticalAlignment="Top" Width="216" Height="22" Grid.Column="1"/>
                    <TextBlock x:Name="selectgrouptext" HorizontalAlignment="Left" Margin="24,55,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Text="Select Group" Height="16" Width="85"/>
                    <Button x:Name="addgroupbutton" Content="Add" Grid.Column="1" HorizontalAlignment="Left" Margin="230.333,55,0,0" VerticalAlignment="Top" Width="75" Height="20"/>
                    <ListBox x:name="addedgroupstextarea" HorizontalAlignment="Left" Height="195" Margin="2.333,96,0,0" VerticalAlignment="Top" Width="216" Grid.Column="1"/>
                </Grid>
            </TabItem>
        </TabControl>
        <Image Grid.ColumnSpan="2" HorizontalAlignment="Left" Height="54" Margin="10,10,0,0" VerticalAlignment="Top" Width="183" Source="c:\users\greg\desktop\transparent-logo-smalll.png"/>

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


$WPFcreateuserbutton.Add_Click({

    
    ##Resolve Form Settings
    $hash = Get-FormFields
    Try
	    {
                 
            New-ADUser @hash  -OtherAttributes @{ipPhone = ($WPFdirectnumbertext.text); proxyAddresses = ("SMTP:" + $WPFfirstNametext.Text.SubString(0,1)+ $WPFlastNametext.Text+"@oxts.com")} -PassThru -Enabled $true
            
            Invoke-Command -ComputerName OXTS-DC1 -ScriptBlock { Start-ADSyncSyncCycle } -ErrorAction Stop
            
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

    
    #$Form.Close()
})

$WPFcreateuserbutton.Add_Click({
   ##Resolve Form Settings
    
    Write-host $WPFdisplayNametext.Text

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