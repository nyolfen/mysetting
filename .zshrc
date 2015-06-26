#------------------------
# 履歴設定
#------------------------
HISTSIZE=10240
HISTFILE=~/.zsh_history
SAVEHIST=10240
function history-all { history -E 1 } # 全履歴の一覧を出力する
setopt share_history                  # 履歴の共有化

# ビープ音無効
# ビープ音うるさいので無効
setopt nolistbeep


#------------------------
# プロンプト
#------------------------
#if [ ${USER} = "root" ]
#then
#	PROMPT="%{[31m%}[%n@%m]# %{[m%}"
#	RPROMPT="%{[31m%}[%~] %T%{[m%}"
#	PATH=${PATH}:/sbin/:/usr/sbin:/usr/local/sbin
#	HOME=/root
#else
#	# 左プロンプト
#	PROMPT="[%n@%m] $ "
#	# 右プロンプト
#	RPROMPT="[%~] %T"
#fi

# PROMPT=$'%{\e[0;31m%}%N %* ('$(cat /proc/loadavg | perl -anpe '$_=$F[1]')$') %%%{\e[m%} '  

autoload -Uz vcs_info
zstyle ":vcs_info:*" enable git
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'

precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
	 [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
	if [ ${USER} = "root" ]
	then
		PROMPT=$'%{\e[0;31m%}[%n @ %m] %* %%%{\e[m%} '
	else
		PROMPT="%1(v|%F{green}%1v%f|)"$'%{\e[0;33m%}[%n @ %m] %* %%%{\e[m%} '
#		PROMPT="%1(v|%F{green}%1v%f|)"
	fi
}
RPROMPT=$'%{\e[37m%}%/%{\e[m%}'


#-----------------------
# シェル変数周り
#-----------------------
setopt  auto_list               # 自動的に候補一覧を表示
setopt  auto_menu               # 自動的にメニュー補完する
setopt  auto_param_keys         # 変数名を補完する
# setopt  rm_star_silent          # "rm * " を実行する前に確認 しない
setopt no_flow_control         # C-s/C-q によるフロー制御をしない
setopt AUTO_PUSHD               # 自動で pushd (cd でも、pushd)
setopt PUSHD_IGNORE_DUPS        # pushd の 重複排除
setopt EXTENDED_GLOB            # 強力なグロaッピング
setopt correct					# 入力したコマンド名が間違っている場合には修正
setopt list_packed				#補完候補を詰めて表示する設定


## ^Dでログアウトしないようにする。
setopt ignore_eof

#-----------------------
# 補完関係
#-----------------------
# デフォルトの補完機能を有効
autoload -U compinit
compinit

# 補完侯補をEmacsのキーバインドで動き回る
#zstyle ':completion:*:default' menu select=1

# 補完の時に大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# 補完候補を ←↓↑→ で選択 完候補が色分け表示される
zstyle ':completion:*:default' menu select=1
# 補完候補を ←↓↑→ で選択 (補完候補が色分け表示される)
#zstyle ':completion:*:default' menu select true

#------------------------
# エイリアス
#------------------------
alias vi='/usr/bin/vim'
alias ls='ls -F'

# プロンプトのカラー表示を有効
autoload -U colors
colors

#先方予測
#autoload predict-on
#predict-on


# alias man='env LANG=ja_JP.UTF-8 /usr/local/bin/jman'

zstyle ':completion:*' list-colors 'di=36' 'ln=35'                                                                                                    
zstyle ':completion:*:default' menu select=1

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
