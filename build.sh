nc -vz github.com 443 || git config --global url."https://ghfast.top/https://github.com/".insteadOf "https://github.com/"

[[ -d "python3.8_env" ]] && rm -rf python3.8_env
python3.8 -m venv python3.8_env

source python3.8_env/bin/activate
pip install --upgrade pip setuptools wheel
pip install numpy

mkdir -p /sniper/python3.8_env/include
ln -sf /usr/include/python3.8 /sniper/python3.8_env/include/python3.8
ln -sf /usr/bin/python3.8-config /sniper/python3.8_env/bin/python3-config

SNIPER_ROOT=/sniper make -j"$(nproc)"