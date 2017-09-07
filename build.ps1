param(
    # Tag version
    [Parameter(Mandatory=$true)]
    [string]
    $Tag,

    # Push
    [Parameter]
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
    docker push $imageLatest
    docker push $imageTag

    git push
    git push --tags
}