if ( $args.count -ne 4)
{
    write-host "USAGE:  autovol.ps1 volatility_exe image profile outdir"
    Exit
}

#$indir=$args[0]
#$outdir=$args[1]

$vol     = Convert-Path $args[0]
$image   = $args[1]
$profile = $args[2]
$outdir  = Convert-Path $args[3]

write-host "IMAGE:   $image"
write-host "PROFILE: $profile"
write-host "OUTDIR:  $outdir"

& $vol -f $image --profile=$profile pslist >> $outdir"\pslist.txt"
& $vol -f $image --profile=$profile pstree >> $outdir"\pstree.txt"
& $vol -f $image --profile=$profile psxview >> $outdir"\psxview.txt"

& $vol -f $image --profile=$profile connscan >> $outdir"\connscan.txt"
& $vol -f $image --profile=$profile sockets >> $outdir"\sockets.txt"
& $vol -f $image --profile=$profile netscan >> $outdir"\netscan.txt"

& $vol -f $image --profile=$profile cmdline >> $outdir"\cmdline.txt"
& $vol -f $image --profile=$profile consoles >> $outdir"\consoles.txt"
& $vol -f $image --profile=$profile cmdscan >> $outdir"\cmdscan.txt"


