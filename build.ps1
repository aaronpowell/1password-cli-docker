param(
    # Tag version
    [Parameter(Mandatory=$true)]
    [string]
    $Tag,

    # Push
    [switch]
    $Push
)

$imageName = 'aaronpowell/1password-cli'
$imageLatest = "$($imageName):latest"
$imageTag = "$($imageName):$Tag"

docker build -t $imageLatest .
docker build -t $imageTag .

git add -A
git commit -m "Updating to $Tag"
git tag $Tag

if ($Push) {
    git push
    git push --tags
}