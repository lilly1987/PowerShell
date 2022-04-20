
$ph="..\_music"
#$ph

$del=@(
"*.jpg",
"*.txt"
)

#$del

Get-ChildItem -Path "*" -Include "*.zip" | 
    ForEach-Object { 'begin' } { 
        #$_  | Select-Object -Property *
        $nm=$_.BaseName
        #$nm
        $p1=$ph+"\"+$nm
        #$p1 
        $p2=$p1 + "\"
        #$p2 
        if( -not( Test-Path -LiteralPath "$p1" ) ){
            "run $nm"
            Expand-Archive -LiteralPath $_ -DestinationPath $p1
            #Get-ChildItem -Path ([WildcardPattern]::Escape("$p2")) -Include $del -Recurs  # | Select-Object -Property * #-Force
            Remove-Item -Path ([WildcardPattern]::Escape("$p2")) -Include $del -Recurs #-Force
        }else{
            "not run $nm"
        }
    } { 'end' }


Read-Host "End"