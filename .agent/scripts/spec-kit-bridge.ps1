# Agency → Spec-Kit Bridge Script
# Syncs Artifacts/ (source of truth) to .specify/ (Spec-Kit CLI compatibility)

param(
    [string]$FeatureName = "",
    [switch]$DryRun = $false
)

$ErrorActionPreference = "Stop"

# --- Configuration ---
$ArtifactsRoot = "Artifacts"
$SpecifyRoot = ".specify"

if (-not $FeatureName) {
    Write-Host "Usage: .\spec-kit-bridge.ps1 -FeatureName '001-my-feature' [-DryRun]" -ForegroundColor Yellow
    exit 1
}

$SpecFeatureDir = Join-Path $SpecifyRoot "specs" $FeatureName
$ContractsDir = Join-Path $SpecFeatureDir "contracts"

# --- Ensure directories exist ---
if (-not $DryRun) {
    New-Item -ItemType Directory -Force -Path $SpecFeatureDir | Out-Null
    New-Item -ItemType Directory -Force -Path $ContractsDir | Out-Null
}

Write-Host "`n=== Agency -> Spec-Kit Bridge ===" -ForegroundColor Cyan
Write-Host "Feature: $FeatureName" -ForegroundColor Cyan
Write-Host "Mode: $(if ($DryRun) { 'DRY RUN' } else { 'LIVE' })" -ForegroundColor Cyan
Write-Host ""

# --- Sync Map ---
$SyncMap = @(
    @{
        Source      = "$ArtifactsRoot/00_Governance/CONSTITUTION.md"
        Dest        = "$SpecifyRoot/memory/constitution.md"
        Description = "Constitution"
    },
    @{
        Source      = "$ArtifactsRoot/01_Strategy/STRATEGY.md"
        Dest        = "$SpecFeatureDir/spec.md"
        Description = "Strategy -> spec.md (Vision section)"
        AppendMode  = $false
    },
    @{
        Source      = "$ArtifactsRoot/02_Specs/BRD.md"
        Dest        = "$SpecFeatureDir/spec.md"
        Description = "BRD -> spec.md (Stories section)"
        AppendMode  = $true
    },
    @{
        Source      = "$ArtifactsRoot/03_Architecture/SAD.md"
        Dest        = "$SpecFeatureDir/plan.md"
        Description = "SAD -> plan.md"
        AppendMode  = $false
    },
    @{
        Source      = "$ArtifactsRoot/03_Architecture/research.md"
        Dest        = "$SpecFeatureDir/research.md"
        Description = "research.md"
    },
    @{
        Source      = "$ArtifactsRoot/04_Database/data-model.md"
        Dest        = "$SpecFeatureDir/data-model.md"
        Description = "data-model.md"
    },
    @{
        Source      = "$ArtifactsRoot/04_Database/SCHEMA.sql"
        Dest        = "$SpecFeatureDir/schema.sql"
        Description = "SCHEMA.sql"
    },
    @{
        Source      = "$ArtifactsRoot/05_Planning/SPRINT_*_BACKLOG.md"
        Dest        = "$SpecFeatureDir/tasks.md"
        Description = "Sprint Backlogs -> tasks.md (latest)"
        PickLatest  = $true
    }
)

# --- API Contracts (glob) ---
$apiFiles = Get-ChildItem -Path "$ArtifactsRoot/07_API_Specs/PHASE_*_API.yaml" -ErrorAction SilentlyContinue
foreach ($apiFile in $apiFiles) {
    $SyncMap += @{
        Source      = $apiFile.FullName
        Dest        = Join-Path $ContractsDir $apiFile.Name
        Description = "API Contract: $($apiFile.Name)"
    }
}

# --- Execute Sync ---
$synced = 0
$skipped = 0

foreach ($item in $SyncMap) {
    $sourcePath = $item.Source

    # Handle glob/wildcard for PickLatest
    if ($item.PickLatest) {
        $candidates = Get-ChildItem -Path $sourcePath -ErrorAction SilentlyContinue | Sort-Object LastWriteTime -Descending
        if ($candidates.Count -gt 0) {
            $sourcePath = $candidates[0].FullName
        } else {
            Write-Host "  [SKIP] $($item.Description) - Source not found" -ForegroundColor DarkGray
            $skipped++
            continue
        }
    }

    if (-not (Test-Path $sourcePath)) {
        Write-Host "  [SKIP] $($item.Description) - Source not found ($sourcePath)" -ForegroundColor DarkGray
        $skipped++
        continue
    }

    if ($DryRun) {
        Write-Host "  [DRY] Would copy: $sourcePath -> $($item.Dest)" -ForegroundColor Yellow
    } else {
        if ($item.AppendMode -and (Test-Path $item.Dest)) {
            Write-Host "  [APPEND] $($item.Description)" -ForegroundColor Green
            Add-Content -Path $item.Dest -Value "`n`n---`n"
            Get-Content $sourcePath | Add-Content -Path $item.Dest
        } else {
            Write-Host "  [COPY] $($item.Description)" -ForegroundColor Green
            Copy-Item -Path $sourcePath -Destination $item.Dest -Force
        }
    }
    $synced++
}

Write-Host "`n=== Bridge Complete ===" -ForegroundColor Cyan
Write-Host "Synced: $synced | Skipped: $skipped" -ForegroundColor Cyan
