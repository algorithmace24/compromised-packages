#!/bin/bash
set -x

CGROUP_PATH="/sys/fs/cgroup/litellm_limit"
sudo mkdir -p "$CGROUP_PATH"
echo $((2048 * 1024 * 1024)) | sudo tee "$CGROUP_PATH/memory.max"
echo $$ | sudo tee "$CGROUP_PATH/cgroup.procs"

# python3 -v -X importtime -c "
# import sys
# def _trace_calls(frame, event, arg):
#     if event == 'call':
#         args = {k: v for k, v in frame.f_locals.items()}
#         print(f'CALL: {frame.f_code.co_filename}:{frame.f_lineno} {frame.f_code.co_name} args={args}')
#     return _trace_calls
# sys.settrace(_trace_calls)
# print('hello')
# " 2>&1

python3 -c "import litellm; print('LiteLLM imported successfully!'); print('Version:', litellm.__version__)"