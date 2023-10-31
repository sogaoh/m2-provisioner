# m2-provisioner
My PC (M2 Mac) provisioner

since 
- [my previous "mba-provisioner"](https://github.com/sogaoh/mba-provisioner)
- [my previous "mba-provisioner2"](https://github.com/sogaoh/mba-provisioner2)


## Prerequisite

### OS
- macOS Sonoma ~  (zsh)
  - Mac mini (M2)

### Security
- **Allow full access to terminal.app**
    - System Environment Settings -> Security & Privacy 

### Install
- Install Homebrew (refs https://brew.sh/)
  ```zsh
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ```

- Install Ansible
  ```zsh
  brew update
  brew install ansible
  ```

- Install Rosetta (refs https://support.apple.com/HT211861)


### Prepare
- Clone this repository
  ```zsh
  git clone https://github.com/sogaoh/m2-provisioner.git
  ```

- Set `variables.yaml` (If run `make ma`)
  ```
  mackerel_agent_apikey: "<your_key>"
  ```


### Run Setup

```bash
cd /path/to/m2-provisioner
```

```bash
make prezto   # probably just for me
```

```bash
make dot      # probably just for me
```


```bash
make gui
```

#### optional

```bash
make ma   # install mackerel-agent
```

```bash
make ext  # via AppStore. 手動で入れても良い（大した数じゃないので）
```
