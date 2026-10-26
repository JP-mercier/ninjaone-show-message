# Shows a message box on the logged-on user's screen.
# NinjaOne: set "Run As" to "Current Logged On User" (not System).
# Script variables (injected as env vars): message (required), title (optional)

$title   = if ($env:title) { $env:title } else { "IT Department" }
$message = $env:message

if (-not $message) {
    Write-Output "ERROR: no message provided"
    exit 1
}

Add-Type -AssemblyName System.Windows.Forms

# Hidden topmost owner so the box opens in front of other windows
$owner = New-Object System.Windows.Forms.Form
$owner.TopMost = $true

$result = [System.Windows.Forms.MessageBox]::Show($owner, $message, $title, 'OK', 'Information')
$owner.Dispose()

Write-Output "Message shown to $env:USERNAME, user clicked: $result"
