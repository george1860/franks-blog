[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$clientID = "d7604f70-4e30-4e95-8d42-5bf04389ad63"
$tenantID = "b5e0c1a9-ebf0-4c5b-ae70-928f8a0cb5ba"
$resourceUrl = "api://e32f813c-59d8-4d20-848b-8dbe4c0ac73e"
$certThumbprint = "5b0298e49578aae37571fb03dfe1a694abc09c89"

Connect-AzAccount -CertificateThumbprint $certThumbprint -ApplicationId $clientID -Tenant $tenantID

$azAccessToken = Get-AzAccessToken -ResourceUrl $resourceUrl
$accessToken = $azAccessToken.Token
$headers = @{Authorization = "Bearer $accessToken" }
$contentType = 'application/json; charset=utf-8'
Invoke-RestMethod -ContentType $contentType -Uri 'https://localhost:7281/WeatherForecast' -Method Get -Headers $headers -Body $json -UseBasicParsing