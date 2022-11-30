[int]$max=(1024*1024*49)
[int]$cnt=$max
[int]$num=1
Get-ChildItem -Path "bak\*png" |
	ForEach-Object { 'BEGIN' } { 
		#$_.Length
		#$cnt
		$cnt+=$_.Length
		if( $cnt -gt $max ){
			While(Test-Path $num){
				$num++
			}
			New-Item -Path "$num" -ItemType Directory -Force
			$cnt=0
		}
		#$_ | Select-Object -Property *
		([WildcardPattern]::Escape($_.DirectoryName + '\' + $_.BaseName + '.txt' ))
		Move-Item -Destination "$num" -Path ([WildcardPattern]::Escape($_.DirectoryName + '\' + $_.BaseName + '.txt' ))
		Move-Item -Destination "$num" -Path ([WildcardPattern]::Escape($_))
	} { 'END' }
$cnt
Read-Host "END"

