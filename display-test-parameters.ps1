echo "There are several ways:

Write-Host: Write directly to the console, not included in function/cmdlet output. Allows foreground and background colour to be set.

Write-Debug: Write directly to the console,  $DebugPreference set to Continue  Stop.

Write-Verbose: Write directly to the console, if $VerbosePreference set to Continue or Stop.

The latter is intended  extra optional information, Write-Debug  debugging (so would seem to fit in this case).

Additional: In PSH2 (at least) scripts using cmdlet binding will automatically get the -Verbose  -Debug switch parameters, locally enabling Write-Verbose  Write-Debug (i.e. overriding the preference variables) as compiled cmdlets and providers do."
