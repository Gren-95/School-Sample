Write-host "`n"
Write-host '#  ./$$....../$$................./$$..........'                                     # This part is optional
Write-host '#  |.$$$..../$$$................|.$$..........'
Write-host '#  |.$$$$../$$$$../$$$$$$.../$$$$$$$../$$$$$$.'
Write-host '#  |.$$.$$/$$.$$.|____..$$./$$__..$$./$$__..$$'
Write-host '#  |.$$..$$$|.$$../$$$$$$$|.$$..|.$$|.$$$$$$$$'
Write-host '#  |.$$\..$.|.$$./$$__..$$|.$$..|.$$|.$$_____/'
Write-host '#  |.$$.\/..|.$$|..$$$$$$$|..$$$$$$$|..$$$$$$$'
Write-host '#  |__/.....|__/.\_______/.\_______/.\_______/'
Write-host '#  ...........................................'
Write-host '#  ...........................................'
Write-host '#  ./$$.......................................'
Write-host '#  |.$$.......................................'
Write-host '#  |.$$$$$$$../$$.../$$.......................'
Write-host '#  |.$$__..$$|.$$..|.$$.......................'
Write-host '#  |.$$..\.$$|.$$..|.$$.......................'
Write-host '#  |.$$..|.$$|.$$..|.$$.......................'
Write-host '#  |.$$$$$$$/|..$$$$$$$.......................'
Write-host '#  |_______/..\____..$$.......................'
Write-host '#  .........../$$..|.$$.......................'
Write-host '#  ..........|..$$$$$$/.......................'
Write-host '#  ...........\______/........................'
Write-host '#  ...........................................'
Write-host '#  ...........................................'
Write-host '#  ............/$$$$$$........................'
Write-host '#  .........../$$__..$$.......................'
Write-host '#  ../$$$$$$.|.$$..\__//$$$$$$................'
Write-host '#  ./$$__..$$|.$$$$.../$$__..$$...............'
Write-host '#  |.$$$$$$$$|.$$_/..|.$$$$$$$$...............'
Write-host '#  |.$$_____/|.$$....|.$$_____/...............'
Write-host '#  |..$$$$$$$|.$$....|..$$$$$$$...............'
Write-host '#  .\_______/|__/.....\_______/...............'
Write-host "`n"

#https://patorjk.com/software/taag/#p=display&c=bash&w=.&f=Larry%203D&t=Test

[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")

$ApplicationForm = New-Object System.Windows.Forms.Form                                         
$ApplicationForm.StartPosition = "CenterScreen"                                                 # this option will make the window spawn in the centre of the screen
$ApplicationForm.Size = "700,500"                                                               # this option will set the size of the window
$ApplicationForm.FormBorderStyle = 'Fixed3D'                                                    # this option will add or remove the ability to resize the window
$ApplicationForm.MinimizeBox = $true                                                            # this option will add or remove the minimize box
$ApplicationForm.MaximizeBox = $false                                                           # this option will add or remove the maximize box
$ApplicationForm.Text = "Efe's Powershell Example"                                              # this option will add or remove the application title
$ApplicationForm.Topmost = $true                                                                # this option will make the window always on top of other windows


# tab Control Window
$FormTabControl = New-object System.Windows.Forms.TabControl                                    # this will add the ability to add tabs later
$FormTabControl.Size = "681,500"                                                                # this option will adjust the size of the tab control box
$FormTabControl.Location = "0,0"                                                                # this option will move the tab control box
$ApplicationForm.Controls.Add($FormTabControl)                                                  # this option will initiate the item in question



# TAB 1
#----------------------------------------------


$Tab1 = New-object System.Windows.Forms.Tabpage
$Tab1.DataBindings.DefaultDataSourceUpdateMode = 0 
$Tab1.Name = "Tab1" 
$Tab1.Text = "TAB ONE" 
$Tab1.BackColor = 'DarkGray'
$FormTabControl.Controls.Add($Tab1)


# label
$Tab1_label1 = New-Object System.Windows.Forms.Label
$Tab1_label1.Location = New-Object System.Drawing.Point(200, 50)
$Tab1_label1.Font = New-Object System.Drawing.Font('verdana', 16)
$Tab1_label1.AutoSize = $true
$Tab1_label1.ForeColor = "#000000"
$Tab1_label1.Text = ("!!!Hello World!!!")
$Tab1.Controls.Add($Tab1_label1)

# Button
$Tab1_appbutton1 = New-Object System.Windows.Forms.Button
$Tab1_appbutton1.Location = New-Object System.Drawing.Point(200, 100)
$Tab1_appbutton1.Size = New-Object System.Drawing.Size(200, 25)
$Tab1_appbutton1.Text = "Device Manager"
$Tab1_appbutton1.Add_Click({ hdwwiz.cpl <#INSERT HERE YOUR COMMAND OF CHOICE#> })
$tab1.Controls.Add($Tab1_appbutton1)

# OK Button
$Tab1_OK = New-Object System.Windows.Forms.Button
$Tab1_OK.Location = New-Object System.Drawing.Point(225, 150)
$Tab1_OK.Size = New-Object System.Drawing.Size(75, 25)
$Tab1_OK.Text = 'OK'
$Tab1_OK.DialogResult = [System.Windows.Forms.DialogResult]::OK
$tab1.Controls.Add($Tab1_OK)

# Cancel Button
$Tab1_Cancel = New-Object System.Windows.Forms.Button
$Tab1_Cancel.Location = New-Object System.Drawing.Point(300, 150)
$Tab1_Cancel.Size = New-Object System.Drawing.Size(75, 25)
$Tab1_Cancel.Text = 'Cancel'
$Tab1_Cancel.DialogResult = [System.Windows.Forms.DialogResult]::cancel
$tab1.Controls.Add($Tab1_Cancel)


# adding actions to checkboxes and message a to statusbox

$handler_Tab1_opener_Click = {
    $Tab1_Statusbox1.Items.Clear();
    if ($Tab1_checkBox1.Checked) { $Tab1_Statusbox1.Items.Add( "Opening Winver..."  ) ; winver.exe }
    if ($Tab1_checkBox2.Checked) { $Tab1_Statusbox1.Items.Add( "Opening Notepad and Explorer..."  ) ; notepad.exe ; explorer.exe }

    if ( !$Tab1_checkBox1.Checked -and !$Tab1_checkBox2.Checked) { $Tab1_Statusbox1.Items.Add("No Tab1_CheckBox selected....") } 

}

# Button to start checkboxes 
$Tab1_opener = New-Object System.Windows.Forms.Button
$Tab1_opener.Name = "Tab1_opener"
$Tab1_opener.Location = New-Object System.Drawing.Point(450, 10)
$Tab1_opener.Size = New-Object System.Drawing.Size(200, 25)
$Tab1_opener.Text = "Opener"
$Tab1_opener.add_Click($handler_Tab1_opener_Click)
$tab1.Controls.Add($Tab1_opener)

# Statusbox
$Tab1_Statusbox1 = New-Object System.Windows.Forms.ListBox
$Tab1_Statusbox1.FormattingEnabled = $True
$Tab1_Statusbox1.Location = New-Object System.Drawing.Point(525, 335)
$Tab1_Statusbox1.Size = New-Object System.Drawing.Size(200, 100)
$Tab1_Statusbox1.Name = "Tab1_Statusbox1"
$tab1.Controls.Add($Tab1_Statusbox1)





# Checkboxes
$Tab1_checkBox1 = New-Object System.Windows.Forms.CheckBox
$Tab1_checkBox1.Location = New-Object System.Drawing.Point(10, 50)
$Tab1_checkBox1.Size = New-Object System.Drawing.Size(100, 25)
$Tab1_checkBox1.Text = "Winver"
$Tab1_checkBox1.Name = "Tab1_checkBox1"
$tab1.Controls.Add($Tab1_checkBox1)

$Tab1_checkBox2 = New-Object System.Windows.Forms.CheckBox
$Tab1_checkBox2.Location = New-Object System.Drawing.Point(10, 100)
$Tab1_checkBox2.Size = New-Object System.Drawing.Size(100, 25)
$Tab1_checkBox2.Text = "Notepad and Explorer"
$Tab1_checkBox2.Name = "Tab1_checkBox2"
$tab1.Controls.Add($Tab1_checkBox2)














# TAB 2
#----------------------------------------------

$tab2 = New-object System.Windows.Forms.Tabpage
$tab2.DataBindings.DefaultDataSourceUpdateMode = 0 
$tab2.Name = "tab2" 
$tab2.Text = "About" 
$FormTabControl.Controls.Add($tab2)

# window label
$tab2_label1 = New-Object System.Windows.Forms.Label
$tab2_label1.Location = New-Object System.Drawing.Point(10, 10)
$tab2_label1.AutoSize = $true
$tab2_label1.Font = New-Object System.Drawing.Font('verdana', 26, [System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$tab2_label1.ForeColor = "#000000"
$tab2_label1.Text = ("Efe's Powershell Example")
$tab2.Controls.Add($tab2_label1)


# window label
$label2 = New-Object System.Windows.Forms.Label
$label2.Location = New-Object System.Drawing.Point(10, 90)
$label2.AutoSize = $true
$label2.Font = New-Object System.Drawing.Font('verdana', 12)
$label2.ForeColor = "#000000"
#$label2.backColor = "#b3b3b3"
$label2.Text = ("I was bored i guess?")
$tab2.Controls.Add($label2)

# link1
$link1 = New-Object System.Windows.Forms.LinkLabel
$link1.Location = New-Object System.Drawing.Point(10, 150)
#$label.AutoSize = $true
#$label2.AutoSize.DisabledLinkColor = 'Blue'
$link1.VisitedLinkColor = 'Red'
$link1.LinkBehavior = 'HoverUnderline'
$link1.LinkColor = 'Navy'
$link1.Font = New-Object System.Drawing.Font('arial', 10)
$link1.ForeColor = "#000000"
$link1.Text = ("Github Page")
$link1.add_click({ explorer "https://github.com/Gren-95" })
$tab2.Controls.Add($link1)

# window label
$label3 = New-Object System.Windows.Forms.Label
$label3.Location = New-Object System.Drawing.Point(590, 400)
$label3.AutoSize = $true
$label3.Font = New-Object System.Drawing.Font('arial', 8)
$label3.ForeColor = "#000000"
$label3.Text = ("Made in 2023")
$tab2.Controls.Add($label3)

$ApplicationForm.Add_Shown({ $ApplicationForm.Activate() })                                      # Initlize the form
[void] $ApplicationForm.ShowDialog()
