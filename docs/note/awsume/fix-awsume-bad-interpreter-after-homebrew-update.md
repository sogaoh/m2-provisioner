# awsume が `bad interpreter` で起動しない問題の対応メモ

作業日: 2026-11-13

## 症状

Homebrew の更新後、`awsume atlas` を実行すると次のエラーになった。

```
/Users/sogaoh/.local/bin/awsume:8: /Users/sogaoh/.local/bin/awsumepy: bad interpreter: /Users/sogaoh/.local/pipx/venvs/awsume/bin/python: no such file or directory
```

## 原因

- Homebrew の更新で `python@3.13` が削除され、`python@3.14` と `python@3.15` だけが残った。
- awsume は pipx の venv (`~/.local/pipx/venvs/awsume`) にインストールされている。
  - venv 内の `bin/python` は `/opt/homebrew/opt/python@3.13/bin/python3.13` へのシンボリックリンクだった。
  - リンク先が存在しないため `awsumepy` を起動できず、`bad interpreter` になった。
- `pipx list` では awsume と aws-sso-util の両方が `invalid interpreter` と表示された。

## 対応

pipx の venv を現在の Python で作り直した。

```sh
pipx reinstall-all
```

- awsume 4.5.4 を再インストールした。`awsume-console-plugin` も自動で inject し直された。
- aws-sso-util 4.33.0 を再インストールした。
- 再作成後の venv は Python 3.15.2 を使う。

## 確認

```sh
pipx list                  # 警告が出ないこと
awsumepy --version         # 4.5.4
aws-sso-util --version     # 4.33.0
```

- `awsume --version` は実体がシェル関数 (`source awsume` のエイリアス) のため、直接実行すると
  "not sourced" の警告が出る。動作確認には `awsumepy --version` を使うか、シェル内で `awsume` を実行する。

## 再発時の対処

Homebrew で Python のメジャー (マイナー) バージョンが変わり、同じエラーが出たら次を実行する。

```sh
pipx reinstall-all
hash -r    # コマンドのパスキャッシュをクリア (必要な場合)
```

直らない場合はターミナルを開き直す。

## 補足

- このリポジトリ (m2-provisioner) の設定ファイルは変更していない。
- 個別に直したい場合は `pipx reinstall awsume` や `pipx reinstall aws-sso-util` でもよい
  (`awsume-console-plugin` は reinstall 時に再 inject される)。
