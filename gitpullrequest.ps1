cd C:\Users\kobrablack\Documents\gitlab
# git pull https://github.com/node123/webapp.git
function PullAllBranches() {
$branches = git branch
foreach($branch in $branches){
    $fixedBranch = $branch.Substring(2, $branch.Length - 2)
    $trackedExpression = "branch." + $fixedBranch + ".merge"
    $trackedBranch = git config --get $trackedExpression
 #  Write-Host($trackedBranch)
    if(![string]::IsNullOrEmpty($trackedBranch))
    {
        Write-Host('Pulling branch: ' + $fixedBranch)
        git checkout "$fixedBranch" | Out-Null
        git pull 
    }
    else {
        Write-Host('Branch "' + $fixedBranch + '" has no tracked remote')
    }
}
$data | Export-Excel $xlFile -Show -AutoSize
}
