# Packer image for wireguard on scaleway

## Requirement

* Packer

## Env variable

In purpuse to build the image you will need to set some environement variable.
This packer work for the zone `fr-par-1` with a debian-buster image on `DEV1-S`
You may want to change this by finding an image [here](https://gist.github.com/QuentinBrosse/d8ece883ec0dbcc2dabd2d453945b4fb) and change variable `image` and `type` in the packer file 

```sh
export SCW_ACCESS_KEY=""
export SCW_SECRET_KEY=""
export SCW_DEFAULT_ZONE=
export SCW_DEFAULT_PROJECT_ID=
```

## Build 

To create the image just run : 
```sh
packer build packer.json
```
