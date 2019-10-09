# java setup, for plantuml
wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | sudo apt-key add -
sudo add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/
sudo apt -y update
sudo apt -y install adoptopenjdk-8-hotspot

sudo apt -y install ruby

# jsonを処理するやつ
sudo apt -y install jq

sudo gem install bundler
sudo gem install asciidoctor
sudo gem install asciidoctor-pdf --pre
sudo gem install asciidoctor-pdf-cjk
sudo gem install asciidoctor-diagram
sudo gem install coderay
sudo gem install rouge
sudo gem install concurrent-ruby

code --install-extension joaompinto.asciidoctor-vscode

# VSCode設定変更
# 設定ファイルがない場合は作る
if [[ ! -e ~/.config/Code/User/settings.json ]]; then
  # 空のjsonを出力しておく
  echo "{}" > ~/.config/Code/User/settings.json
  # I/Oの待ちを入れる。ないと書き終わる前にcatが走って失敗する
  sleep 1
fi
cat ~/.config/Code/User/settings.json | jq '. | .+ {"asciidoc.use_asciidoctor_js": false}' | tee ~/.config/Code/User/settings.json
sleep 1
cat ~/.config/Code/User/settings.json | jq '. | .+ {"asciidoc.asciidoctor_command": "asciidoctor -r asciidoctor-diagram"}' | tee ~/.config/Code/User/settings.json
