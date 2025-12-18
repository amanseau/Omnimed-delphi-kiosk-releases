param(
	[string]$GithubUser,
	[string]$GithubToken
)

if (-not $GithubToken) {
    Write-Host "Please provide the github token as an input parameter."
    exit
}

# Set the remote URL for fetch operations
$fetchUrl = "https://${GithubUser}:${GithubToken}@github.com/Omnimed/Omnimed-delphi-kiosk-releases.git"
git remote set-url origin $fetchUrl

# Set the remote URL for push operations
$pushUrl = "https://${GithubUser}:${GithubToken}@github.com/${GithubUser}/Omnimed-delphi-kiosk-releases.git"
git remote set-url --push origin $pushUrl

Write-Host "Git remote URLs updated successfully."