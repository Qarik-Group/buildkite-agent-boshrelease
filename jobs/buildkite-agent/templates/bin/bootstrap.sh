#!/bin/bash

[[ -f /var/vcap/jobs/awscliv2/env ]] && {
  # shellcheck disable=SC1091
  source /var/vcap/jobs/awscliv2/env
}
