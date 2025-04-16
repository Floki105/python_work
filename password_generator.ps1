# Password Generator Script

# Function to generate a password
function Generate-Password {
    param (
        [int]$Length = 12,
        [string]$CharacterSets = "lud" # l=lowercase, u=uppercase, d=digits
    )

    $lowercase = "abcdefghijklmnopqrstuvwxyz"
    $uppercase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    $digits = "0123456789"
    $symbols = "!@#$%^&*"

    $characters = ""

    if ($CharacterSets -match "l") {
        $characters += $lowercase
    }
    if ($CharacterSets -match "u") {
        $characters += $uppercase
    }
    if ($CharacterSets -match "d") {
        $characters += $digits
    }
    if ($CharacterSets -match "s") {
        $characters += $symbols
    }

    if ($characters -eq "") {
        Write-Host "Error: No character sets selected."
        return
    }

    $password = ""
    for ($i = 0; $i -lt $Length; $i++) {
        $randomIndex = Get-Random -Maximum $characters.Length
        $password += $characters[$randomIndex]
    }

    return $password
}

# Get user input
$length = Read-Host "Enter the desired password length (default is 12)"
if (-not $length) {
    $length = 12
}

$characterSets = Read-Host "Enter character sets to use (l=lowercase, u=uppercase, d=digits, s=symbols, default is lud)"
if (-not $characterSets) {
    $characterSets = "lud"
}

# Generate and display the password
$password = Generate-Password -Length $length -CharacterSets $characterSets
Write-Host "Generated Password: $password"