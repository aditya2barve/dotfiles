# dotfiles

## bat

Download latest [release](https://github.com/sharkdp/bat/releases).

```bash
sudo dpkg -i bat*amd64.deb # (for desktop)
```

## ripgrep

```bash
sudo apt install ripgrep
```

## COC

Install nodejs LTS version. On Ubuntu:

```bash
curl -sL https://deb.nodesource.com/setup_14.x | sudo bash -
sudo apt install -y nodejs
node -v
```

Install these extensions.

- coc-markdownlint 1.11.1
- coc-yaml 1.3.1
- coc-sh 0.6.0
- coc-pyright 1.1.133
- coc-json 1.3.4

coc-pyright

For coc-pyright, install and link black and isort:

```bash
pip install black
sudo ln -s `which black` /usr/local/bin/black

pip install isort
sudo ln -s `which isort` /usr/local/bin/isort
```

For coc-sh, install bash-language-server using `npm i -g bash-language-server`
