# BOSH release for buildkite-agent

This BOSH release and deployment manifest deploy a cluster of buildkite-agent.

## Usage

This repository includes base manifests and operator files. They can be used for initial deployments and subsequently used for updating your deployments:

```plain
export BOSH_ENVIRONMENT=<bosh-alias>
export BOSH_DEPLOYMENT=buildkite-agent
git clone https://github.com/cloudfoundry-community/buildkite-agent-boshrelease.git
bosh deploy buildkite-agent-boshrelease/manifests/buildkite-agent.yml
```

If your BOSH does not have Credhub/Config Server, then remember `--vars-store` to allow generation of passwords and certificates.

### Update

When new versions of `buildkite-agent-boshrelease` are released the `manifests/buildkite-agent.yml` file will be updated. This means you can easily `git pull` and `bosh deploy` to upgrade.

```plain
export BOSH_ENVIRONMENT=<bosh-alias>
export BOSH_DEPLOYMENT=buildkite-agent
cd buildkite-agent-boshrelease
git pull
cd -
bosh deploy buildkite-agent-boshrelease/manifests/buildkite-agent.yml
```
