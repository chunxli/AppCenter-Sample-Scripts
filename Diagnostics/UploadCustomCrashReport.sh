# App Center APIs
# https://openapi.appcenter.ms/
echo '=== App Center APIs ==='

# Base URL
baseHost='api.appcenter.ms'
echo "Base URL: ${baseHost}"

# Prepare Basic Information
macOS_app_secret=''
iOS_app_secret=''
Android_app_secret=''

# Due to our retention policy, the timestamp cannot be more than 25 days in the past and 3 days in the future.

curl -X POST \
  'https://in.appcenter.ms/logs?Api-Version=1.0.0' \
  -H 'Content-Type: application/json' \
  -H "app-secret: ${macOS_app_secret}" \
  -H 'install-id: 00000000-0000-0000-0000-000000000001' \
  -d '{
  "logs":
  [
    {
        "type": "appleError",
        "timestamp": "2020-08-25T02:44:55.000Z",
        "appLaunchTimestamp": "2020-08-25T22:22:23.516Z",
        "id": "70D280D4-2343-400D-BE4C-301BB2B39ECA",
        "applicationPath": "iOS/salesforce",
        "osExceptionType": "CustomerIssue (TestIssue)",
        "osExceptionCode": "0",
        "osExceptionAddress": "0x00",
        "processName": "salesforce",
        "fatal": true,
        "isTestMessage": false,
        "device": {
          "appVersion": "10.0",
          "appBuild": "1",
          "sdkName": "custom.ios",
          "sdkVersion": "1.0.0",
          "osName": "iOS",
          "osVersion": "9.3",
          "model": "iPhone9,1",
          "locale": "en-US"
        },
        "userId": "70D280D4-2343-400D-BE4C-301BB2B39ECA",
        "fatal": true,
        "threads": [
         {
          "id": 0,
          "frames": [
            {
              "address": "0x000000018ada4d70",
              "code": "0x18ad87000 + 122224"
            },
            {
              "address": "0x0000000104463884",
              "code": "0x10445c000 + 30852"
            },
            {
              "address": "0x000000010438f640",
              "code": "0x104388000 + 30272"
            },
            {
              "address": "0x00000001b859fb64",
              "code": "0x1b8229000 + 3631972"
            }
          ]
        },
        {
          "id": 1,
          "frames": [
            {
              "address": "0x000000018bb4fce0",
              "code": "0x18baa2000 + 711904"
            },
            {
              "address": "0x000000018bbf7078",
              "code": "0x18baa2000 + 1396856"
            },
            {
              "address": "0x000000018baa8258",
              "code": "0x18baa2000 + 25176"
            },
            {
              "address": "0x000000018bb1c49c",
              "code": "0x18baa2000 + 500892"
            }
          ]
        },
        {
          "id": 3,
          "frames": [
            {
              "address": "0x000000018b755b9c",
              "code": "0x18b732000 + 146332"
            },
            {
              "address": "0x000000018b7dcd00",
              "code": "0x18b7ce000 + 60672"
            }
          ]
        }
      ],
      "binaries": [
        {
          "id": "d449e33d-7e74-379d-8b79-15ee104ed1df",
          "startAddress": "0x0000000104388000",
          "endAddress": "0x0000000104413fff",
          "name": "CrashProbeiOS",
          "path": "/var/containers/Bundle/Application/023013EA-0D58-4F6D-8B98-49E1372F4044/CrashProbeiOS.app/CrashProbeiOS",
          "primaryArchitectureId": 16777228,
          "architectureVariantId": 0
        },
        {
          "id": "5da23653-d126-39f0-bdcf-994b3019f92c",
          "startAddress": "0x000000010445c000",
          "endAddress": "0x0000000104467fff",
          "name": "CrashLibiOS",
          "path": "/private/var/containers/Bundle/Application/023013EA-0D58-4F6D-8B98-49E1372F4044/CrashProbeiOS.app/Frameworks/CrashLibiOS.framework/CrashLibiOS",
          "primaryArchitectureId": 16777228,
          "architectureVariantId": 0
        }
      ]
    },
    {
      "type": "errorAttachment",
      "contentType": "text/plain",
      "timestamp": "2020-08-25T22:23:23.516Z",
      "data": "aGVsbG8=",
      "errorId": "70D280D4-2343-400D-BE4C-301BB2B39ECA",
      "id": "7caaea8e-dab1-4588-993c-95de2d9a4fd1",
      "device": {
        "appVersion": "13.0",
        "appBuild": "1",
        "sdkName": "appcenter.android",
        "sdkVersion": "1.0.0",
        "osName": "android",
        "osVersion": "9.3",
        "model": "Pixel",
        "locale": "en-US"
      }
    },
    {
      "type": "errorAttachment",
      "contentType": "image/jpeg",
      "timestamp": "2020-08-05T22:23:23.516Z",
      "data": "UEsDBBQAAAAIAHR0BVFvQL/fBQAAAAYAAAAHAAAAQUFBLnR4dPPxAQEAUEsBAhQAFAAAAAgAdHQFUW9Av98FAAAABgAAAAcAAAAAAAAAAQAgAAAAAAAAAEFBQS50eHRQSwUGAAAAAAEAAQA1AAAAKgAAAAAA",
      "errorId": "70D280D4-2343-400D-BE4C-301BB2B39ECA",
      "id": "7caaea8e-dab1-4588-993c-95de2d9a4fd2",
      "device": {
        "appVersion": "13.0",
        "appBuild": "1",
        "sdkName": "appcenter.android",
        "sdkVersion": "1.0.0",
        "osName": "android",
        "osVersion": "9.3",
        "model": "Pixel",
        "locale": "en-US"
      }
    }
  ]
}'
