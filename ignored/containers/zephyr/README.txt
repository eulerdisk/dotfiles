# fish

set ENV ~/zephyr_env

python3 -m venv $ENV/.venv

source $ENV/.venv/bin/activate.fish

pip install west

west init -m https://github.com/zephyrproject-rtos/zephyr $ENV/zephyr_latest

cd $ENV/zephyr_latest

west update
west packages pip --install
west zephyr-export
west completion fish > $HOME/.config/fish/completions/west.fish

# nrf connect
nrfutil sdk-manager toolchain install --ncs-version v3.4.1
nrfutil sdk-manager toolchain launch --ncs-version v3.4.1 --shell

nrfutil completion install bash --as-script >> ~/.bashrc

