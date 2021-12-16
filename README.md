# mirror-buckets

A simple script to maintain a mirror copy of S3 buckets using rclone.

## To use:

1. Mount the following files/folders/volumes:
  * /media/destination - a directory to mirror the backups in, anything not in a bucket will be deleted!
  * /root/.config/rclone/rclone.conf - rclone configuration file.
  * /home/app/config.json - configuration for the scrpt, see below.
2. Optionally also set the following environment variables:
  * LOG_LEVEL - how much logging, default 2 (Info)

## Destination
The folder used as the destination will end up being populated similarly to:
```
destination
├── S3-connection-1
    └── bucket-name-1
        └── DATE_TIME
    └── bucket-name-2
        └── DATE1_TIME1
        └── DATE2_TIME2
└── S3-connection-2
    └── bucket-name
        └── DATE_TIME

```

## Configuration
```json
[{"backend": "backend name in rclone.conf", "bucket": "bucket name"}]
```
