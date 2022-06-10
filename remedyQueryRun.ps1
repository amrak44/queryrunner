

#----------------------------------------------
#region Application Functions
#----------------------------------------------

#endregion Application Functions

#----------------------------------------------
# Generated Form Function
#----------------------------------------------
function Show-22_psf {

	#----------------------------------------------
	#region Import the Assemblies
	#----------------------------------------------
	[void][reflection.assembly]::Load('System.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('System.Drawing, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
	#endregion Import Assemblies

	#----------------------------------------------
	#region Generated Form Objects
	#----------------------------------------------
	[System.Windows.Forms.Application]::EnableVisualStyles()
	$RemedyAdvancedQueryRunner = New-Object 'System.Windows.Forms.Form'
	$labelRemedyAdvanced = New-Object 'System.Windows.Forms.Label'
	$buttonShowInRemedy = New-Object 'System.Windows.Forms.Button'
	$TXTcriteria = New-Object 'System.Windows.Forms.ComboBox'
	$labelThisTakesABunchOfStr = New-Object 'System.Windows.Forms.Label'
	$labelLoadsThemAllUpForYou = New-Object 'System.Windows.Forms.Label'
	$buttonCopy = New-Object 'System.Windows.Forms.Button'
	$lbinput = New-Object 'System.Windows.Forms.RichTextBox'
	$labelQueryRunner = New-Object 'System.Windows.Forms.Label'
	$InitialFormWindowState = New-Object 'System.Windows.Forms.FormWindowState'
	#endregion Generated Form Objects

	#----------------------------------------------
	# User Generated Script
	#----------------------------------------------
		
	
	$formRemedyAdvancedSearch_Load = {
		
		$comboAPPEND.SelectedIndex = 0
		$comboQualifier.SelectedIndex = 0
		$TXTcriteria.SelectedIndex = 0
	}
	
	
	$buttonCopy_Click = {

    start-advancedQueryBuilder
}

	function start-advancedQueryBuilder{


	
		#lose blanks
		$targets = $lbinput.Lines | Where{ $_ } | ForEach{ $_.Trim() }
		$i = 0
		$stop = $targets.Length
		$stop--
		$qual = 'OR'
		foreach ($line in $targets)
		{
			#format the string
			$targetstring = "('" + $TXTcriteria.text + "' " + 'LIKE' + ' "' + $line + '") ' + 'OR' + "`n"
			#break on last line to omit trailing append
			if ($i -eq $stop)
			{
				#keep the last line, lose the last appended string	
				$targetstring = "('" + $TXTcriteria.text + "' " + 'LIKE' + ' "' + $line + '") '
				break
			}
			$myq += $targetstring
			$i++
		}
		#print the last value
		$myq += $targetstring
		
		set-clipboard -Value $myq


		

}


#region Logic 

function start-urlconversion{
    $criteria = $TXTcriteria.Text
    
    if ($criteria -eq 'CI Name') { $sub = 200000020 }
    if ($criteria -eq 'Serial') { $sub = 200000001 }
    elseif ($criteria -eq 'Tag Number') { $sub = 260100004 }
    #lose blanks

    $targets = $lbinput.Lines | Where{ $_ } | ForEach{ $_.Trim() }
    $targetstring = 'https://mn-itservices.us.onbmc.com/arsys/forms/onbmc-s/SHR%3ALandingConsole/Default%20Administrator%20View/?wait=0&mode=search&F304255500=AST%3AComputerSystem&F1000000076=FormOpen&F303647600=SearchTicketWithQual&F304255610=%27400127400%27=%22BMC.ASSET%22AND%27' + $sub + '%27%3D%22'
    $h=1



# Variable to track iteration in loop
$i = 0

# Variable to append to name of CSV file
# Simulate the list of hosts
$InCSV =  $lbinput.Lines | Where{ $_ } | ForEach{ $_.Trim() }

# Batch size
$BatchSize  = 65
$Count = 0
$Remaining = $InCSV.Count

foreach ($line in $InCSV)
{
$Count ++
$Ready = $False



if ($Count -eq $BatchSize)
    {
    $targetstring += $line + '%22'
    $Ready = $True
    $Count = 0

}
$Remaining --
if ($Remaining -eq 0)
    {
    $ready=$true
    $targetstring += $line + '%22'

    }

if ($Ready)
    {
        start-process -FilePath $targetstring
        $targetstring = 'https://mn-itservices.us.onbmc.com/arsys/forms/onbmc-s/SHR%3ALandingConsole/Default%20Administrator%20View/?wait=0&mode=search&F304255500=AST%3AComputerSystem&F1000000076=FormOpen&F303647600=SearchTicketWithQual&F304255610=%27400127400%27=%22BMC.ASSET%22AND%27' + $sub + '%27%3D%22'
        $targetstring = 'https://mn-itservices.us.onbmc.com/arsys/forms/onbmc-s/SHR%3ALandingConsole/Default%20Administrator%20View/?wait=0&mode=search&F304255500=AST%3AComputerSystem&F1000000076=FormOpen&F303647600=SearchTicketWithQual&F304255610=%27400127400%27=%22BMC.ASSET%22AND%27' + $sub + '%27%3D%22'


    }
if(-not $ready){$targetstring += $line + '%22OR%27' + $sub + '%27%3D%22'}
}

}
	

	
	$buttonConvert_Click = {
		#TODO: Place custom script here
		#convert values to remedy advanced search strings
		Update-Text
		$formRemedyAdvancedSearch.Refresh
	}
	
	$lbinput_Click = {
		$lbinput.SelectAll()
		
	}
	
	$labelThisTakesABunchOfStr_Click = {
		#TODO: Place custom script here
		
	}
	
	$buttonShowInRemedy_Click = {
		#TODO: Place custom script here
		start-urlconversion
	}
	$TXTcriteria_SelectedIndexChanged = {
		#TODO: Place custom script here
		
	}
	$labelRemedyAdvanced_Click={
		#TODO: Place custom script here
		
	}
	
	# --End User Generated Script--
	#----------------------------------------------
	#region Generated Events
	#----------------------------------------------
	
	$Form_StateCorrection_Load=
	{
		#Correct the initial state of the form to prevent the .Net maximized form issue
		$RemedyAdvancedQueryRunner.WindowState = $InitialFormWindowState
	}
	
	$Form_Cleanup_FormClosed=
	{
		#Remove all event handlers from the controls
		try
		{
			$labelRemedyAdvanced.remove_Click($labelRemedyAdvanced_Click)
			$buttonShowInRemedy.remove_Click($buttonShowInRemedy_Click)
			$TXTcriteria.remove_SelectedIndexChanged($TXTcriteria_SelectedIndexChanged)
			$labelThisTakesABunchOfStr.remove_Click($labelThisTakesABunchOfStr_Click)
			$buttonCopy.remove_Click($buttonCopy_Click)
			$lbinput.remove_Click($lbinput_Click)
			$RemedyAdvancedQueryRunner.remove_Load($Form_StateCorrection_Load)
			$RemedyAdvancedQueryRunner.remove_FormClosed($Form_Cleanup_FormClosed)
		}
		catch { Out-Null <# Prevent PSScriptAnalyzer warning #> }
	}
	#endregion Generated Events

	#----------------------------------------------
	#region Generated Form Code
	#----------------------------------------------
	$RemedyAdvancedQueryRunner.SuspendLayout()
	#
	# RemedyAdvancedQueryRunner
	#
	$RemedyAdvancedQueryRunner.Controls.Add($labelRemedyAdvanced)
	$RemedyAdvancedQueryRunner.Controls.Add($buttonShowInRemedy)
	$RemedyAdvancedQueryRunner.Controls.Add($TXTcriteria)
	$RemedyAdvancedQueryRunner.Controls.Add($labelThisTakesABunchOfStr)
	$RemedyAdvancedQueryRunner.Controls.Add($labelLoadsThemAllUpForYou)
	$RemedyAdvancedQueryRunner.Controls.Add($buttonCopy)
	$RemedyAdvancedQueryRunner.Controls.Add($lbinput)
	$RemedyAdvancedQueryRunner.Controls.Add($labelQueryRunner)
	$RemedyAdvancedQueryRunner.AutoScaleDimensions = New-Object System.Drawing.SizeF(6, 13)
	$RemedyAdvancedQueryRunner.AutoScaleMode = 'Font'
	$RemedyAdvancedQueryRunner.ClientSize = New-Object System.Drawing.Size(398, 518)
	$RemedyAdvancedQueryRunner.FormBorderStyle = 'FixedDialog'
	#region Binary Data
	$Formatter_binaryFomatter = New-Object System.Runtime.Serialization.Formatters.Binary.BinaryFormatter
	$System_IO_MemoryStream = New-Object System.IO.MemoryStream (,[byte[]][System.Convert]::FromBase64String('
AAEAAAD/////AQAAAAAAAAAMAgAAAFFTeXN0ZW0uRHJhd2luZywgVmVyc2lvbj00LjAuMC4wLCBD
dWx0dXJlPW5ldXRyYWwsIFB1YmxpY0tleVRva2VuPWIwM2Y1ZjdmMTFkNTBhM2EFAQAAABNTeXN0
ZW0uRHJhd2luZy5JY29uAgAAAAhJY29uRGF0YQhJY29uU2l6ZQcEAhNTeXN0ZW0uRHJhd2luZy5T
aXplAgAAAAIAAAAJAwAAAAX8////E1N5c3RlbS5EcmF3aW5nLlNpemUCAAAABXdpZHRoBmhlaWdo
dAAACAgCAAAAAAEAAAABAAAPAwAAAEtZAAACAAABAAEAAAAAAAEAIAA1WQAAFgAAAIlQTkcNChoK
AAAADUlIRFIAAAEAAAABAAgGAAAAXHKoZgAAWPxJREFUeNrtvXfcHNV5L/49U3a2vl0Fod6QAAES
ooNBBUw1JTTTiR0nTpxmJ869cXx/xM69cfxLd65LXGJijI2xsY3pRYAokkAYSSCJooqQhMrbtu/O
zDn3j5kze87svvvO7vtKhuR8Px/KvrM731OeOXOe5zwFUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQ
UFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQ
UFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQ
UFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQ
UFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQ
UFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQ+G8Kwhhj/AMDMPze
btA1j4K8ugpkzzsg5QJANLCOHuhzToR7yvkoL1gK1tED5rpIxOPo7uoKbmjbNvoHBsBvq2kaent7
Yei6x8EYBgYHUa1Wg990dnQgmUwGnwuFArK5XPDZsiz0dHcHnx3HQf/AACilNY6eHhiGEXxnYHAQ
lUol+NyRySCVSgWfi8UihrPZ4HMsFkNPdzcIIR6H66K/vz/gIISgt6cHpmkGvxkcGkK5XA4+Z9Jp
pNPp4HOpVMLQ8HCNwzTR09MTcLiui/6BAbiuG3D09PQgJnAMDQ+jVCoFn9PpNDICR7lcxuDQUPDZ
NE30ChyUUvT398MRObq7EYvFgt8MZ7MoFovB51QqhY5MJvhcqVQwMDgYfDYMA709PdA0rcYxMADH
cYLv9HR3w7Ks4HM2l0OhUAg+J5NJdHZ0BJ+r1SoGBgcDuTF0Hb29vQEHYwz9AwOwbTv4TXdXF+Lx
ePA5l88jn88HnxOJBLo6O2scto0BQTZ1XUdvTw90UTYHBlAVOLo6O5FIJILP+XweOYEj/iGX/9ov
ANhb1kP70T+DbF0PuA5ANIAQgDGQocOg61eBbHgBsRnHgS6/Ds6icwCh4QoKCh8uBAtA+eWnUfnm
F4GBA4BuAJouf5MQgOgAdaFvfx367regLTob+pWfADv5LJAmJM2ufVARtc3sKPSPMRa80dv6fQsc
Ub47lnYQn2s82jxaf440ojJ8kOXfYACcHVtQ+c6XgYGD3sM/GjR/IXjtWWDH6yituA7WxTdBmzDF
m2RBWAkhYIwFE8IFLSzQ4QmT7hG6Hr5HmIP/piUO/x5NOUL3IAC0FjgQgQOhfgAItsGNOOrGu42x
EjlIFI4IcxoeKwhjxb/XqJ1NOULtaMRBmnAgAgdakE3SaLzbGKvR5OZIyj8ZOLCfad/7ErD28WgP
fxiMApSBzFwAcuGNoEtXINE70fs7AEYpisUiXEo94SIEyUQChmEEb4RSuYxqtep1FIAViyEejwfX
bcfx9GDGwODpbslkUprkYrEI13UDjkQiAVPgKJfLqAgcsVgMCYHDcRwURQ5N8zj4w8cYCiIHPB3T
NM0aR6WCSqVS4zBNxH39kcCzKxSLxYBD0zSkkklomua9Tfx+OAJHPJFATOCoVCooCxymaQY6KoFn
Vyj4HABA/H7oIkepBMdxgnsk4nHEYrEaR7WKcrlc4zAMj4OQgKNYLAYCRQjxOHQ94CiVSrAFjng8
DkvgqFarKAkchmEgKXL4csN8PReEICVywLOx2LZd47AsWJZV47BtlH37CYNnV0gmkwEHpRSFYhFU
lM1kEobAUS6VUBU4LMtCXOCwbTuw0XDZTPkcHwb5N9ytr0Lb9FL9lj8qiAboANv9Jtj3vgysXwXc
8BnEFiwB/EG2HccTOL/BmXRaMqYVSyVvAPyVLBaLSdcppYHRhDEG0zRhGoZkhHIcxxMGnyOdSkn3
CAbZ5zBNU7rOGJM4DMOAaZqSEcp13eAegGcsE+9RrlQkDsMwJIMefIHhq7VhGDAMQzJCOSGOZDIp
cVRCHLquj8wBbyEzBQ7AM5aJ90j6CxlHtVqVrmuaJhkNCSGwHUcyQvG+cOQLBekeiXhc4rBtW7pO
CJE4NNeFbdvBg0MIga7r0j0KIY64ZUnXHccJDHqMMcCXK9EI6wiySQiBEeIoFosShxXicF1X4oiF
OD7o8m/oG58HSgUgtM1sGXwBee05lLa/DmfZNbAuuxVk4lRpWzWSLjva9fD3Wr0WhUMURjLKPdrh
YBHuQzD2foj3CvOKb+3RxiIKx1ja2Wi7Hvx/qA9jHouIc8qaXG9XNkmEe/ym5N8g2zZhXKEbQH4Y
9i+/C+e11dAvuQVk0blALAlQd3y5FBQUxgQydONJDJVSoLOMK6gLaDrogqXQr/wkzBNOBwwDdqXi
bR99zmAb7BthXH/LxI8gNV2HybeXhIBRKp3VAp6+TTQt0H1txwF13eAehmFAN4wah7/9A+BxaFpt
y+Rz2LYtvRHGlQPe28auViWOQO3wORzH8fwEfA6db7V9Duq6sAUOommSSsDgqwTCeI83B+Dp2xKH
YUAT5tRxHLjCnOq6XlMZCPG2ynxOfQ7TNKW39rhywHszm7GYxGHb9rjKJvHHW5KbceYYi2waqB6h
hx8I1AJt8zpg91aw86+CddltKCa7UOEGIMY8ZwvBoaNQKKBYKtV0u3hcckxxHAfZXE7SQdOplKSD
lgYHPUOWf4/Ojg6Jo1gsolgsSrpdh+CY4roucvl84KSjaZqn8wsc5aEhlIR2dmQyEkepVEKOG4h8
3S6TydR0UEqRz+UCJx1uFDRDjkDiWGRCHOVyOXAaYYwhZproEDgopcjn85IOmkwk6h2BBI50Oi1x
VCoVicMMcTDGkC8UJB000cARSORIpVKSg021WkXWd8zi9pFMOi3ZYAqFgmeQ8zniDRyBRI5kMomM
wGHbNnKC3Bi6jnQmA13kEHR+AHWymQ9xJBIJSTbtkGzquo50Oi3ZYIqlkmcs9u/xm5R/I/IpJaW+
MtOGrUDXwYp52A/fDee11dCWXQv91OWg6W6QEdSCKDrTWPWqSDqo+NsGZ8tj0kEbHDuNWQdt8J0j
oYNKYxWyK4z227ZtMA2Oz1rhqJtT/+040li11Y8GY3EkbDDjJf/RnmbGQKbMBOmZ7HkItuOmQQig
G2D7d0P70T/C+tYXYG59GRpjDU8gpLPZEdrEeEtG+M5o9whfD5+91v22kVCN1k7he6zJtTBvuxyN
xoJFuEdLHOGxaHTm3gaHeJ01/sKYOEiD7zUbq7b6IT74XK6ky2T0e0S4Pl7yT4aumT/60+w6IBff
AnrO5SCP3A38+lmgUgb0No8OAc8+EE+BnvFRGJfeCm3aXE+/440Oj2u48WO8/mHlOBLtVBzRrx+J
dv4mOSIuADac5dej+vE/Q9rQENu8BtVffhd0+xveA9vuESJjAHXBJk4FPf8aOGdfBifZgXQyMWIw
CtdBe3t7A88yyhj6+/slHbRRMEo+n5d00HAwSv/AQMBhGAb6GgSjiPpho2CUXC4n6aBiMIoYKMI5
wsEoYY5GwShZgSORSIwYjML9BPp6eyUdtH9goE4HDQejDGezkg5aF4zS3w/KA14I8QJeQsEoYR00
HIwyNDws2WB6e3pqIue6ONzf7zm3+NvdRsFYYRvMSMFY3AbT2yAYS/QDCHMMDQ9LtqJMJjNiMFYj
DkopDvf3SzaY3p6eOhtMoVCQbDBHS/5beHI96yPMGKxzL0PyC99G7MY/AnonjVktIIf3Qf/Z/0Xs
638BY9MLI9oFvJ/4a1nIxVO6Nspvo+hM/yX8AEL2DG+oxskPoIEK0Oo9mrntNrTBjHEs/kv5AYyT
/LewAAQaBwBA7+pF4vrPIPb5r4OefRmYEQPcNs/5/ahD8s5GWN+9C/jel+HufrtxKxrp6x8yHTTQ
M30jYN0oj4MOKvqGHwkdlN+fNRmT8bLBNLQ7ROSQ2ttorHgfQrztchwtG8x4yX80FcCxgY/eBHrL
52H4bp98sFwGOKUC9DfWgD7yn2DvbPTiANo5LfBaB1AXZMIUGBffAv38K+Gku2BXKpJ/e8w0awLB
WO2M2IcZi0lBNIHLJ2p+4UbI3dIWYrQD19RmHKYp+aYH59Co+YVL5/78/FaYRDMWk1b10TiCM+KI
HPD7IQqMXa0GR0gAYJhm4P9OhLHi0DQNprBlbcjBz6FH4vB9CwIO14UjnGXXcXDX7GYcti3FZgRn
3Vw2fXfiYE5DcsMY8/wwWuDQBZfnKBzw+yE+dHWyadtB/AePixDVqTrZHEf5j7wAWFfcifgnv9g0
IYKbHUTlqZ/Afvg/gf4Dnm2gXR8DRgEQ0BkLoF1xJzLnXQbNjAWdGe+EIFYshu4jmRCEEFh+QhBx
YhslBBF9DY5EQpDu7m5YH7CEIJVqFYP/TRKCDA4OovJBTAgyVugd3TA/9gmU5i6G/vgPQX79DFAq
tnda4O8gtF1bgG99EcUNq2Fd+UmYc044Io5LbVgwIoO6rheNpRuBUQvwnXQKBSnijVEGw/A8vzoE
4R1PHCG3r/9ybTpSOJKy1iqiLwCSPwwLrImNYB8zC87Nn4e2+AIYT/0I2jubfLfgNtQCTQecKtzV
D6K0+WW4K68HWXEtoMU956QmGK2dfDvaTAcdDaNxaJqGHdu349v//h3fvbO+ETV+rw2uSzFz5gx8
4Qt/GbSvGYfYlpH6OepYjJFDvEfb8zGaDWaMHK34AYylH814w45Uo/VzLIlNoox35AXAdSlsfxsp
hW1qmrQtc10Xpq6DaXFg6TJg4VJg7aPAoz8ADu/zHuiW3+C+E9HgIVR+8jWQl5+CceHHwZZcAFhJ
EEbhuG5NgOCFwYrt5D7xYudFf3Zd16XjN0opTMMIjrqI7z8tIhwmixAH9Y+FXMfB3r17pS1yM1BK
EYvFUKlWYZhmcw5KJbVE13XpOIj6x41Bwg+/H5LeSuRQXBLicCkNchLAH1vxWIsxBkPXa1Zm/zdh
v/u6kOKQ3MRiMWnrbDtOcNQVhD4L9wj79iPEoYU4HNf18jcIHI4Q1sz7AZGDseYcjeRf5PBjFESO
cD9YiIOFOHRNC3IS8PkwDEN6cbUl/7FY9AWgXCkj1z+AVDIhndeWK5Xg/BzwAjREXZp2dGBw2bVg
8xbDePan0NY9ARSy7SUfIQQgOtjOrTDu/j/QN70A65pPQZuzCIPDw4FRiQDo7OyUfPtz+bzUzkRC
7ke1WsXg0JCkH/Z0d0s66ODgYC0ohnMIunK+UJA4uH7YmU7B0DVQGn0HRDSCbC6HSRMnSjp/IcwR
Oj+3HUfSpTVNQ093t6TnDg0PS0kpOzIZZIR7FItFicOyLHT39AQC6DgOBoeGJB20u6sr0EEZgOHh
4cC3H/DsI2I7S6WSxBGLxdDd1SWd0Q8MDko2mO7ubsk+Mjw8LOnK6VRKls1yWZZN06zjGBwakmww
3V1d0oI6nM0iJ3CkwhyjyT+lGBgclDi6OjulhzObyyEn3COZTEoclUoFgwMDwQJsGAa6u7okG8zg
0FDwgmlF/qM9hb7pkI6wVW6UEil4GzAG6rpwJ82Ae/2fwjj5IzCfvBfYut7bwrejFui+WrD2cZTe
fBX6iutBzroUrKMPoBQMjdMuUUqlLVH4KKXVNFeNzuwbHrW0o+Fy1YCQphx8vMPz0bQfDY7uRuLg
/6+1MFakTY6wf/toaa6YMKdROBCBA03kphHHqPLfqB9tyCZtYaxYCxxjzALSAhgFA+Acfzqsz/4L
4p/8Isjk6Z5toC09x1cLsoNwHvgG9H/+U8TWPAyt2qbRcby6OQad7WhyRL3HWHXQD0p/juaYfZgQ
bQfAvNVC12tbDtHAIG4vNV/HFHVQnccp8xUp1QHj4ltAFp2FyiP3wF39IEh+aExqAdm7DcY9X4X2
6irQi28FW3IuKGNS/Lju66mMseAM17uFt8IG56Z+m12/n2LfNE2TdF9xLBpxeGNAI3en1i8E49aU
Q7BN8H7oui7poC4fA+FvuqCz8zepxOEf4YY5QLy4enEciP83V4jlICKH/zdJbvx+iGNLhdMQl1Lo
YQ5hLMIcLAIH8eeUhPrBZZPA83GQOELjPR7yX9ePBhx8LMMc8OWUhmVT04I5C8vmiPJPKQ8HHm1l
I4jH4+js7UOpkMfh/v7gCvd95uD6oaiDdmQytUECkMvlkM0OA4ku4OpPI37KR6A9dg/cTS96bsXt
5Cf0MxVrm16CtmMzqh+5EsULroHbNwXMdZFKJtHX2xt8vU5340U7/M+u62J4eFjSQTsyGemsNRc6
E04mEhJHxecYzhdAaWtvDwKgo6PDi2EPnW2LHGIMA1DTD0UdNJvL1RYJAJlMRtIPC4WCNKfxeBy9
Iod/ts2h6zq6urokX/RsNisZSTOZjGQfKRSLMkfYdsHP6AWOzs5OyQaTzeUkQ2om5BNRLJUkjnB8
gdPAPtLZ0dGUI51K1fl2jI/81+wjqVRKls1yGf0ih+/bweG6LoaGhqRYjI6ODjnvYy4n2Ucayn9/
PwwkUkAx19wyTwB2aC906mUp4RZgHpggElNK4YoWSX/1EgeAJzHkQmqcdDYSJ52BynMPovrQ98H2
bGvfiUjXgWIO7NH/hL7hebAV18M57UJAmAS/S4HAim0UGV3XlRYATdOkezDGpLHgghtw+G8Dl7I2
zn5JkC04CgdvD2+j+OZ0XVdaAOr6MQqHxjMGCZy6ptVOFvy3pvgdvssQIXIwy5Ku8zaK46TruvRw
huWGjMIRi8VkjpBsIjQWzN8xtsIxHvLPdwAixDk1QkldGWNw/TEHAObPhdQOQTbF8axJl8ehse4J
o+vgmg532+tw9+0CSG1b1tYD2ihwgbog8STiH70Ryb/6Nowr7gBLpv0gozZAiLcj2L8Txo/+Ada3
vwht6/oR+9kwwKIVrnB/jhDaDUZp1N62r4+tA2PmHpcxGC+O8ZL/I9SfKL81jOnz4b63bbQ7gQ0e
RGXtE8Bld0or10hWULERo1mlIdzDmDQN1Y9/Fu7xZ0J/6scgm170YhHaVQsYA3n9Jdi7toCeewWs
y2+HfuysOmtv2GGioaU11FeCaIVB2vaG9vU3VRgEgd46GkezCENE4Gh26lLHgfGX/zBHu3Pa7IRK
5CADP/kG0378TxgVlAK9k2H++ddgzF3kRf4RAse2UeL+8MxLYJhMJiVBKvrFF/iTkEwkpASF5XLZ
C3bwDUaxWAzxZBIoF0HXPYnqg98F3f1WEDXYFpgfZDRlFthHb4Jx9qUweyYE/XB5YRDeD14YRDCU
FYvFWqJFeAU1DNMM+lGpVFCtVIJ+mKaJVCqFDa+uxxe++P/BtqM7As2cNRNf/vKX0NPTI3FU/eIj
nMMwzVquN+Il8CwWi1I4bdIvPsLfPsVSSUqeGY/HvUAczlGtolIu1zh4YRCRo1SSjHHJRKKWoBOe
riwmtrT84iOcw/aLj/DrOi8Mwjl4YRDBUJZMJmWOctnz/eAcloWYZdU4bLsWq+FvxQOfe+KFtxd4
8REum37xEc5RLpc9Bxoum37xEc5xpOTfisdrHLwwiMiRSEiLXLFUkmXTLz4SyKZfFyCQTb/4iGHP
W4xYZx/I0KHmD5emAf37QX/yNRh//PfQOrzgBOoXsuANicViXkSVYIRqVBhB9MIrlUpe1RKuV8Vi
MHUdSGWA5dcAC5ei8NB/Qn/+l0B2ENA1tOw9Tvxjw/27gLu/AvbrZ6Hd8mcw5p0EAKiy0QuD5MKF
QZJJqR+VSkXqh+7rbqZhtO4LwDynnnAG3mqIQwt5ldnws+ey5oVBxHsk/OpDwT2qVek6CXmVOf4D
LBqhjJCBNF8oSPeIx+MSh2Pb0nWLyN6I3FtRLAySCRcGKRble1iWxOE6Tp1stlwYJCSbsRDHkZL/
WDjCM1wYJBaTjLBOLldXGES8R1AZyOcwTBMx04RGJ00Dm3dytJz9mg7318+h8O0vwT20r/ZgBc9Y
YyEXtyNtJUToPQb2x34H1T/4KtylywHdbL/GgO+K7G58EaWvfgbVNY81bMNIj2tbCSpY8K/oIBi1
DaO2RaTn/x/SQdtOUCH+vc17NNuuN4vPb2ssIs4pa3K9XfvDmOW/EUdItWnlt+L3NGbEQE9bCZgW
IkHTQV/4FQr/+3dQeeYB0FIBZBwcb5o+Hox6q9ysE1G944tw7/grkNkneh1v54wdAHQD9PA+lL75
v2C/sgpsrJWRWunPUbmBwnjhaEzF0ZxukYsUSyVGKiXY//I50F8/F90Zh7qAYYKceCbIpbdDP+F0
EF0H87du4goubrsAvzCCsIIZhhHkZgf8rZl4pORvY70bEjAQlA+8Bzz7APRV9wPD/b73Xxv2AdcF
ps0F+ey/wDxmZrCg8ACNpv0QgjwAL4Y9fOzEGMOmDRvwpS/9TUvBQLNmzcTfffXvEE8kpOM1XdeD
2HL+XTE+gRAiFdTgQSBSQgrTlIyXjuN4jifjySEEIAFeII7UDyGxDFAfdHPUOAxj/GQzqtwcDY4I
suk4DoxEPA7E4yAf+22U33rNqxMYxdCm6Z7f/WurgW2vgyy7GrFLbwWdMBXZfN4zSKCFwghC0oVC
oSAlYmxUGCGX7AC7+HYYJ5wJ/en7oP36OaBSat0NWNeBPe8Aj9+L+O/eJemH4cIgySiFQYR+lEql
QN9u3Y2UwLKswBjGOTIhjlYKg3Bvt4aFQQSOdDotcUQpDFKIUhhE4BipMIinLTUuDFKMUhhE4IhU
GKSvb/TCIKGEICLHuBUGaVH+w4VBUlEKgwgcvDBIsOzETjoL5vlXjhpjX/8AGWCFLKoPfg+FL38C
lUd+AFIugOi1lfWI6KCMgTEKe/oCVG/7S5h/8LfQFixuTy3QNOC15+Ae3Fu7vdCOZn4C0XS3sZ1N
t6QfNvgO10EJxk8HDR9LtfLbZm0Q29rgC2PiqJtTQurmtNkYReqHMBZHUv75/UmTMYlyj2ABIJqO
+LW/D23BktYdcLiFfd8uuHf/Laxv/iXMN14CYQzQtCNXGIExMNcB0w3EzrsMqb/8FmK3/jlIt5+p
OOpbl2hg/e+D7thc+5PQjuAujYRqtHZ6V1sbz7Y4/OsNvsMi3KMljvBYNDpzb4Nj1IQg7MNTGES8
zxGV/xHmPCoHyeVytau6Dm3HG3C/+Vege7a3H1XnOkAyA3bmxSAX3wz92NneMHD9usnEiBPR7DsN
r/tn3e7OrSBP/hjs1WeAUh6R4LrQb/4cyBV3gglJN1tuQwiarmPTr3+Nu/76y5Ie3QzcBvC3X/lb
pNLpegeOBu0gwn/HOpbt9HW8OY5GPwhQW8j4wzLK74/EWIzGIbXTb+t4cRhioAkhBD0LliD2qbtQ
+tr/AD20tz0PPN0AykWQVT8FeWMNKsuuhXvmJXBTnQCj6O3uHnthhAZJKbkOSibPRubjfwrYZThr
Ho+Yc4CB5YeRz+VBHXv8CoOk00gm4i27dDLm6Yod4eKUhQLy+bwXJ+CfO6eSSSlqL5eTYzvExJfA
OBUGiZCUMtBBAXSOkJSSb2Ety0JHJgPXcUGZ50/Pr/PIQzHpCNBaYRAglMDWP78/7Cd+NU2zbs6B
30xhkI4QR6FQCAqxED8wb0Jfr+cU5eNwf78km1ELg9Sb/CmFsegsJP7k71H8zpfBdmxuz8JOiFcU
9NA+GD/9N+ivPQfnoptATzyr4QM51rNWACC6DuI4MF5/Ec4T9wDbXo+ecIQQVGOJWjKRNvhH7Md4
+gEwhv7D/di1cwd27tyFgwcPIZvLwnEcaESDZcWQSadxzJRjMH36dEybPh2dQqTYeOigrut6qhfl
W0wqnXB4qpnrVX3y9ybhXQxvz6GDh7Bzx3bs2fMehoaGvKy81SoY87MEdXdhypQpmDd/HhadeCK6
hai4UftBvEAeSimGh4bw1tat2L9/P/bu24+B/n7k8wXvodEIMuk0+np7MXvuXJxw/PGYOWsmEoK3
XStz32AqRx1vzQ/oqVQq2PPuuzh06BB2734X+/btw8DAAHK5nOcURYiXlai7G30TJmDatKmYNm06
0h2ZoL10BDteozYECwDfPvJLxvGnIfnn/4bSj/4Z7trHQexKm/74vo/52xtgvvs22OkXAld9Aph9
vPQ1Mb66GRoanIgGounQ97wDc9X9IOufBsqF1tqrG6ATpno7wVF00GaC0LAfJPhXdDB5S1+pVPDa
axvw9NNPY9OmTeg/3O+nQBvZY8g0DXR3dWPBwgU4+6yzcNrpp6G3r6/m4ddkvEe6XiqV8K1vfgt7
du2CpnFiAs0Q8tSDgQp1AwzTxKc+/XvB27lSLmPd2nV46umnsXXrmxgcHAjcpBuPLUE8bmHGjBn4
yHnn4oLly3DssceO2o9quYzXN23CurXrsHnzZhw+dFg6kWnERQhBOp3G3DmzsWLlSiw66SQkkom6
KMKRxqyZDWakdhLGsPe997Bp4yZs3LgR7+5+11/U3RHljf9d0zQkEglMmjQJx59wPJYsWYK58+bW
RReONKdkYHCwZuOCt+oGWyBNg1MseEd9j9w9brUASd8xMC++GdoFV4N19sKuVKQ3iGEY0nGbK7hC
Ap7raVDsQtdBsoMoP/5jsFX3g7STeJRSkGNmgn3+G6B+dKTE4U9iNVTsIhYKBeUunxy6riMRj2PD
q6/ii//rrpZtAH/zf/43uru68Pbbb+On9/8Ur7zyCsrlipSMY/QhZ3BdF4ZhYMaM6bj8sktx5tln
I51Oewkj4J0hi+f+juNIbQ0STBKCYqGAP//zz+Ptt94JEsQ05Yd37Pj///1XsWDBAmzZvAU/+fGP
8cqrv0al0lpfXJcCYJgyZQquuupKnL/sAsTj8WBOTN99GwBe3/Q67r//fmzcuClQRbSIcstDjzVN
w7x583D99ddi8amnBiG3kmy6rlRHgCeKFY3IVcFtmsAr2sHHe+eOnXjwl7/E2rXrgjwCrYwJ5+D/
JBIJLFiwAFdffRWWnnYqDMOU3JE5uMszYcJywBjDwOCg9LB1dXUhEY/DHTqM6hP3wX7ix2CH97Xv
eAPUjIEzFsK96CYkz70UiYycoCJcGEFMcuE4DvqHhoBqFfqWtTCf+KG33QdDWxWJXBf6dX+A1M1/
Wkt8GSoMohG/aEeLhUFy+TzeeP0NfOVvv1KXVXgkUEoxe/Ys/N3ffQWPPf447r/vfgxnsy0LRqP7
ahrBokWLcNttt2HJqUsARCsMwoXTrlbx5S//Dd55+52Gb5m6qfb15rv++i688/Zb+NG9P8bA4BAM
o33vUZ7b7swzz8Tv/t7vYsaM6QA8uTlw4AAe+tVDeOKJJ5DPFyK1sRlc10U6ncLHb7wR191wPWzb
lmSzUWGQgYGBWpxEg8Igw9ksDh06hMcffQxPP70Kg4ODY57bcJsty8JZZ5yOq6/9LRwzZQpSyWRD
G4x+11133SX+uFQqSV5hccvyPMfiSZgnnA5n/hI4xTzIwfcAp9reA+efwZLBg9A2vQi8vxtkwrHQ
eycFgyhWTjHESDF4Hl3VtzbA/MU3YDx6N3DgvfYTiLgO2LyTwa77Q1idtYxAlDGUhIg3+BFvokCV
y2VpVbViMTloxg9GOXjwIF544YXIzkCeITSD/fv24mc/+znKLb4pRx52T8nbv38/Xn75ZcTjccyd
O9d74wtvsVgsJhmQXNcNotGo62L16tUY6B+I/EaNxWIApXjg579APp8f80PJDYfvvvsuNr+xGQsW
HIfe3l68++67+Ld//Tc8++xznk1kHNy7edrvjRs3gVEXCxYulHZHhmFIRlpKaS2qFKFoTP/z5jfe
wDe//k08t3p1y7ugqG2mlGLnrl14Y9Pr6Ovrw6zZs6SXl23bqFQq9QtAsVSScprF43Hph9VkJ0rz
TwU5dg4weBBk8GAQctj6TGoAo2C734T9yirQQg7a1DlwrIS3bUMtMo97MblDh1F58HsgP/pHkHc2
tp9ZGPAe/gnHwr7pz4Cp85AUJpKHWIZDXsMLAD95CKLRxmEBIISgUCjgnXe21WWkHQ9omoZSqYxX
178KuC7mzpsXLPrckl23APg7HbfFBYD44azbtm+Hbdvj8lCK/Th8+DC2bduOCRP68J3vfBcbN26U
MiKNB/j8btn6Jjo7OzBr1qxgy22K4djwFoBSaAFICQvAmpfW4B/+4Z+wc+fOcW9no/HJZrPYsGEj
urq6cNxx8wM+Hiqtf+ELX7iLCimdHNcNdB1d12EYBojfMUopXMcGBQGmzoW25HyQ7j6wA++C5IaD
N3sbLQUqRdCtr8DZtAauZoBMng49nvT8uc0YDGrDXvsESt/5a9AXHgIqxTaLjKBmi5i5EOz2/wk2
f7GX4sq3GPOxcBuMBdcPKfWKkRDf0hyMlW+F5dcB4PDBQ3j++edbygsY1buuXfB2vrF5CzQwHH/C
CUHqKcNPxSWNBaUwdB2UMTz7zLMYGIi+A+D9ORJ94YvAmpdewt69+8Z1gQmPl+u62Ll9B0466SRM
mDABmh9roDcYKy43BpcLTcNzzz6Lf/zHf0J/f/+Yd0GttNu2bWzcsBHdXV2YM2dOLf0aYzDEZI/8
rDVyYYTuLpQnfQL545ZCf/on0F95woslaOe0wFcl6M4twPe+DGvxR2Bd9UkY805C9Z3XUfjFt4EN
qwG72t79OVwXSCShnX4hEjf8IfQpMwHfUCMmjAwXBqGMYajtwiDJusxBHwRwof7pA7/AMVOn4vLL
Lw8SWIQLg/R0d4NoGvK5XBtxDUe+H8Vi6Yi+TQFvsTl0uB+PPvww/uJ//gXMmFVffMQw0NXdXYvV
pxTD2Sw2vPYavv5/v4GhoaEjtkg1G59SqYTvfve76OjI4LiFC4OEqUbdZJIWCyNQCmfyDLg3fhbG
kgtgPPYDkLdfa39r7mf3pS8/ifJbvwY5bjHYO5uAwYOe4bHdh9/PyMLmnwznoltgLb0ARle31Odm
qZs01LuJNvIbb+R+2VZhkKMEQrwMQN//j7sxZ/YcLDx+odwP//+50GpEO+oCHLUfRwO6rmHdupfx
1ptvYdFJJzVMCaaJcqPreH/fPtz9/btx+PDho/bmD0PTNAwMDOKHP7wXf/Znn8PEyZPlWIAoGHHl
pxSMENgLT4f7+1+B+am7QKbO8d627b4tdAMsNwT68lNgw/1+mHKb233XAfqOAf2t30f103+H6knn
gI5lF9HOGH2AoWkaDh06hLvvvhsl3+tN6NBvunkfKBBCkMvn8cwzz0b6frVcxn33/QS7d7/7G3v4
OXRdx1tvvY0nnnxKWKD8ggI8zTMvjOD6/xD/h7qQdphf54UH+HUNDEh3InbRjYj/j29Au+QWYKzZ
fXWjPT0f8GMS0tAv+jjY5/4V9sW3gqU7wQ8wxX7wwiB8HCQd2Nft+FkyHwtuDxBTNItjVTtRaDNp
SQPwc32eysrxU3a7Lh3T4mMYBtavfxVPP/10XT+5qhAU/xjHvnC9WSx0cSTAx208uDRNw6u//nWQ
uz+Qf9+az+0AALB69WqsWbO27Yefz7W4sxR1+FZBCMGzq57B+/u8jF6GWABi3Aoj9PeDxTuAq38f
2knnwnryXtDX17Sf3bdV+OoHO/EsOB+9GZXjliCV6UBGsNCXKxWpH6ZpenqukA9gaNwKgxRbLgxS
3yWvHX19fZgzZzamTJmCRDIBu2rj8OF+vPfeHuzftx85P06gnS2x4zh44Oe/wJJTT8XkyZMDAav6
Z9sgXuLTsUY3cieb7u4u9PT0wrIslEolHDp0ELlcvmmIa6twXReGrqNvwgR0+b4kxWIB/f0DgY9/
q1yapmH/vv3YuGEDTjvjjIaFQQCgkM/h/vt/iqptSwk/oo5RzDRx3Px5WLRoEebMnYNEMolqtYoD
+9/Haxs24O2338bwcLalxYUQgoOHDmHVM8+it68PRrjgwHgXRsD8xYgvOh10zWOoPnw36K632j+z
Hw2MeV59U+fAXX4dqqcuB01kvOxFlI5aGER8uIHxLAxCx/TIUNfFtGnTsGz5Mpx33rmYMXNmYKit
2jYGBwZRLpewf98+vPDCi3jhhRcwNDTc8ltH13Xs2rkL619Zj49d+bHg75rjBCca4eIdLfeFUsyd
OweXX34ZTlm82HOSMQwUi0Vs374dL697GU8++RSGh4fHZGvg87F48Sm49JJLcOKiE5FMpTCczcKu
VvH++wewds0aPPPMM20ZEKvVKrZt24alp5/eUP41jWDNiy9h+/YdLT/8LqWYM2sWrr32Ghx/4ono
7u6WKjkxxrBsxXLs3v0uHn7oIaxZs7al3QAhBOvWrcOKFcsb1wYca2IHaSJcF1qiC+aF18M45VxU
H70H9qoHwLID47sIMAZkumCcdwWsK+5ENt4BWipGSh4qxmi3KgitjEU7XdI0ggsuOB/XXX8d+iZO
RCqZlE5pqOtFz8UsC7PmzMHc+fOxYuVKfOc738GWzVtafogopXj++Rdw0UcvkiIdg/6OsU8rV67A
tdddi6nTpiKVrHmmabqOGTNnYsbMmZh/3Hx865v/jv7+/rYWAb6gX3XVlbj1tluDh8f2U3jHYjHM
nZfB/OPm48QTT8TXv/6NIIqzFex//4CXUjw8RoSgWCjiudXPw3XdlhZiSinOWHoqbrvzDkyYOLEu
PRjgV/TRdcyaPQuf+r3fRXd3Nx5++JHIHJqmYd/evXjnnW3QRD9isTBCeGskWbVJ41LQ4tm1+A+/
pk2YAuu2z4Nc/4dAIj1+BibGQOJJWDf9KRK//QXok6aC0FrBzNH6wa353OLN/2mUdUW63mA8GnO0
1y1CgEsvuxSf/NTvoM8XBhoaawZI40zgvfX+6q++gFNPXTJiZFgz4di6dSu2basVixE52u2MSyk+
ct55uOOO29HV3R0EuvDkH4zSwP60eMkS3HDjDW3rzYwxXHjhStx8y83o6Oiom1Nxji686EJcf/11
bS3gA/39wW5XnBNd17F92zbs2rW7pT64rosTTzwBn/6D38eEiRNru0/IcicG9cRiMVx3/XU4dcni
yK7mAFCpVLFpwwYYPM6eEyUTCeiheGfRtTEWi9XFhov30DUNXZ2d0kDn8nlQEBiFYWhrHwN96j4v
Wm+83pqEgFXKsH/+bdj9B0A/chXiE6Ygla4tMpVGxUCFfriui0GhH7xwZDjvnWgES8TjUhx9JVSo
0zQM9HR3oyOVhKYRtDA/oJTi7LPOxJ133oF0JhO8aarVqjTehs8R9INSDAwMIJ5I4M5P/DYOHTqM
d999N/KblBCCfD6PtS+twdRp0wIdmttH8vl8EAbcSl+mTpmCO3/7TkyaPNkLTrFtWW50Hd1+Pwgh
WLlyBZ595hls3ryl5Tfo7Nmzcdvtt8GyrIZFTUV372w2i3POPQernl6FHTt3trTj4D4hg4ODtaKm
fjHQTa+/gVKpVKdWjgTGGDLpNG684XpMmDRJCjhyXFcaq7BsapqGSy67FBs2bvJdunl6mLrZ9cfX
43tn2zYYYuAPIQSZTKa+MIKQPCIW8nenoaIF/HqQEAGAMzQE7Y01YE/cC/rOhrFFFI48hKAH9gA/
/TrYq88CV38K5hkrQfy2lv2KOrwfhmFI/ahWq/WFQUKVY3P5fH1hEOEelWpV4uAegq0WBmGMobOz
E1ddfRVSoUSk1RAHjz7jsG0bVT/r7IQJE3D99dfia//6b5EjETm2bt0aJKkgvKoPgJgZa3lbzhjD
+ed/BNP9oB3Ae3GI/Qi7UXd3d+PUJUuwefOWliVhxcoVmDx5MkqlUtOiHa7rIlutIplM4qSTFmHb
9u0tLZTVShWOcKrAGIMVi6FUKrWsflFKccaZZ2D23Llw/WrWwfhVKk0LgzDGMHvOHBx//ELs27c/
Ei+DZ78y6i807qz432aDEoa76y3EHvgW8PJTY3PfjQIecLHjDVS/9nnQly+CddUnYMw+QXJwapYE
I9j6t9DHUceqxYQgjDF0d3djwsRJDY/doswHN3IuPvVUnLp0KV588cXIb1JN07Bnz3sYHhpCj3Cq
4fWidbXNsiycfMopo/ZD2qIDmD1nNmIx0w8DjjZuiUQcJy1a1JBrpESj8Lmivq05qK+2SByahvf2
7MH+/ftbCtlOpZJYtuwCKctP4+YKKcyEcUsmk/iDz/xBkP05nUrJL/JiCZVKGXx3YFkWkskkIvW4
ZeMYIXCzg6g+9RPYj90LHHzPe/CPxhEg4PHYVTirfwn3jTUwL/o42DlXAPE04FKwCOfyY7VOjPlM
m4zeiigcsVgMK1Ysw8svvxzZHkAIwfDwMA4cOIDevr4xj4Ou68h0ZFr+XVd3D+LxRJDKKgpMM4Zk
KhnpuyJXT18fYrGYFArfDggh2L17N4qFAkjEHQClFLNnzcaMmTNbttmISHd0BItcTyjtXi6fR6FQ
CD4nk0nvWLurs7M2EADKpZIUG24YhhTvzM/HOTRNQ2dnZ5CUk1XKKDz3INij93jbfcqiFxupnxrf
hbeNY0PfiYgNHUb1vn8FW/cUUh+9CfqZF0FLpOE6dl0/OoQB5Ft+MbNrIpEItmYM3hFcuVKpjZWu
QxxPl1Lk8nnkSyW06gZA4MVdOI4jtVMPcVBKMTw8HCwVGiFSP0AIZs+Zg4kTJ2LfvujBMvzsv7ur
C7ZtY3jYC/Yql0podXnUdT3Iyc93NNxWJPYjqAvgX+/u7EDCspDPR0zs6qNU8molEEDm8HV+MT14
OpWCruvo6+2DZVmBWhIFzHUARtHZ1S2lA9+xY4cXPNVCApKFxy/0DH++k8+IzxgayKYfcSjunsqV
imS7M3QdncJRoksphoaHYYjFAhhj6B9DYQRn51ZUf/ZNuK88DVTKvu9+m9t96gJWAuzYOV6+gEK2
vYWEaF7WrF1bgO9+Cdj4PMyrPgk27TgUS2UQP18dT0oZDFCDwiC9IX18MGJhkPJRLgySCRUGSfkp
rt57773ICwClFAP9A4jFYoGDGODZIFruieb5QxT8ar8jFgbJ5YLCIDwkWdP1EbMdjwTbrqJYLCIe
j0cuDGJZsdZ2ufBOLsCYFA7sOg7ef/9AS/cyDAPHL1wIy39jt1UYxPen4BiIWBik7olqFOBS9x1R
d9N0uP3vo/zET+A+/ROww/u9B79dv2cetDN7EdxLboUzfwmM3VsRe+pHoK+vbd+AqOlg1IWz5jG4
W9aDnXs59AuuBe3sBRFi4cPFHEbzi49mHxmPRB4R56XBd3T/jJ2sfr4l3v7+/oaFM1oG834p2lhG
bL+o245p1EZohjiOnG8cySpVG4ODQ9Hb5D/gEydNqh8LNLdXjUdxkYZGwEiJL3XdK8W1ZjUKT/wQ
bMcWTzra3e5zL75JU4Hl16G8dCVopgeMujBPOgepxWfDfubnqDx+L9jeHe2pBYAfZDQIPHI3Ytvf
gHPjZ+FMmVU3UOJ2C9yA1CQ545EuDBI5YWqj7zCGiRMnBvkMomJ4OFtnhGz1bVwbTDnScsT2C/8d
b1OxeL9grMbZIO3YVZRKxZZ2AOl0Ct3dXXVj0XTOBb+DZoVBRkv8auQFwwDgWWytUJ126TtEQzqd
gfvOBrAHvwdt81owZ6wx+g6QSME982JoH70Z+rR5SDKhxBchKGoasOIGsIWngz36nyBrnwAK2fZ2
GoQARIf25nqY//FlxD79N9CmzUd4LMQ0ZICXzbYiTCyvXydCugdjSKdSSFgWNELQWkFzhlKpjFQ6
FYlD7FtBsOEAXl6Cnl6vNkDUAqVeDHkR2VwOpml6HISgVGw9roFRGoxVYOQipGk/iKZhIJdty1nM
siyPi7E6DvF4DfDUNE3TULWrrZuZNB0gWqDaEH98WAsOH4wx6IYBR1CR4PsECJNR149kqB/lclla
zEzTrCsoGr5HJp2GISb7IISgN5T4UiyMAE1HsjiE2Iu/Ap7+KdjAAe+N33aMvuv9/vjT4Ky8Ec7C
M+BqOtLUHbEwCDK9MG78LDrOuwLVB78HuulFbwFps4AJ2b0Vxn3/DO0zX8WQAy9Fme8H0FZhEKGg
Bi8MkkrEWxYuxoBiqYiOzg4khAcjn88jK3AkEom6pJT9AwPBqq9pGiZOmIBMJtPSAuDdy0E2m0Um
kwmcjaKoiCK8eAhvAQgnpRzKZgMvN56gIhANSvF+pQLGaMs7AcuykEqlpMIgjYp2uK4bFDjxgpxa
dAPXvSPtnJAkpVwstHUCVCyWYMY8vX6shXGAEQqDCEVrRiwM0tAPQNdBSgUYG58He/JeVN/b5m3B
x7Tdd6FNmQXz0ltRWXohqprppeka7YiOMYDoME85B+b8k1F54WHYD90Ntuft9tQC3YCz8UWQVT8D
ueBaMLfJmTHG4gfQIkZO999W/IETKhcdqQmaX5Wnwd+jotmzILpSe989MmnDOMcoMzc+HLrhLQyt
gLHAv2JMhXHakM0RC4OIw2Ju2wj90R9A2/pK+29bDtcBSXfCuOBqWJffDn3ydFSyObBCPrqeC6+Y
AkmmkbjoBpinnIv8z74FvPgwSH6o9YWJMdDnfgGcfD7Q0QvG6AemMEhkjoBL9nX3/kRQLBZbevsD
3rGn7lvhxXu1sqA1k8lwP+qyK7U2Ys2HkzVwYRKNgOPAxhgD0TToLcgfIQSu44DyepRR5b9Bhq52
ZNMIR3zZtu0dfWk6yPBhaL/8DsznfgnkhvxjvTZdeKkL6Ca0U5cBl9wKcsJpsHUDdrkMjUA6oiCE
SPn2XUqlrbZGCMqVSs1Q19kH7abPgZxxEfDYPaCvPdda7gFNBznwLuL7toNNnubtRPzYd/FUwDRN
6KGiEGI7AbkfPKV0pWq3vC0kxHPioZQ25dB1XbpOGUPcsiSLd7Vaxfv73w+SnEZFIh5HIh4POLwx
ac1RxnNX9tSAqm2D+vox9dUXcazC/TT8akOtHwM6QREXSW780lti22KWBQL4R2gt2jaYdwwYTySk
QCArbrU036VyBVXbRiKRCNLvtST/8IrUGKH4ASbcgxAij7fPYYj6Y1AYxHFg7t0O/Sf/Cu3N9b5T
TZtvfW7dnz4PscvvgHne5RiuOsgPZ4OvdHZ0ICPoPIVCIUiqAIxQGKRRccol54IefyqqLz2KyoPf
A/a8E72djg0rP4CE77HmOA4GBgYCK7imaejp7q4vDCLYUDLptKSPl0olDA4NIVcsBYUiosOrV+c4
DrKCUS8d4hCLUwK1ICf+oLt+Xbxt27YFiTiiTRvD5MmT0d3dHRQGAYBqpdKyO7CmeY5Ag4ODwZwl
k0mpH5VQUlbTNBFPJEDaqDtRKpUwMDhYV7SDB1KJDysvnDowMNiyvZE5niOQ6Gxk27bkcDMa+MOe
z+aC37Ut//4CwBjD4NCQtNh1ZDLSWBSLRQwODTXICahpsHZvhfm9v4a29eWxJe+gLpDqgHn17yD1
V99G/KIboCVSLVlJxYGKAi2eQHz5NcCf/DPoorNrJwmjgTFg6LBIKIn5hynXX/g4s1AsYtu26IEu
/B59EyZI/T+SYzC+mv8I7RwldmI8oGkaenp6WhqrarWKd4Tw68ZNb83wGhVG6Jcw9u8C/vMrwHvb
2jfyURcwTNBFZ4NdejvSS84Nts7i+XrLunREOAf2gDx5L7SdWxB9aglYMiN8ioaxtDMqWi2cKkLT
NOzcsaMlL0DAewNPmza1nqP9XvzG/QDGpx/NoWkapk49ViicOjoIIdi6ZQuq1Wrgvz9Wuaqz5YWf
Nf+zEZSEIgQsPwzc/zVgz9vtPfyMAiDQps8HLr4V7uLzweIpL2RS6IiuaYiZpmSwsh0ncMxgQC2Q
wQ95FUtXUf9cWTSIOIwBuSHYax6H/avvgb23vbVTAY2A9EyETb0swo04wgkXNEKkfgCQ++Ef2Ri6
1voming2Bt0wahx+W8Q5oz5HMLa+3z33CmTUxYvPv4BSqRQ5GtALR+7AMZMnB2nROAeltK2nh4ct
U999lhes4P1wBQ7ej4rroh0ynRe+FDngZU8yDUOKmwhSnUXIHFU/R57ZXEzaCQDTpk+HZVlBxeMo
Y/POtu3YtWsX5s6d2578uy4qlUqgFpQrFek3hWJRkt9KpQrbtnlhEAJCGMxffRf6htVtPPwMcF2w
rgnAiuuQuORm6H2TAca8oIPBwWCgCSHo6uyUIpWyuRxyQoLOZDIpnQnzc1DeYR6gpPnqCa1WkVv3
NPDw90G2bQScFk8qGAM6e1HomQKn/zDgV8Hp6u4O8rlRP3iCDyrxg27EXG35QiHIFAt4RjSvMEiq
pcIghBDkszns27sXc+bNk5xCCuHiI7xoh39/27aDZKa6ruPtN9/E2rXrWo5NnzhhAnTDwKHDh2uF
QXhCkBbfSo7jwDS9RDL8t6VSSeoHTzQTnNFTiv6DXsqtVtdOLj/FEIdpmugOJX7lRU95TEcr0AwD
0DTJ7yIWi2H+vPmYOGEi9kTcdRFCMDQ0hFVPPYXunp46n4im8g/PoHrwwAF88xvfxN59+6Dx+Bdh
5BrNmWEYfmEQjUDf9jr0Z36Gljderh+0s/Q8VC/8OPTZJ0Dv6QlcZzX/LTVSSjEObv0c6ZhDPMP2
jlt0EAI4e7ah8qv/AHnhYaCYb++kgrogi8+HO3F6YJ+gjMkFHjRNTsXlp9+q64f/d/HYqdXCIIQQ
HDp8GA899DD+6I//qP54TGgD89sWHitCCIYGB/HjH93nVYFt0Yg7d948xCwrSHnVbmEQ3vea+31j
oawrxCId0bWGcLo6gaTOh56nJm9vqy2niQM8Oe7p7cEJJ56A3S1mYnrq6Wdw6tLTcPwJx48u/0I/
dELw7u7deOXlV1AUgtNGGhfezqnHTvGMgKRagf7Uj4H8cPQts38Egjknwr7jC6jc/gW4044b2R99
PKHpoNkBlB/6Pop/80k4T9wHlIvtnVRQF2TydBiX3AI2HvkKxqnvhBCsWvUMHn/ssXqK0YZH01Aq
FnDfvffijc2bW374Lcvyqt4cqcQtdUN25A2sR9OEq+s6Tj/jdEmlGQ2EEBw+fBg/++lPpbj9KKhW
q3jiiadQ9NU8sZ6l+A+vd8HTxh+3cCEM3YyBvLke2ua1gB5xZXddoGcijEtuBTvvY6iYcYBSaP7K
5FIq1Ubjb0/eUeqvukHngTohDa94uu75XVOnCrLxeRSfvg9syyveAzeWyMN4CvoNfwxtxnHQhofB
+JvOLwwSfNXvW1DmGbXCFuHJF/vl/bb1JA9cf/33f/8OCvkCrv6ta5D0Y7710BufFy3h7Tt04CDu
uecerFvX2tafj/u0adMwd97coD8iR6t9YWAAgfSG9P4u71w0YefCv9fOESCAIGdh3e7In1MSkk1v
7NrhqrlbS/JNKU48cRGmTp2K3bt3R54DXdfx8ivrcff378anf//TSPuxE1z+Rfdu3g9KKX7xwM/x
wvPPt7TQm6aJpUuWwOjJpFHZ8CycSima7k9d0BPPgHv1p1GZuRCWaaInlQqE3XEcDA0OBkY/zU+S
yBvHkxlkszU/gFQqJRXUKJfLoeIjFnp6e+HsfBPVh74PuvZxsFLBe/DHckSZ7oJ77WdQOfEcmMVi
08IgGvHyJQZnrfD88kcrDDIwhsIg/Iz4P75/N15//Q1cfPFFOH7RIkzo6wuEqmrbGM5mvYIUAwN4
5ZX1ePyxx/Dee3vbzqt/wQUfwcwZM4K+V4UEnu0UBjF0A9WqjcP9/cE945YljRVPEirquYlkEkTT
WnYEKhQLONzfD9M0ZQ4/gW3gB+AngTENA7lstuWdCHUcgFIpaxL3HyEawdnnnI1du3a1dE9CCB57
7HEMDAzi2muvwYyZM2DFE5ggcPDkKYcPH8ZDv3oIjz/+BGyhlseo7aYUEydOxKw5s2Hg/d1wN6+L
pjdTF3TeKbBv+R9weyaDVasw/RLI4s0doTCImBxT+o5YfAT1O4DguqaBDh6C8/gPUH3yPrBDe70o
rLYdkzwrNpt1ApwrPgnnhDNA/dztzQqDUNJeYRBnjIVB+L3XrluH1zZswBw/+eOMGTOQSqdRKZew
Z8972L1rF7bv2IGDBw9JOnsroJRiwsQJOPvsc7ydht8XzS9Bxseknb7wklZBAk3LksaKl8Di4FvV
dg4DuXzxcucBR7hoDbxFgBDiGc5a7xQAVi/bvh3p7LPPxqpVq3Dg/QMtz8eaNWuwdcsWnHLKyVi8
eDFmzZkNKxaDbTs4dPgQNm7chFfXr8d77+1taFMbbXwWLz4ZPb29MJxNL4ENHAJGGwBGQXong9z8
Z3B7JgfuspHGSRqziEEPug7NsaFvWA3tiR+isnM88g24ID2TEPvox+Gc+zGUzITnpSi0LZwQZDQc
ycIgIngk35YtW7B58+bgARHVkNp2tv22rFyxHJMmTxrx+rj0skmCig+Tw1UzMMYwYeIEfPSii/CD
H9zT8u91XUc2l8Ozz63G6udfQDweh65rcF0vclGsVdlquzo7O7FsxQovIYjzxjqARjg2Ywz6+VdB
m3sSIIQV8psCjR8GnuUlfAoQ/h6/D8+squ/cAvPp+6BtesFLPDIWA52fXkw//UJYH7sTxtxFoKUy
SHY4OK8PF4xoZDEW2ykiLLji/cZSGKQRwjsl8U09FriuizlzZmPZ8uXeqY0wBrwwiE/YHgERTn8a
yE2jF0M7GYh5G8PzyXnDXpK1UKDxSdoS7sOy5cuwadMmvPbahpbnSZzbSqUicYyl2OjyZRdg4YIF
yBcKMJxdb43+xmAM6OxD5ZQLYBKgt6c7uBS5MIhQ5SSeSEjJH8q8aIemwxg+BPL8g7Ceus9zzR1L
NmFKAQJo8xfDveRWlI8/A9VYHGxgoK4wiOMXBgmcRCIWBkkdocIgRxM8Pvy222/H7NmzUSqXvWKg
PoLiI4Sg0EZhENd1EfPHm8tBuDCI4RcGEQNc9g4ORsrgHEYy4fkBVEJFVHhC1cAIyBhy2ayX6KRU
bj0hiO8HELYriBw93d34+M03Yc+ePejvHxhTvcOx7jIppZg8eTKWX7gSIAQ93d0wyMD7o2//qQs6
cyGqPZNhUtq8MIhpyoVBKIXtG6n439LptHSPUrUKp5CDseE5sMd/COzbAYCMfbs/cSrMS2+Ftfwa
5HUL1VwOpFwKEn6IbUC1ispohUFyOVSFpAtHqjDIbwLXX3ctPvKR84K4ebEfhJCgn3aLhUHEAiZS
tFqoMAhCmagopaCu51XZ6sgZhmfPsW27adEa13WR9fMkuK6DlhOCEM9GUfWTvo4k/3PnzMEtt9yM
b3/7u205HI0HeNKVGz9+AyZNmuQtyqkUDLgRU0RNmwdmWk3PuUdKSik6zDTqvP7OBsR+6aUXw5jT
i7lAMgXjnMthXXEHjOnzvL/7aaJHagP/e9PCIBH06/EoDHI0wRjDRRddiOtuuL5hjHl9jH6rIbPR
x+q/QkKQRvLvUoozzzoLxVIJP7znXhSLxTHtBFoFX4A/duXHcOZZZ0lH1xFfsQR6ItX25DTwSfIG
5uBeVB/7IehT90PLDowxvRj16hIctxjOxbchcdZKGHE5p18rARbtPq7jFRwkevQdCfA31rJly/Cp
3/1UXY458XtSu1p9S0ZpyxHpYcsjcuTu7NtUli1fDkIIfnjPvSgUCkdlEeC72cuvuBxXfOwKPz6k
5QXA2852dnbArVa9IhE+eNECkTCby9WWfkKQSgmLh6ahmhuC/cpTcB+9B2z3W94R5Fi3+356Me3s
S+GmOlCuVlGq1NrJC0Ny8IIaHMT3V0DIdiH2I5FISA+KbdtSzHUjjnwbhUG4rjZ9xnS88vIrPv34
LQSUUsRiJi6//DLccuutiMVi8pzqujynfKxI64VBmC87tu1IOfnr5IZSSW40TYMVj4OQ1v0ASqUy
eK7LZhwgXmEQTdc9W0CruxteGKSzq2ZMbCL/BMBVV12FiRMn4j++9x+Br8aRWuRd10Umk8G11/4W
PnbVlYjH4zWHLNfF8PBw1AXAm5B4LIZ8tYpCqDCImMzDduSJ9qqu9HpWS8ZQfWMdyj//d9BNa0Bc
u/3zfK+HQLoD7KxLkLjyE4hNnR1cGigW6wojJEOFEbJCPxoVBjkcLgzS2ztqYZDkOBUGSSaT+MPP
fAYPPPAAHnnkUZTL5TFb+/mR4fTp03HzLTdhxYoVMAwDw9msNKfpdFrqR6VSGYfCIE5dYZDMKIVB
TDPW1qmDbXsy2rAwiJBIQywMYppm6wlBeGEQkaOZ/PtYunQp+vr68KsHH8QLL7yEcrk8rgsB3zku
XLAA11z7W1h00iJYsZhUwKRY9DI+t/XabXr2HT7OIQSMEDj7d6PyyA/gPPtzIDcEMubtvg56/Glw
L70D7LjF0Hrra9i1WjjhyBUG8Y1aEZNyUt9hpbOrE7ffcTtmz56Fn//8l9i5c6fkvhp9uDxB7e7p
wRlnnoEbb7wBM2bMaKsfBJ6rbVT1RPRTEG0sI84HEwuDMN8YSCNVmGrkmi1dD/VVDLHmv43arxHn
s+FxptxGx3UxafJk/PYnP4nTTjsNTz7xJLZsfTNQC9pRDbijlWEYmD59OpYtX4bzzjsXmY6OOucn
cbzbWgCiJKUEAGg6tGIelZd+Bffxe8H27RqX7T6OnQNn5Q2wFy8DS6ZBGAIbQOR2Nrg+YmEQjGzg
icIRt+KYNm1a7SREOOtq5FNAGcW0aVM9n2/GcNoZZ2D+ggVY/8p6rH3pJezYuQuFQiEQVtlHwbsx
N/wk4nEcc8wxOP30pTj9zDNxzJQpknts1H5weGXH+7y3Fo8dYb5xkMn98AMmkEymoAvx61ESgjDG
YBompk491svbR8jIHPz3lCGVTo1YYZeEuYTFJm5ZmD59GgaHMpKdI8zB54wyimMmTx4x0Ybk9xKa
X6D2ll586qk4/YwzsHvXLjz33Gq8+uqrOHjwEMrlsrBY1vuSiBGIhmGgp6cHCxYswHnnnYOlp50G
XddRKpdHfPiDOR+6Zv7oGx/XgfnxPwG78lNgji0l9yB+yK8wPt4/tg379TXQH7kb5O3XGj6gLcF1
gXQn6DmXQ7voRmiTZwRJGQk8HV48Qw6nsNLqHhRW1w/RUszgbfFqIb0yB4C6MOdGHHxlrlSqYMxz
URXDhA3DkCbXS9/NYJheIQ3eFx4EVCwUsGPnTrz55lvYuXMnDh08iGKhiKptQ9cI4vE44okkJk7o
w4xZszBn9mzMnj0LmY4Or70NFo1G4dpag37w/y+Xy5IqwJNqivd0HCcYX0JqRTjZKBziPRmAvF9Q
tDGHKwUn6ZoOw9C9moJ+rog62RxhTl3X9aoQa5r0G0dwB/c4au7gmqYhHo9Lb+zR5KahbPr3dF0X
/Yf78e6773olxvftw779+5HL5VAslsDgyboVs5BKpzFx4gQcc8wxmD59GqZNn45JkyfDsiwwSj33
8wjyH3EBcKFd/4coXHgzUnFL0vnFpJQMBLGYic58P6qP/ADu6gfBSvmxe/EZJtjC0+BcchucWSdC
N2Po7RYSIkQtjJCvpR7nhRE4qoITz5gKgwhekslksi5hZKOklKIAiRyMsbrirIVCAflCITgl4FmJ
HMeFpnmeYwUhLJQQgm4hsQnnEDMed3Z0SMbNQqGAYaH4SDwel5ymxIIaXIB5ck2OwaEhyQbT0dEh
OU0Vi0UM+wFhjQqDuK4bBA/xBUtMfAl4RWvCNhix+Ei4MIgVi6GnQWEQx3VB0Djx63A2KxdnTaeR
FhK0SPLP6ouPUEpxuL9f8oPp7emR/EeGs1kU/DkFIPXDtm3k83nJMcuKxdDb14d43AqiGLnccESV
/3brdodAAF2DkRuEvupRFJ99ADi413vjt/vw+0E72syFIJfdgeJxS+FaSW9BGME7rK0z+tD1pn4A
Y+QIr/7hN4GYS6HZtk18I8UsSzp5cBwHZT8ldjgUW7zvmPrB39Yj9EPkEV2rR+MaKRZjJNUh/HcW
gaPhNbFfDfoq/TfCmDW6f1R7FADJ29Q0TSRTqcBJDfB2QvF4XFpkotiXGrWh1Qoa9X/SdMC1YWxc
A/OpH4Nsf31sMfp+ejGtZxKMldfBuvgm2JleuP39AHUbCnBUR5Io+jr/L2v8hTFxNNNBxRFuhaNO
YFH/QDbSQVu1jzS6HkWn/03bYKT21k0IqZtTMsJvo3I0WuhYhHs0vT7KYjsW+Y/sB6D5+iWIV5QA
/lvS3fYG4g9/H9r6VUC17C0I7R5nUBeIxaGdfj7IZXeAzDsJVULg2lXE41YwGETTvMIIQse95Js1
bsd1wSqV4CEj8Hz3+aTz4gr8OnVdr39c4DQNFWG7D59DFzhcSqV7IMwhFrvwOSzLkjiqlQoI355z
DiEVOx2FQw9zUCpzEM9VVeQwDMPTc/17UMYkDhbmEIuP+I4kccuSHk7btr0wWG6Y0nXpHgyQx5sx
eaw4B59TSmHFYjVh9TlcgUP3jZyiNV/iEAtq+BwVX3Y5R8yyYAoFS23b9t7Agj9CMw43zMGLjwiy
GYvFasfHhNTsI/49NEIkDhLm4LJ5BOQ/8g5A1w2kMhnkCwUMDmehDR+C+eJD0J59ANrQIT8X3xiO
9cCgzTsZsat+B84JZyJbsQE/kGPcCiMIemyxWMSgEChixWJSwsjIhUGE6iuZdFri4IVBOOoSX/o6
qCskTO3p7pb0w6Hh4eAMHvALgwgcUQqDDAwMBLH23CZghXRQsUhsKpWSOHhhENHq3Kg4pcTR1VWn
g4rjnUwmZY5QYRBu2RaTsg4MDkqZbhvZYESOcOHUZoVBuNwMDA5KunRXZ6fkH5IPcYSLj3A7T+AH
4NcJkGRzcFDa0jcsjCPK5hGU/5ZtAMSxYa57DMbT94HsfmtsMfr+dh8Tp8JaeT1iK6+D1jMRTrEI
lOQyUa2ce7fjUNFoe9hIDx0TotxjHJxB6rbSde687TS9Be+/NsaK1N+koeoyxoGJ0vgx00g2lwa8
7TAcKfmP/uQyCmfHZrg//SbM9U8D9jgE7cQTcM9cjviVn0R8/iJxBMfFp74l3Q0NHpwjwHE0+lH3
9wj3GI9+HHEbzDhwRMF4czSzwRyNfjSTi2gLgKbDfvERVB//EVj/++MQtEOgLTwV7JLbwBaeBpbu
CIor8AQUvBgGd2ixbbumF/seTzyogWianKrK/w0vDsF1UImDMU8v8/9fH43D1/cIP8f39SjOwQe5
GYfmZ/UR9XtD12vnzr6dwOH384+/mnEEhUH8PuqaJuWHY34RCZHD9VNmjcRBUCtwwo8bOYcnDl4/
uF2B+TUIAnH2fyNxADIHIRKHOxqHP0emaQYp5ylj0lhgFA4+p6J+LxWt8edIkptRODTfbhDYxCj1
io8Idh7RJwJiP0bgOFryHzOMiH4A/MEdwRIbCYx59+g7BrHLb4e1/LdAOroB5gVPlEqlwPkjmUwG
TjA8Nn04mw06UlcYgVIMDg15AuMLR2dHh+cU4d8jl89757k+RyKRQEcmE1yvVqvemTHnaFIYhHN0
dHQElXgJvMIghUKhxhGPI+P7GhB4yTWHhoZqD6uuo7urq+YgwxiGhoa8nAP+sGU6OpCIxwOOwA/A
54hbllecxBdAsTAI/AWhq7sbhsgxPOwZBv17dGQySCQSAUexWEQunw+uW5bl+Uz4HI7jYHBoSNJB
u7u6PKH0OYazWc/XwL9HJp1GMpkMOEqlErJ+iDaDZx/p6uyscbguhgYHJRtMV2en57Pvc2Sz2aBK
LgOQTqWQSqVqHOWyH+SD4KHq6uqqPax+YRDX9wMAIejq6kKMcwDIZbMolcsBRyqVQlrgKFcqXoJb
f05N00RXZ6dkg+GFcQIOvzAOv8dvUv6jqwBj9eJLpkGXXAD3opuRWLgYmlmzivJOhI+E+EPA30K1
taRxgYdg6yhclzz3RuEQj1iaFQYJOEL34L8jqG1jRa+yMAcLtVM8wpM8yUIc/HrA0aAwSKN+jMSB
0TgYq+No1g/+5gr71Y/E0WhOwwVlRIeggEP4eyMO4vc/qtwEY01kj9BAbkbiCMmmGKsh9mMkjt+k
/BswTMCxcURAXUA3wE44A+4lt8KZcxKobiByxd4PIxqc7bd8CzS3QYx2PVozj1zyjXbaMuZ7jPF6
xIYejeE4qjBozyRoB97FqGnBWgFjXoz+sbOhXXwzKkuWw4mnANeFTtosDOLnhwdqRSTE72qk9aId
4cIfotdcuDAIf2Akv+8WOVjIM4+/HQgvluGf8eoh3/I6jgZvfLFNjfohGp80IicSbcQRfuNzf3xx
rMTvinPK/N80ndMQR6PCII12HZLctMhRVxjEHwteDIb4Pg6tyuZIpdnEfohv3Q+S/JP8P32OOc/9
YmwWfRGuA6Q74Z55Cdzl14EcMxMd6VRtkJiXaCPw22cMyVQqcCwhxCuGIcanx0wz8L8mxMu1n8vl
JCNIJpPx9Fx/oPP5fJC/jzGGVDIZJEQgvhNEsVAItqumaXpFOAX9MCtykFphkICjUJD89pOJhKdL
+xyVSsUr8yQYBDNC0hFKKXLZbG2ifI7AiEQICoWClDsvkUggKXBUq1Xk/VJSPIYhk8lIRsBsLifp
uZl02o9/9ziKhULgWMJ9/1PJZI3D90cPOHTd4xCMgLlcztNzfd50Ou3p0v49CqH8DHHLQjKVCrar
tm0HCVi4faRD5GBeTkYpt2Qq5enS/j2KpZIUG2BZludTLxgEc6GkIxkh7yN8jsCIyjyfeUuQzVKp
JNXfi8ViQYJb4jv55HI5yQjIC+OwD6D8G+Y5l8F5+Smvtt5YtoTUBXQTZPH5sFdcD3vuKWCEQLOr
0LVM64VBfIHlQi0GgTDGpKIdmr9CShxMKNoxwgrICzgw39utWWEQ/vZvpzBIwOH/PnAEQq1YxZg4
fAcc/jYyBA7qe5KJpaHrOICmHGJhEC5APNgo4AjNaXiXgRAHsyypoEy4MAhvgxiMVSc3o3DEYjGZ
I1QYRIcc3dcOh2maktyEC+NorM3COEdJ/g3zpDNhLzoLztrHASN6MUOhNQCjIDMWwLriTuD0lShW
bDD/+GUkh5pRg1H4f8ewKDXz7270vZGCUSJxjNaf8ehHmxyRHGrGoR+RfztSO0UD1Rg5xmO8x4vj
gyz/BrESMK/+HTjbNgEDB1pQBXwvvs5eGCuvh3XxTTAmTPG2T6UBWaAEa3HdADaw0ood4OfS4m9F
a2x4kMMCFHaEqAv8EM6MpesNLK3hSUQUDuG+IGREAQi4QmPVMkfot5x3xO8JYzESBwv9loj35u0L
zUnYui/2I+ij94U6y7Q4Vo36FB67keSmTuZC8xy+R6Oxapkj9NsPsvwDAOnv72eMaNBeeRLavf8A
DB0a3bWXuoBpwVhyPsjld6A0Za5XxNF3CEmIoYqMoVQqeQYHr0WIx+PBuTQ/S+Xn6/y8VjzDdBwn
8Lnnzi6JREKazFKpJBmq4vF4cC7Nz1KrAodpmtIZvuO6HodwtJZIJIJjPMZYkGFlRI5qVTpfNw0D
lu+rzu0KpTCHn1CCPwxhDise92wCqPkrVAQOHhoa5hANjYlEQuIol8u1LSY8XwJ+vs79FcQz/DoO
SlEqlSShTCQSkqGqXC4H59LclyAmcNi2LZ3hG7oeBJtxA1WpVJKSiiTicSmpSB2Hn/c/4HAcVES5
EQKUAo5yWZLNMEelXPZealw2YzEvSGkk2fyQyb/BgxLIyR+BnupE7JG7gbde9Yx5pBaVxrf6MGMg
80+BddntsE5bjjLRUR3oDxoSM03EhIo6vJJpI+MNR6lclgxdpl9cQVy1xKIdpmmiIxarlSD3nYnE
hCCpEEe5UpE4GhYG8YMn+PXOUQqDJCMUBhGDbnihCv62MQyjYeVkMelIIpGQOKohDk3TZA7HQdWv
dMvb0NHRIel/+bBhMR6XOHi2Y9GjTuRwHAfZahUu16UJ8ZxKBD01bLyMW5bE0bAwiBA85LouhrNZ
qfQ5N5ByFItF6R58ARDvURmtMIhgWCSCgTSQzVJJ4oiFOCilMseHTP4NkcSdvwTxBScD655A5cVH
QXduASkXvXz7mR6wmQtgnn0JEmeshN7pZ28RouEIaewpyLeXQP3WSvptk+vh70nn7VH1qghtCJws
Gn9hTByswfeajVVb/WiwVW6mg7Y9H4SAcK4279FIhQm3Wfptg3P4VuQmil2BNbkeaV4+xPKvoKCg
oKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCg
oKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCg
oKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCg
oKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCg
oKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCg
oKCgoPDfEf8P/T85D/avw2IAAAAASUVORK5CYIIL'))
	#endregion
	$RemedyAdvancedQueryRunner.Icon = $Formatter_binaryFomatter.Deserialize($System_IO_MemoryStream)
	$Formatter_binaryFomatter = $null
	$System_IO_MemoryStream = $null
	$RemedyAdvancedQueryRunner.MaximizeBox = $False
	$RemedyAdvancedQueryRunner.Name = 'RemedyAdvancedQueryRunner'
	$RemedyAdvancedQueryRunner.RightToLeftLayout = $True
	$RemedyAdvancedQueryRunner.SizeGripStyle = 'Hide'
	$RemedyAdvancedQueryRunner.StartPosition = 'CenterParent'
	$RemedyAdvancedQueryRunner.Text = 'RemedyAdvancedQueryRunner'
	#
	# labelRemedyAdvanced
	#
	$labelRemedyAdvanced.AutoSize = $True
	$labelRemedyAdvanced.Font = [System.Drawing.Font]::new('Hobo Std', '26.2499962', [System.Drawing.FontStyle]'Bold')
	$labelRemedyAdvanced.Location = New-Object System.Drawing.Point(37, 3)
	$labelRemedyAdvanced.Name = 'labelRemedyAdvanced'
	$labelRemedyAdvanced.Size = New-Object System.Drawing.Size(325, 50)
	$labelRemedyAdvanced.TabIndex = 6
	$labelRemedyAdvanced.Text = 'Remedy Advanced'
	$labelRemedyAdvanced.add_Click($labelRemedyAdvanced_Click)
	#
	# buttonShowInRemedy
	#
	$buttonShowInRemedy.Font = [System.Drawing.Font]::new('Calibri', '14.25', [System.Drawing.FontStyle]'Bold')
	$buttonShowInRemedy.Location = New-Object System.Drawing.Point(214, 467)
	$buttonShowInRemedy.Name = 'buttonShowInRemedy'
	$buttonShowInRemedy.Size = New-Object System.Drawing.Size(155, 39)
	$buttonShowInRemedy.TabIndex = 12
	$buttonShowInRemedy.Text = 'Show In Remedy'
	$buttonShowInRemedy.UseVisualStyleBackColor = $True
	$buttonShowInRemedy.add_Click($buttonShowInRemedy_Click)
	#
	# TXTcriteria
	#
	$TXTcriteria.DisplayMember = '0'
	$TXTcriteria.ImeMode = 'NoControl'
	[void]$TXTcriteria.Items.Add('CI Name')
	[void]$TXTcriteria.Items.Add('Serial')
	[void]$TXTcriteria.Items.Add('Tag Number')
	$TXTcriteria.Location = New-Object System.Drawing.Point(22, 103)
	$TXTcriteria.MaxLength = 33
	$TXTcriteria.Name = 'TXTcriteria'
	$TXTcriteria.Size = New-Object System.Drawing.Size(121, 21)
	$TXTcriteria.Sorted = $True
	$TXTcriteria.TabIndex = 10
	$TXTcriteria.Text = 'Tag Number'
	$TXTcriteria.add_SelectedIndexChanged($TXTcriteria_SelectedIndexChanged)
	#
	# labelThisTakesABunchOfStr
	#
	$labelThisTakesABunchOfStr.AutoSize = $True
	$labelThisTakesABunchOfStr.BackColor = [System.Drawing.SystemColors]::Control 
	$labelThisTakesABunchOfStr.Location = New-Object System.Drawing.Point(149, 93)
	$labelThisTakesABunchOfStr.Name = 'labelThisTakesABunchOfStr'
	$labelThisTakesABunchOfStr.Size = New-Object System.Drawing.Size(195, 17)
	$labelThisTakesABunchOfStr.TabIndex = 8
	$labelThisTakesABunchOfStr.Text = 'This takes a bunch of strings and then'
	$labelThisTakesABunchOfStr.UseCompatibleTextRendering = $True
	$labelThisTakesABunchOfStr.add_Click($labelThisTakesABunchOfStr_Click)
	#
	# labelLoadsThemAllUpForYou
	#
	$labelLoadsThemAllUpForYou.AutoSize = $True
	$labelLoadsThemAllUpForYou.BackColor = [System.Drawing.SystemColors]::Control 
	$labelLoadsThemAllUpForYou.Location = New-Object System.Drawing.Point(154, 110)
	$labelLoadsThemAllUpForYou.Name = 'labelLoadsThemAllUpForYou'
	$labelLoadsThemAllUpForYou.Size = New-Object System.Drawing.Size(180, 17)
	$labelLoadsThemAllUpForYou.TabIndex = 7
	$labelLoadsThemAllUpForYou.Text = 'loads them all up for you in remedy'
	$labelLoadsThemAllUpForYou.UseCompatibleTextRendering = $True
	#
	# buttonCopy
	#
	$buttonCopy.Font = [System.Drawing.Font]::new('Calibri', '14.25', [System.Drawing.FontStyle]'Bold')
	$buttonCopy.Location = New-Object System.Drawing.Point(22, 467)
	$buttonCopy.Name = 'buttonCopy'
	$buttonCopy.Size = New-Object System.Drawing.Size(75, 36)
	$buttonCopy.TabIndex = 3
	$buttonCopy.Text = 'Copy'
	$buttonCopy.UseVisualStyleBackColor = $True
	$buttonCopy.add_Click($buttonCopy_Click)
	#
	# lbinput
	#
	$lbinput.Location = New-Object System.Drawing.Point(22, 130)
	$lbinput.Name = 'lbinput'
	$lbinput.Size = New-Object System.Drawing.Size(347, 331)
	$lbinput.TabIndex = 0
	$lbinput.Text = 'The maximum query size is 65 for direct URL
queries - lists above this number will open in multiple tabs
to get all the results in a single tab, please use the copy funtion
and paste these results into the advanced query function of remedy'
	$lbinput.add_Click($lbinput_Click)
	#
	# labelQueryRunner
	#
	$labelQueryRunner.AutoSize = $True
	$labelQueryRunner.Font = [System.Drawing.Font]::new('Hobo Std', '26.2499962', [System.Drawing.FontStyle]'Bold')
	$labelQueryRunner.Location = New-Object System.Drawing.Point(67, 43)
	$labelQueryRunner.Name = 'labelQueryRunner'
	$labelQueryRunner.Size = New-Object System.Drawing.Size(265, 50)
	$labelQueryRunner.TabIndex = 13
	$labelQueryRunner.Text = 'Query Runner!'
	$RemedyAdvancedQueryRunner.ResumeLayout()
	#endregion Generated Form Code

	#----------------------------------------------

	#Save the initial state of the form
	$InitialFormWindowState = $RemedyAdvancedQueryRunner.WindowState
	#Init the OnLoad event to correct the initial state of the form
	$RemedyAdvancedQueryRunner.add_Load($Form_StateCorrection_Load)
	#Clean up the control events
	$RemedyAdvancedQueryRunner.add_FormClosed($Form_Cleanup_FormClosed)
	#Show the Form
	return $RemedyAdvancedQueryRunner.ShowDialog()

} #End Function

#Call the form
Show-22_psf | Out-Null
# SIG # Begin signature block
# MIIGTwYJKoZIhvcNAQcCoIIGQDCCBjwCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUMmrhuSIburPSSkphBlhzCwhe
# Y5ugggOuMIIDqjCCApKgAwIBAgIBQjANBgkqhkiG9w0BAQsFADBlMQswCQYDVQQG
# EwJVUzESMBAGA1UECBMJTWlubmVzb3RhMRAwDgYDVQQHEwdPYWtkYWxlMQ0wCwYD
# VQQKEwRNTklUMSEwHwYDVQQDDBhqb3NodWEuZGFobGVAc3RhdGUubW4udXMwHhcN
# MjIwNjEwMTUzMDAwWhcNMjMwNjEwMTUzMDAwWjBlMQswCQYDVQQGEwJVUzESMBAG
# A1UECBMJTWlubmVzb3RhMRAwDgYDVQQHEwdPYWtkYWxlMQ0wCwYDVQQKEwRNTklU
# MSEwHwYDVQQDDBhqb3NodWEuZGFobGVAc3RhdGUubW4udXMwggEiMA0GCSqGSIb3
# DQEBAQUAA4IBDwAwggEKAoIBAQC5bRSSDwRwSCTQ/dcVwFWfoipJoEbAIPsObjuh
# KzM+CJv9OCP3sOabm171pC2Udkl7N+rW0PsRUJOymlzBq6kpogUW1ifRJC1UWydz
# 0p5wND6510f5zDIWcOMipvoB/GxNc1hlO0hl4Fyz+/isdTaz6X9vcCqL5j6D5s69
# p0yaSXe6W36035pRQRn41d/36mancyRyB6N4OwyslEXZz1UMPsUA/XSe9QydVb/i
# 2d1h6SEb17/03/S/BeRv/4EUT91M3eHi7GZn+EvuRPIzUyPqWaWI6YQl6CqgLCb3
# 1S+H3GBamdXc7v0miR9MGTRYpNPRGrSJyg3u5sUfqDZpF7nTAgMBAAGjZTBjMAwG
# A1UdEwEB/wQCMAAwHQYDVR0OBBYEFKenqdv4CdXhtw5ySKTRTR5BHtHGMB8GA1Ud
# IwQYMBaAFKenqdv4CdXhtw5ySKTRTR5BHtHGMBMGA1UdJQQMMAoGCCsGAQUFBwMD
# MA0GCSqGSIb3DQEBCwUAA4IBAQBxULRj2TMz5NXkbWpc53nii+dT+/odVc6PKiKu
# jJtyHqdOD50oFqzAlBKBYIfIFy0Xs4MOOACd1HKC+D550NuDfo13bManLSe0Y2SY
# S+tnsOSCuXgtagcee/iLJabW03VPjV5sXkwPgCVUtCOe2ZibyL234Zn1qDZSLcFk
# ORX6ryS7+3TAyXRXcHh8JRPok6utqcF9wg2Mtl6UBhLEqezTi55cfi43Z4hFPOXs
# ib0Pl4+KTmQXro16va293FHWbZroPetSVzS+FLSHF5ldKCzR3ygKLUJ9R+ENcxaA
# grWxfkO8kNodtMzHN+GrrKB2HYD0iw97PPzXziQiGSvJytpTMYICCzCCAgcCAQEw
# ajBlMQswCQYDVQQGEwJVUzESMBAGA1UECBMJTWlubmVzb3RhMRAwDgYDVQQHEwdP
# YWtkYWxlMQ0wCwYDVQQKEwRNTklUMSEwHwYDVQQDDBhqb3NodWEuZGFobGVAc3Rh
# dGUubW4udXMCAUIwCQYFKw4DAhoFAKB4MBgGCisGAQQBgjcCAQwxCjAIoAKAAKEC
# gAAwGQYJKoZIhvcNAQkDMQwGCisGAQQBgjcCAQQwHAYKKwYBBAGCNwIBCzEOMAwG
# CisGAQQBgjcCARUwIwYJKoZIhvcNAQkEMRYEFPDTc7XLDRp/EeZZPgikKKMhBpIm
# MA0GCSqGSIb3DQEBAQUABIIBAGviVK6ATD7WxPKPK+RSkA4E80BPI1/N8YlnnKTS
# h4kajkiSo72p4bDN+qwf5wIhMiyIuMSM7JIB/N3+kNcbgDO0ppTpDDNE+YoDTA4E
# GiCZHobsG3d6Kf3M7ZDeBzQyawAaqAhtusGpk4NWe20PaGCc97iGrdKO0M9pbaPL
# 85rDbFNbeaQ4uH59MFHg4k+yYK15tnIHwTjj0pp8jIU82sHXGBFtesHgXe1ytsWi
# l+8F+6niEVwA68XP+cLgoY5zlV96EcbOrC8rCQKRPqilOiGJKF2AN6J/M9YVkset
# +2bxeUYCNQ2BeI0BbeEz8T+pix6RfV4meuMWG/xbKErF84o=
# SIG # End signature block
