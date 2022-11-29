[int]$cnt=0
[int]$num=1
New-Item -Path "$num" -ItemType Directory -Force
Get-ChildItem -Path "bak\*png" |
	ForEach-Object { 'BEGIN' } { 
		#$_
		Move-Item -Destination "$num" -Path ([WildcardPattern]::Escape($_))
		$cnt++
		if( $cnt -eq 75 ){
			$num++
			New-Item -Path "$num" -ItemType Directory -Force
			$cnt=0
		}
	} { 'END' }
$cnt
Read-Host "END"

