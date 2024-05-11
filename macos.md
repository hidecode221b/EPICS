# EPICS on macos

## Installation

This is a note for EPICS on MacOS MacBook Pro 13-inch, 2019 (Intel Core i5) with Python version 3.9.6.

### Preparation

https://docs.epics-controls.org/en/latest/getting-started/installation-linux.html

- install homebrew https://brew.sh/
- install Xcode from AppStore

After installation, `sudo xcodebuild -license` with password and `agree` in the license

```
brew install make
brew install gcc
brew install readline
```

### Make
```
mkdir $HOME/EPICS
cd $HOME/EPICS
git clone --recursive https://github.com/epics-base/epics-base.git
cd epics-base
make
```

### Environmental variables

```
vi $HOME/.zshrc
```

https://qiita.com/OritaK/items/28392bd6d24f1183dbd5

```
export EPICS_BASE=${HOME}/EPICS/epics-base
export EPICS_HOST_ARCH=$(${EPICS_BASE}/startup/EpicsHostArch)
export PATH=${EPICS_BASE}/bin/${EPICS_HOST_ARCH}:${PATH}
```
Paste it in .zshrc, and ":w" for save and ":q" for quit vi

https://www.gi.ce.t.kyoto-u.ac.jp/user/susaki/command/vi.html

### Test
Close the terminal and open it again
```
softIOC
> epics
```

Create "test.db" and save it in db folder. Move the current directory to db folder, and type.

```
softIoc -d test.db
```

Open the new terminal window, and type

```
caget temperature:water
caput temperature:water 21
camonitor temperature:water
```

## PyEpics

https://pypi.org/project/pyepics/

### Installation

```
pip3 install pyepics
```


### Test

Open new terminal window and type `python3`

```
hidekinakajima@Hidekis-MacBook-Pro ~ % python3
Python 3.9.6 (default, Feb  3 2024, 15:58:28) 
[Clang 15.0.0 (clang-1500.3.9.4)] on darwin
```

For example,
```
from epics import caget, caput, cainfo
print(caget('temperature:water'))
caput('temperature:water',34)
caget('temperature:water')
cainfo('temperature:water')
```


```
import epics
pv=epics.PV('temperature:water')
pv.get()
pv.put(40)
```



