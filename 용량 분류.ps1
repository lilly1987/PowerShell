[int]$cnt=0
[int]$num=1
While(Test-Path $num){
    $num++
}
New-Item -Path "$num" -ItemType Directory -Force
Get-ChildItem -Path "bak\*png" |
	ForEach-Object { 'BEGIN' } { 
		#$_.Length
		#$cnt
		$cnt+=$_.Length
		if( $cnt -gt (1024*1024*49) ){
			While(Test-Path $num){
				$num++
			}
			New-Item -Path "$num" -ItemType Directory -Force
			$cnt=0
		}
		Move-Item -Destination "$num" -Path ([WildcardPattern]::Escape($_))
	} { 'END' }
$cnt
Read-Host "END"
