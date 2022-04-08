
$p0="download"
if( -not( Test-Path -LiteralPath "$p0" ) ){
	New-Item -Path "$p0" -ItemType Directory #| Out-Null
}
Get-ChildItem -Directory -LiteralPath $p0 | 
	ForEach-Object { 'begin' } { 
		#$_  | Select-Object -Property *
		$p1=".\$($_.parent)\$($_.name)"
		$p2=".\$($_.parent)-1\$($_.name)"
		if( -not( Test-Path -LiteralPath "$p2" ) ){
			New-Item -Path "$p2" -ItemType Directory | Out-Null
			Get-ChildItem -LiteralPath "$p1" -Exclude "*.txt" -File -Recurse | 
			#Get-ChildItem -Path ([WildcardPattern]::Escape($p1)) -Exclude "*.txt" -File | 
				ForEach-Object { "Begin $p1" } { 
					#$_
					$f="$p2\$($_.name)"
					if( -not( Test-Path -LiteralPath "$f" ) ){
						New-Item -ItemType HardLink -Path ([WildcardPattern]::Escape($p2)) -Name $_.Name -Target ([WildcardPattern]::Escape($_.FullName)) #| Out-Null
					}
				} { "End $p1" }
		}
	} { 'end' }
Read-Host "End"

# [Management.Automation.WildcardPattern]::Escape('test[1].txt')