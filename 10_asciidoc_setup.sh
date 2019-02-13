# java setup, for plantuml
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt -y update
sudo apt -y install oracle-java8-installer

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
  # 実行する処理、以下は例
  echo "{}" > ~/.config/Code/User/settings.json
fi
cat ~/.config/Code/User/settings.json | jq '. | .+ {"asciidoc.use_asciidoctor_js": false}' | tee ~/.config/Code/User/settings.json
cat ~/.config/Code/User/settings.json | jq '. | .+ {"asciidoc.asciidoctor_command": "asciidoctor -r asciidoctor-diagram"}' | tee ~/.config/Code/User/settings.json
