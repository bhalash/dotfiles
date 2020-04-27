################################################################################
# Add rvm to $PATH
################################################################################

path+=("${HOME}/.rvm/bin")

################################################################################
# Load nvm
################################################################################

export NVM_DIR="${HOME}/.nvm"

[ -s "${NVM_DIR}/nvm.sh" ] && source "${NVM_DIR}/nvm.sh"
[ -s "${NVM_DIR}/bash_completion" ] && source "${NVM_DIR}/bash_completion"

################################################################################
# Set Android Tools Path
################################################################################

export ANDROID_SDK_ROOT="${HOME}/Library/Android/sdk"
export ANDROID_HOME=$ANDROID_SDK_ROOT

path+=($ANDROID_SDK_ROOT/{emulator,platform-tools,tools})

################################################################################
# Set Gradle Version Used
################################################################################

export GRADLE_VERSION='4.10.1'
export CORDOVA_ANDROID_GRADLE_DISTRIBUTION_URL="https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-all.zip"

################################################################################
# cd => Window Title Hook
################################################################################

function -set-project-folder-title {
  if [[ $PWD =~ "Projects/sparklepony" ]]; then
    set-window-title 'Sparklepony'
  elif [[ $PWD =~ "Projects/gandalf" ]]; then
    set-window-title 'MyD4H'
  else
    set-window-title $(basename $PWD)
  fi
}

chpwd_functions=(${chpwd_functions[@]} "-set-project-folder-title")
-set-project-folder-title
