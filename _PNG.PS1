New-Item -Path '.\PNG' -ItemType Directory
$st=(get-date "2022-01-01")
$ed=(get-date "2022-04-01")
Get-ChildItem -Path "cache" -Recurse -File | 
	where { 
		($_.LastWriteTime -ge $st) -and
		($_.LastWriteTime -lt $ed)
	} |
	ForEach-Object { 'begin' } { 
		#$_
		#$_.CreationTime
		#$_.CreationTime -ge $st
		#$_.CreationTime -lt $ed		
		#$_.FullName
		New-Item -ItemType HardLink -Path .\PNG -Name $_.Name.replace('-','.') -Target $_.FullName
	} { 'end' }
	
