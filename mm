[server]
host: 0.0.0.0
port: 7125
max_upload_size: 1024
klippy_uds_address: ~/printer_data/comms/klippy.sock

[authorization]
force_logins: False
cors_domains:
    https://my.mainsail.xyz
    http://my.mainsail.xyz
    http://*.local
    http://*.lan
trusted_clients:
    127.0.0.1
    10.0.0.0/8
    127.0.0.0/8
    169.254.0.0/16
    172.16.0.0/12
    192.168.0.0/16
    FE80::/10
    ::1/128

[file_manager]
enable_object_processing: True
queue_gcode_uploads:       True

[secrets]

[octoprint_compat]

[history]

[zeroconf]

[data_store]
temperature_store_size: 2400
gcode_store_size:       2000

[machine]
sudo_password: {secrets.machine_moonraker.password}

[job_queue]
load_on_startup: True

[power printer]
type: gpio
pin: gpiochip0/gpio26
initial_state: off
off_when_shutdown: false
#off_when_shutdown_delay: 300
on_when_job_queued: True
locked_while_printing: True
restart_klipper_when_powered: False
#restart_delay: 10
bound_services: klipper

[announcements]
subscriptions:
    mainsail

[update_manager]
refresh_interval: 12 
enable_auto_refresh: True
enable_system_updates: True
enable_packagekit: True
channel: dev

[update_manager mainsail]
type: web
channel: beta
repo: mainsail-crew/mainsail
path: ~/mainsail

[update_manager KlipperScreen]
type: git_repo
channel: dev
path: ~/KlipperScreen
origin: https://github.com/jordanruthe/KlipperScreen.git
env: ~/.KlipperScreen-env/bin/python
requirements: scripts/KlipperScreen-requirements.txt
install_script: scripts/KlipperScreen-install.sh
managed_services: KlipperScreen

[update_manager kiauh]
type: git_repo
path: ~/kiauh
origin: https://github.com/th33xitus/kiauh.git
is_system_service: False

[update_manager CanBoot]
type: git_repo
origin: https://github.com/Arksine/CanBoot.git
path: ~/CanBoot
is_system_service: False

[update_manager crowsnest]
type: git_repo
path: ~/crowsnest
origin: https://github.com/mainsail-crew/crowsnest.git
managed_services: crowsnest
install_script: tools/install.sh

[update_manager sonar]
type: git_repo
path: ~/sonar
origin: https://github.com/mainsail-crew/sonar.git
primary_branch: main
managed_services: sonar
install_script: tools/install.sh

[update_manager client z_calibration]
type: git_repo
path: ~/klipper_z_calibration
origin: https://github.com/protoloft/klipper_z_calibration.git
install_script: install.sh
managed_services: klipper

[update_manager led_effect]
type: git_repo
path: ~/klipper-led_effect
origin: https://github.com/julianschill/klipper-led_effect.git
is_system_service: False

[include octoeverywhere-system.cfg]

[update_manager voron-klipper-extensions]
type: git_repo
path: ~/voron-klipper-extensions
origin: https://github.com/voidtrance/voron-klipper-extensions.git
install_script: install-extensions.sh
managed_services: klipper