# Sorgt dafür, dass Symbole wie ✅ korrekt angezeigt werden
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# 1. .env laden und Umgebungsvariablen setzen
if (Test-Path ".env") {
    Get-Content .env | ForEach-Object {
        if ($_ -notmatch "^#|^$") {
            $name, $value = $_ -split '=', 2
            if ($name -and $value) {
                [System.Environment]::SetEnvironmentVariable($name.Trim(), $value.Trim())
            }
        }
    }
    Write-Host "✅ .env geladen (Retries: $($env:GEMINI_MAX_RETRIES))" -ForegroundColor Cyan
}

# 2. GEMINI.md für den System-Prompt einlesen
$systemPrompt = ""
if (Test-Path "GEMINI.md") {
    $systemPrompt = Get-Content "GEMINI.md" -Raw
    Write-Host "✅ GEMINI.md Regeln für dieses Projekt aktiviert" -ForegroundColor Green
} else {
    Write-Host "⚠️ Keine GEMINI.md gefunden - Standard-Modus" -ForegroundColor Yellow
}

# 3. Interaktive CLI starten
# Wir nutzen -i (Prompt-Interactive), um die Regeln zu laden und im Chat zu bleiben
if ($systemPrompt -ne "") {
    npx @google/gemini-cli -i "$systemPrompt"
} else {
    npx @google/gemini-cli
}