# Copyright (c) 2016 Matt Pelland (matt@pelland.io)
# 
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this software and associated documentation files (the "Software"), to deal in
# the Software without restriction, including without limitation the rights to
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
# of the Software, and to permit persons to whom the Software is furnished to do
# so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

ZSH_THEME_NVM_PREFIX="{%{$fg_bold[yellow]%}"
ZSH_THEME_NVM_SUFFIX="%{$reset_color%}}"

nvm_prompt_info () {
    which "nvm" > /dev/null 2>&1

    if [ $? -ne 0 ]; then
        echo ""
    fi

    # local NVM_CURRENT="$(nvm current)"

    # if [[ "$NVM_CURRENT" != "system" ]]; then
    #     echo "${ZSH_THEME_NVM_PREFIX:=[}${NVM_CURRENT}${ZSH_THEME_NVM_SUFFIX:=]}"
    # fi

    echo ""
}

prompt_info () {
    local PROMPT_INFO="$(git_prompt_info)"
    PROMPT_INFO="${PROMPT_INFO}$(virtualenv_prompt_info)"
    PROMPT_INFO="${PROMPT_INFO}$(nvm_prompt_info)"

    if [[ "x${PROMPT_INFO}" != "x" ]]; then
        echo " ${PROMPT_INFO}"
    fi

    echo ""
}

PROMPT='['\
'%{$fg[green]%}%n%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%} '\
'%{$fg[red]%}%c%{$reset_color%}$(prompt_info)%{$reset_color%}]$ '

ZSH_THEME_GIT_PROMPT_PREFIX="(%{$fg_bold[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%} %{$fg_bold[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$reset_color%}"

ZSH_THEME_VIRTUALENV_PREFIX="{%{$fg_bold[yellow]%}"
ZSH_THEME_VIRTUALENV_SUFFIX="%{$reset_color%}}"
