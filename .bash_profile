export AD_USERNAME="MTVNE\kublikd"

export JAVA_HOME="/Users/kublikd/programs/jdk-19.0.2.jdk/Contents/Home"
export GRADLE_HOME="~/programs/gradle-7.3.3"
export MVN_HOME="~/programs/apache-maven-3.6.3"
export TOOLS_HOME="~/tools"
export PATH=$GRADLE_HOME/bin:$MVN_HOME/bin:$TOOLS_HOME:$TOOLS_HOME/arc/:$PATH

colima start --cpu 8 --memory 12 --network-address
export TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE=/var/run/docker.sock
export DOCKER_HOST="unix://${HOME}/.colima/default/docker.sock"
sudo ln -sf $HOME/.colima/default/docker.sock /var/run/docker.sock


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
