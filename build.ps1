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

docker build -t $imageLatest --build-arg VERSION=$Tag .
docker build -t $imageTag --build-arg VERSION=$Tag .

git add -A
git commit -m "Updating to $Tag"
git tag -f $Tag

if ($Push) {
    git push
    git push --tags
    docker push $imageLatest
    docker push $imageTag
}