######
######  User Creator 
######
######  Gregory Moyses 01/10/18


#Setup Logging
$Path = $scriptPath 

function Write-Log {
    Param(
        $Message,
        $Path = $scriptPath 
    )
    write-host $Message
}
   
$scriptPath = $scriptPath + "\User Creator Log.log"

##check if we're running as admin
IF ([bool](([System.Security.Principal.WindowsIdentity]::GetCurrent()).groups -match "S-1-5-32-544"))
{
    write-log "Running as admin"
    
}else {
        write-log "Not running as admin. Quitting"
        $wshell = New-Object -ComObject Wscript.Shell
        $wshell.Popup("Run it as admin you donut.",0,"Error",0x1)
    exit
}

#PUT XAML BELOW between the @" "@ 
$inputXML = @"
<Window x:Class="WpfApp2.MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        xmlns:local="clr-namespace:WpfApp2"
        mc:Ignorable="d"
        Title="User Creator" Width="918" Height="659" ResizeMode="NoResize">
    <Grid Margin="0,3,3.333,28.333">
        <Grid.ColumnDefinitions>
            <ColumnDefinition Width="0*"/>
            <ColumnDefinition/>
        </Grid.ColumnDefinitions>
        <TabControl Grid.ColumnSpan="2" Margin="0,69,0,-27.666">
            <TabItem Header="Account">
                <Grid Background="#FFE5E5E5" Margin="-3,0,3,-101">
                    <Grid.ColumnDefinitions>
                        <ColumnDefinition Width="100*"/>
                        <ColumnDefinition Width="36*"/>
                        <ColumnDefinition Width="477*"/>
                    </Grid.ColumnDefinitions>
                    <Border BorderBrush="Black" BorderThickness="1" Margin="0,289,21,248" Grid.Column="2" HorizontalAlignment="Right" Width="180"/>
                    <Border BorderBrush="Black" BorderThickness="1" HorizontalAlignment="Left" Height="359" Margin="20,10,0,0" VerticalAlignment="Top" Width="419" Grid.ColumnSpan="3">
                        <TextBlock TextWrapping="Wrap" Text="Call Group" HorizontalAlignment="Left" Margin="18,0,0,60" VerticalAlignment="Bottom" Width="70"/>
                    </Border>
                    <Border BorderBrush="Black" BorderThickness="1" Grid.Column="2" Height="267" Margin="284,10,26,0" VerticalAlignment="Top" >
                        <TextBlock TextWrapping="Wrap" Margin="8.667,8.667,336,269"><Run FontWeight="Bold" Text="Groups"/></TextBlock>
                    </Border>
                    <TextBlock HorizontalAlignment="Left" Margin="40,53,0,0" TextWrapping="Wrap" Text="First Name" VerticalAlignment="Top" Height="16" Width="83"/>
                    <TextBlock Margin="40,118,37,0" TextWrapping="Wrap" Text="Last Name" VerticalAlignment="Top" Height="16"/>
                    <TextBlock Margin="40,188,24,0" TextWrapping="Wrap" Text="Job Title" VerticalAlignment="Top" Height="16"/>
                    <TextBlock HorizontalAlignment="Left" Margin="20,123,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Height="16" Width="0"/>
                    <TextBox x:Name="firstnametext" Grid.Column="2" HorizontalAlignment="Left" Height="23" Margin="50,46,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="179"/>
                    <TextBox x:Name="middlenametextbox" Grid.Column="2" Height="23" Margin="50,79,0,0" TextWrapping="Wrap" VerticalAlignment="Top" HorizontalAlignment="Left" Width="179"/>
                    <TextBox x:Name="lastnametext" Grid.Column="2" HorizontalAlignment="Left" Height="23" Margin="50,116,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="179"/>
                    <TextBox x:Name="usernametextbox" Grid.Column="2" HorizontalAlignment="Left" Height="23" Margin="50,153,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="179" Text="e.g. jsmith@<email>.com"/>
                    <TextBox x:Name="Jobtitletext" Grid.Column="2" HorizontalAlignment="Left" Height="23" Margin="50,188,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="179"/>
                    <TextBox x:Name="directnumbertext" Grid.Column="2" HorizontalAlignment="Left" Height="23" Margin="50,222,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="179"/>
                    <TextBox x:Name="departmenttext" Grid.Column="2" HorizontalAlignment="Left" Height="23" Margin="50,258,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="179"/>
                    <TextBox x:Name="callgrouptext" Grid.Column="2" HorizontalAlignment="Left" Height="23" Margin="50,291,0,311" TextWrapping="Wrap" Text="e.g. HR: +44 1869 814 275" Width="179"/>
                    <TextBox x:Name="passwordtext" Grid.Column="2" HorizontalAlignment="Left" Margin="50,0,0,274" VerticalAlignment="Bottom" Width="179" Height="23"/>
                    <TextBlock Margin="40,0,37,274" TextWrapping="Wrap" Text="Password" VerticalAlignment="Bottom" Height="23" RenderTransformOrigin="0.569,2.138"/>
                    <TextBlock x:Name="errortext" HorizontalAlignment="Left" Margin="22,383,0,0" TextWrapping="Wrap" Text="ERROR: " VerticalAlignment="Top" Height="86" Width="707" Grid.ColumnSpan="3" FontWeight="Bold" Foreground="Red" Visibility="Hidden"/>
                    <TextBlock Margin="40,222,14,0" TextWrapping="Wrap" Text="Direct Number" VerticalAlignment="Top"/>
                    <TextBlock Margin="40,258,24,0" TextWrapping="Wrap" Text="Department" VerticalAlignment="Top"/>
                    <Button x:Name="createuserbutton" Content="Create User" Grid.Column="2" HorizontalAlignment="Left" Margin="558,388,0,0" VerticalAlignment="Top" Width="117" Height="20" IsEnabled="True"/>
                    <ListBox x:Name="addedgroupstextarea" HorizontalAlignment="Left" Height="168" Margin="403.667,91,0,0" VerticalAlignment="Top" Width="154" Grid.Column="2"/>
                    <ComboBox x:Name="groupcombobox" HorizontalAlignment="Left" Margin="403.667,59,0,0" VerticalAlignment="Top" Width="154" Height="22" Grid.Column="2"/>
                    <TextBlock x:Name="selectgrouptext" HorizontalAlignment="Left" Margin="298.667,59,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Text="Select Group" Height="16" Width="85" Grid.Column="2" RenderTransformOrigin="0.936,0.597"/>
                    <Button x:Name="addgroupbutton" Content="Add" Grid.Column="2" HorizontalAlignment="Left" Margin="584.667,65,0,0" VerticalAlignment="Top" Width="75" Height="20"/>
                    <Button x:Name="removegroupbutton" Content="Remove" Grid.Column="2" HorizontalAlignment="Left" Margin="584.667,98,0,0" VerticalAlignment="Top" Width="75" Height="20"/>
                    <RadioButton x:Name="excludemarketingradiobutton" Content="Exclude" HorizontalAlignment="Right" Margin="0,0,33,299" GroupName="signature" Width="66" RenderTransformOrigin="7.182,1.6" Grid.Column="2" VerticalAlignment="Bottom"/>
                    <RadioButton x:Name="includemarketingradiobutton" Content="Include" HorizontalAlignment="Right" Margin="0,0,33,276" VerticalAlignment="Bottom" GroupName="signature" Width="66" RenderTransformOrigin="7.182,1.6" Grid.Column="2"/>
                    <TextBlock Margin="0,299,109,269" TextWrapping="Wrap" Grid.Column="2" HorizontalAlignment="Right" Width="86"><Run FontWeight="Bold" Text="Marketing info in email signature"/></TextBlock>
                    <TextBlock x:Name="ADlogtextblock" HorizontalAlignment="Left" Margin="20,444,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Grid.ColumnSpan="3" Width="707" />
                    <TextBlock x:Name="MSOLerror" HorizontalAlignment="Left" Margin="20,465,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Grid.ColumnSpan="3" Width="707" />
                    <TextBlock Margin="40,85,24,0" TextWrapping="Wrap" Text="Middle Name" VerticalAlignment="Top"/>
                    <TextBlock Margin="40,153,0,0" TextWrapping="Wrap" Text="Desired Username" VerticalAlignment="Top" MinWidth="107" MinHeight="16"/>
                    <Border BorderBrush="Black" BorderThickness="1" Grid.Column="2" Margin="284,289,211,248"/>
                        
                    <TextBlock Grid.Column="2" Margin="294,297,334,0" TextWrapping="Wrap" Height="17" VerticalAlignment="Top"><Run FontWeight="Bold" Text="365 License"/></TextBlock>
                    <RadioButton x:Name="e1radiobutton" Content="E1" Grid.Column="2" HorizontalAlignment="Right" Margin="0,299,280,303" RenderTransformOrigin="-0.344,-0.333" Width="44"/>
                    <RadioButton x:Name="e3radiobutton" Content="E3" Grid.Column="2" HorizontalAlignment="Right" Margin="0,0,292,273" VerticalAlignment="Bottom" RenderTransformOrigin="0,-0.467" IsChecked="True"/>
                    <CheckBox x:Name="atpcheckbox" Content="ATP" Grid.Column="2" HorizontalAlignment="Right" Margin="0,0,228,271" VerticalAlignment="Bottom" IsChecked="True"/>
                    


                </Grid>
            </TabItem>
        </TabControl>
        <Image Grid.ColumnSpan="2" HorizontalAlignment="Left" Height="54" Margin="10,10,0,0" VerticalAlignment="Top" Width="183" Source="C:\Users\admin\Desktop\User Creator\Logos\rblogo.png"/>
        <Image x:Name="image" Grid.ColumnSpan="2" HorizontalAlignment="Left" Height="71" Margin="767,10,0,0" VerticalAlignment="Top" Width="126" Source="C:\Users\admin\Desktop\User Creator\Logos\image.png"/>

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
Try 
    {

    $HashArguments = 
       @{ Name = $WPFfirstNametext.Text + " " + $WPFlastNametext.Text;
          DisplayName =  $WPFfirstNametext.Text + " " + $WPFlastNametext.Text;
          Description = $WPFJobtitletext.Text;
          UserPrincipalName = $WPFusernametextbox.Text.tolower();
          SamAccountName = $WPFusernametextbox.Text.tolower().SubString(0,($WPFusernametextbox.Text.IndexOf("@"))).tolower();
          Title = $WPFJobtitletext.Text;
          GivenName=$WPFfirstNametext.Text;
          Fax = $WPFcallgrouptext.Text;
          SurName = $WPFlastNametext.Text;
          AccountPassword=($WPFpasswordtext.text | ConvertTo-SecureString -AsPlainText -Force);
          OfficePhone = $WPFdirectnumbertext.text;
          emailaddress = $WPFusernametextbox.Text.tolower();
          }
    
    }Catch{
        $InfoMessage = $_
		$InfoTitle = "Warning"
           
        if ($WPFerrortext.Visibility -ne 'Visible'){
            $WPFerrortext.Visibility = 'Visible'
        }
            
        $WPFerrortext.text = "ERROR: Error gathering data from form. Have you filled in all the fields?"
		write-log "Error gathering data from form. Have you filled in all the fields?"
        #exit
    }

    $HashArguments
}


#Populate groups drop-down
$groups = Get-ADGroup -Filter '*' | sort-object | select samaccountname 
$groups | ForEach-Object {$_.samaccountname} | ForEach-object {$WPFgroupcomboBox.AddChild($_)}


$WPFcreateuserbutton.Add_Click({
    (Get-FormFields)
})


$WPFaddgroupbutton.Add_Click({

    $WPFaddedgroupstextarea.Items.Add($WPFgroupcomboBox.text)

})

$WPFremovegroupbutton.Add_Click({

    $WPFaddedgroupstextarea.Items.Remove($WPFaddedgroupstextarea.selectedItem);

})
$WPFcreateuserbutton.IsEnabled = $false

$WPFfirstnametext.Add_TextChanged({
	if ($WPFfirstnametext.Text.Length -ne 0 -AND $WPFlastnametext.Text.Length -ne 0)
	{
		$WPFcreateuserbutton.IsEnabled = $true
	}
	else
	{
        $WPFcreateuserbutton.IsEnabled = $false
	}
})



$WPFlastnametext.Add_TextChanged({
	if ($WPFfirstnametext.Text.Length -ne 0 -AND $WPFlastnametext.Text.Length -ne 0)
	{
		$WPFcreateuserbutton.IsEnabled = $true
	}
	else
	{
        $WPFcreateuserbutton.IsEnabled = $false
	}
})



$WPFcreateuserbutton.Add_Click({


    Write-Log "Creating User.."
      
    
    ##Resolve General Settings
    $hash = Get-FormFields

        

    #Create AD user and sync to 365
    if (!$hash['OfficePhone'])
    {
        New-ADUser @hash  -OtherAttributes @{c="GB"; proxyAddresses = ("SMTP:" + $hash['emailaddress']) } -PassThru -Enabled $true
    }else{
        New-ADUser @hash  -OtherAttributes @{c="GB"; ipPhone = ($hash['OfficePhone']); proxyAddresses = ("SMTP:" + $hash['emailaddress'] )} -PassThru -Enabled $true
    }
						
	

   
        
    #check AD user was created
    if ($WPFADlogtextblock.Visibility -ne 'Visible'){
            $WPFADlogtextblock.Visibility = 'Visible'
    }
    $user = get-aduser -identity $hash['SamAccountName']
    
    if ($user -eq $null)
    {
        $WPFADlogtextblock.text = "AD User creation failed. Please inform Greg"
        Write-Log "AD User creation failed. Please inform Greg"
    }else{
        $WPFADlogtextblock.text = "AD User creation complete."
        Write-Log "AD User creation complete."
    }


        try
        {

        Start-ADSyncSyncCycle -PolicyType Delta

        }Catch{
            $InfoMessage = $_
			$InfoTitle = "Warning"
            
            if ($WPFerrortext.Visibility -ne 'Visible'){
                $WPFerrortext.Visibility = 'Visible'
            }
            
            $WPFerrortext.text = "ERROR:" + $InfoMessage
			write-log "Error running AD sync."
        }

    #Add user to AD security groups
    $User = Get-ADUser -Filter * | Where-Object { ($_.UserPrincipalName -eq ($hash['UserPrincipalName']))  }
    $groupsText = $WPFaddedgroupstextarea.Items
         
    foreach ($Group in $WPFaddedgroupstextarea.Items)
    {
        Try
            {

            write-log "Adding $SamAccountName to the following group: $Group"
            $groupDN = get-adgroup $Group |  Select-Object -ExpandProperty  distinguishedname
            Add-ADGroupMember -Identity $groupDN $hash.item('SamAccountName')
    
            }Catch
            {
                $InfoMessage = $_
    		    $InfoTitle = "Warning"
                
                if ($WPFerrortext.Visibility -ne 'Visible'){
                    $WPFerrortext.Visibility = 'Visible'
                }
                    
                $WPFerrortext.text = "ERROR:" + $InfoMessage
			    write-log "Error adding AD user to groups."
		    }
    }

  
    ## Connect to MS online and assign license
    Try
	    {
            
            Import-Module MSOnline
            $pass = Get-Credential
            $mycred = new-object -typename System.Management.Automation.PSCredential $pass
            $O365Cred = Get-Credential $mycred
            Connect-MsolService -Credential $O365Cred

            ##Wait for account to sync to 365 before assigning license
            $ts = New-TimeSpan -Minutes 2
							
            $TermLoop = ((get-date) + $ts).ToString("HH:mm")
            Do
            {
                $DateNow = (Get-date).ToString("HH:mm")
                write-log 'Pausing for 30 seconds for account to sync to 365'
                Start-Sleep -Seconds 10
                write-log '20 seconds remaining'
                Start-Sleep -Seconds 10
                write-log '10 seconds remaining'
                Start-Sleep -Seconds 10
                write-log 'Done'
                write-log 'Checking to see if the account has been created, if account is not present will wait another 30 seconds'
                write-log 'Loop will exit 2 minutes after it began regardless of account creation'
            }
    
            Until (((Get-MsolUser -UserPrincipalName $hash['UserPrincipalName'] -ErrorAction SilentlyContinue) -ne $null) -or ($DateNow -eq $TermLoop))
            
            $365user = Get-MsolUser -UserPrincipalName $hash['UserPrincipalName'] -ErrorAction SilentlyContinue
            
            if ($WPFMSOLerror.Visibility -ne 'Visible'){
                $WPFMSOLerror.Visibility = 'Visible'
            }

            if ($365user -eq $null)
            {
                $WPFMSOLerror.text = "365 User creation failed. Please inform Greg"
                write-log "365 User creation failed. Please inform Greg"
            }else{
               $WPFMSOLerror.text = "365 User creation complete. Now check it's all set up correctly!"
               write-log "365 User creation complete. Now check it's all set up correctly!"
            }


            if ($WPFe3radiobutton.IsChecked -eq $true) {
                Set-MsolUserLicense -UserPrincipalName $hash['UserPrincipalName'] -AddLicenses "<companyName>:ENTERPRISEPACK"

            }elseif ($WPFe1radiobutton.Ischecked -eq $true) {
                Set-MsolUserLicense -UserPrincipalName $hash['UserPrincipalName'] -AddLicenses "<companyName>:STANDARDPACK"
            }

            if ($atpcheckbox.Ischecked -eq $true) {
                Set-MsolUserLicense -UserPrincipalName $hash['UserPrincipalName'] -AddLicenses "<companyName>:ATP_ENTERPRISE"
            }
            write-log "365 User created. Check 365 to make sure the user setup is correctly".

        }Catch
		{
		    $InfoMessage = $_
			$InfoTitle = "Warning"
            
            if ($WPFerrortext.Visibility -ne 'Visible'){
                $WPFerrortext.Visibility = 'Visible'
            }
            
            $WPFerrortext.text = "ERROR:" + $InfoMessage
			write-log "Error assigning 365 license to user."
		
        }
          
        
 
    #$Form.Close()
})


#===========================================================================
# Shows the form
#===========================================================================
write-host "To show the form, run the following" -ForegroundColor Cyan

function Show-Form{
    $Form.ShowDialog() | out-null
}

Show-Form




