sudo apt -y install curl openssh-server ca-certificates postfix
curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash
sudo apt -y install gitlab-ce

# docker runner
curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh | sudo bash
sudo apt -y install gitlab-runner

# docker-runnerにdocker実行権限を与える
sudo usermod -aG docker gitlab-runner
sudo service docker restart

