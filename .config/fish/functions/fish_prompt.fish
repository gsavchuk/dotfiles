set -g fish_prompt_pwd_dir_length 3

function fish_prompt
  echo -sn $USER ' '
  set_color $fish_color_cwd
  echo -n (prompt_pwd)
  set_color normal
  echo -n '> '
end
