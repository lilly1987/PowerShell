# Set-ExecutionPolicy RemoteSigned

$filename = Read-Host -Prompt 'Input your file  name'
#$filename = "mynset.txt"

if( -not( Test-Path -LiteralPath "$filename" ) ){
	return
}

$myarray = [System.Collections.ArrayList]::new()

$FILE = Get-Content "$filename" -Encoding UTF8
$FILE | ForEach-Object {
	#$_ | Select-Object -Property *
	if ( $_ -match ",[\-_ ]*\d+_*[, ]?$" ){
		$Matches		
		[void]$myArray.Add($_)
	}else{
		$Matches
		$hash=$_.GetHashCode();
		[void]$myArray.Add("$_, $hash")
	}
	$_
}

[Environment]::CurrentDirectory = (Get-Location -PSProvider FileSystem).ProviderPath
[System.IO.File]::WriteAllLines("${filename}.rst", $myArray)
#$myArray | Out-File "${filename}.rst"

Read-Host "END"
