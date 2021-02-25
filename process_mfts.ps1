if ( $args.count -ne 2)
{
    write-host "USAGE:  multi_mft2csv.ps1 indir outdir"
    Exit
}

#$indir=$args[0]
#$outdir=$args[1]

$indir  = Convert-Path $args[0]
$outdir = Convert-Path $args[1]

write-host "INDIR:  $indir"
write-host "OUTDIR: $outdir"

$files = Get-ChildItem $indir

foreach ($f in $files)
{
    write-host "Handing file: $f"
    $subdir = $outdir + "\" + $f + "_mft2csv"
    $fullpath = $indir + "\" + $f
    New-Item -Path $subdir -ItemType directory
    & .\Mft2Csv64.exe /MftFile:$fullpath /OutputPath:$subdir
}
