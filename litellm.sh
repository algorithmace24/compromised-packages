#!/bin/bash
set -x

CGROUP_PATH="/sys/fs/cgroup/litellm_limit"
sudo mkdir -p "$CGROUP_PATH"
echo $((512 * 1024 * 1024)) | sudo tee "$CGROUP_PATH/memory.max"
echo $$ | sudo tee "$CGROUP_PATH/cgroup.procs"

python3 -c "print('hello')"

# python3 -c "import litellm; print('LiteLLM imported successfully!'); print('Version:', litellm.__version__)"