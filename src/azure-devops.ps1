function rpshow {
    $repository = ((git remote get-url origin) -split '/')[-1]
    az repos show --repository $repository --detect --open > out-null
}

function prshow() {
    $branch_name = git branch --show-current
    $pr_id = az repos pr list --query "[?sourceRefName=='refs/heads/$branch_name']" | jq '.[0].pullRequestId'
    
    if ('null' -eq $pr_id) {
        Write-Output 'no PR found for current branch. creating one now.'
        $pr_id = az repos pr create --draft true --title "$branch_name" | jq '.pullRequestId'
    }
    az repos pr show --id $pr_id --open > out-null
}
